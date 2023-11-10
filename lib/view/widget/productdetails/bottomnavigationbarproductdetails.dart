import 'package:ecommerceapp/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/itemviewmodel.dart';

class BottomNavigationBarProductDetails extends GetView<ProductDetailsControllerImp> {
  final ItemsViewModel itemsViewModel;

  BottomNavigationBarProductDetails({Key? key, required this.itemsViewModel,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 70,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   width: 50,
          //   height: 50,
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: Colors.grey),
          //   ),
          //   child: GetBuilder<FavoriteController>(
          //       builder: (controller) => IconButton(
          //           onPressed: () {
          //             if (controller.isFavorite[itemsViewModel.itemId] == 1) {
          //               controller.setFavorite(itemsViewModel.itemId, 0);
          //               controller.removeFavorite(itemsViewModel.itemId!.toString());
          //             } else {
          //               controller.setFavorite(itemsViewModel.itemId, 1);
          //               controller.addFavorite(itemsViewModel.itemId!.toString());
          //             }
          //           },
          //           icon: Icon(
          //             controller.isFavorite[itemsViewModel.itemId] == 1
          //                 ? Icons.favorite
          //                 : Icons.favorite_border_outlined,
          //             color: AppColor.primaryColor,
          //           )
          //       )
          //   )
          // ),
          // SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.goToPageCart();
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Go to Cart',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],)
              ),
            ),
          ),
        ],
      ),
    );
  }
}