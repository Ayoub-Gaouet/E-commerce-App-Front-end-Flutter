import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomCategoriesItems extends GetView<ItemsControllerImp>{
  const CustomCategoriesItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesItems(
            i: index,
            categoriesModel:
            CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}
class CategoriesItems extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const CategoriesItems({Key? key, required this.categoriesModel, required int this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoriesModel.id!.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                padding:const  EdgeInsets.only(right: 10, left: 10, bottom: 5),
                decoration: controller.selectedCat == i
                    ?const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 3, color: AppColor.primaryColor)))
                    : null,
                child: Text(
                  "${translateDatabase(categoriesModel.nameAr, categoriesModel.name)}",
                  style:
                  const TextStyle(fontSize: 20, color: AppColor.grey),
                ),
              ))
        ],
      ),
    );
  }
}