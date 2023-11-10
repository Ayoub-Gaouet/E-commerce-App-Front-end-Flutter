import 'package:ecommerceapp/controller/home/home_controller.dart';
import 'package:ecommerceapp/core/functions/translatedatabase.dart';
import 'package:ecommerceapp/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomCategories extends GetView<HomeControllerImp>{
  const CustomCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Categories(
              i: index,
                categoriesModel: CategoriesModel.fromJson(controller.categories[index])),
          );
        },
      ),
    );
  }
}
class Categories extends GetView<HomeControllerImp> {
  const Categories({
    required this.categoriesModel, this.i});
  final CategoriesModel categoriesModel;
  final int? i;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goItems(controller.categories, i!, categoriesModel.id!.toString());
      },
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.network(
                "${AppLink.imageCategory}/${categoriesModel.image}",
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
                "${translateDatabase(categoriesModel.nameAr, categoriesModel.name)}",
                style: TextStyle(fontSize: 13, color: AppColor.black),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}