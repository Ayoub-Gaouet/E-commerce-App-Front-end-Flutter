import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class CustomRowOnBoarding extends GetView<OnBoardingControllerImp>{
  const CustomRowOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Fetch screen height using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    // Fetch screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(AppImageAsset.logo, width: screenWidth * 0.3, height: screenHeight * 0.05),
        const Spacer(),
        Container(
          width: screenWidth * 0.35,
          height: screenHeight * 0.055,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.white, // Change this value to change the border color
              width: 2.0, // Change this value for border width
            ),
            borderRadius: BorderRadius.circular(20.0), // Change this value for border radius
          ),
          child: TextButton.icon(
            onPressed: () {
              controller.onClickPopUpLang();
            },
            icon: Image.asset('assets/images/Globalization.png', width: screenWidth * 0.045, height: screenHeight * 0.03), // Your custom icon
            label: Text('Language'.tr, style: const TextStyle(color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w600)), // Your custom label
          ),
        ),
      ],
    );
  }
}
