import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/imageasset.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/itemviewmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/favorite_controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsViewModel itemsViewModel;
  const CustomListItems( {Key? key, required this.itemsViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsViewModel);
      },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Flex(
                    direction: Axis.vertical,
                    children: [
                      CachedNetworkImage(
                        imageUrl: AppLink.imageItem + "/" + itemsViewModel.itemImage!,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 10) ,
                      Text(translateDatabase(itemsViewModel.itemNameAr, itemsViewModel.itemName)!,
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rating 3.5", textAlign: TextAlign.center),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 22,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      5,
                                          (index) => Icon(
                                        Icons.star,
                                        size: 15,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${itemsViewModel.itemPriceDiscount} \$",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans")),
                            GetBuilder<FavoriteController>(
                                builder: (controller) => IconButton(
                                    onPressed: () {
                                      if (controller.isFavorite[itemsViewModel.itemId] == 1) {
                                        controller.setFavorite(itemsViewModel.itemId, 0);
                                        controller.removeFavorite(itemsViewModel.itemId!.toString());
                                      } else {
                                        controller.setFavorite(itemsViewModel.itemId, 1);
                                        controller.addFavorite(itemsViewModel.itemId!.toString());
                                      }
                                    },
                                    icon: Icon(
                                      controller.isFavorite[itemsViewModel.itemId] == 1
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: AppColor.primaryColor,
                                    )
                                )
                            )
                          ],
                        ),
                      )
                    ]),
              ),
              if (itemsViewModel.itemDiscount != 0)Positioned(
                  top: 4,
                  left: 4,
                  child: Lottie.asset(AppImageAsset.sale, width: 40, height: 40)
              )
            ],
          ),
        ));
  }
}
