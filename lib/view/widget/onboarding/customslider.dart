import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch screen height using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    // Fetch screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
          children:[
            Image.asset(
                onBoardingList[i].image!,
                height: screenHeight * 0.4,
                width: screenWidth * 0.8, // for example, use 50% of the screen width
            ),
            SizedBox(height: screenHeight * 0.00001), // 5% of screen height
            Text(
                "title${i+1}".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ,color:AppColor.black),
            ),
            SizedBox(height: screenHeight * 0.03), // 3% of screen height
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child:Text(
                "body${i+1}".tr,
                style:TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 1.5 ,color:AppColor.grey ),
                textAlign: TextAlign.center,
              ),
            )
          ]
      ),
    );
  }
}
