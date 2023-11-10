import 'package:flutter/material.dart';

class CustomCartItem extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final int itemQuantity;
  final String itemImage;
  final Function()? onAdd;
  final Function()? onRemove;
  const CustomCartItem({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemImage, this.onAdd, this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        child: Image.network(itemImage), // Use Image.network for network images or Image.asset for local assets
      ),
      title: Text(itemName),
      subtitle: Text('\$${itemPrice.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35,
            child: IconButton(
              onPressed: onAdd,
              icon: Icon(Icons.add),
            ),
          ),
          Text("$itemQuantity"),
          Container(
            height: 25,
            child: IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
