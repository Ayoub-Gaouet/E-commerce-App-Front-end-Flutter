
import 'package:flutter/material.dart';

import 'custombuttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price ;
  final String shipping ;
  final String totalprice ;
  const BottomNavgationBarCart({Key? key, required this.price, required this.shipping, required this.totalprice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Price:", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$price \$", style: TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Shipping:", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$shipping \$", style: TextStyle(fontSize: 16)))
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$totalprice \$", // Replace with the actual total price
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CustomButtonCart(
              textbutton: 'Place order',
              onPressed: () {},
            ),
          ],
        )
    );
  }
}