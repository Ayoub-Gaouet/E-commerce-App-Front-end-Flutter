
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomItems extends GetView<HomeControllerImp>{
  const CustomItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 16),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2 / 3, // Adjust this aspect ratio as needed
      ),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return Items(itemsModel: ItemsModel.fromJson(controller.items[index]));
      },
    );
  }
}
class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({Key? key, required this.itemsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              "${AppLink.imageItem}/${itemsModel.image}",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${translateDatabase(itemsModel.nameAr, itemsModel.name)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.primaryColor)),
                Text("${translateDatabase(itemsModel.category?.nameAr, itemsModel.category?.name)}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColor.primaryColor),
                    Icon(Icons.star, color: AppColor.primaryColor),
                    Icon(Icons.star, color: AppColor.primaryColor),
                    Icon(Icons.star, color: AppColor.primaryColor),
                  ],
                ),
                Text("\$${itemsModel.price}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}