import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';

class ContinueButtonOnBoarding extends GetView<OnBoardingControllerImp>{
  const ContinueButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02), // use 2% of screen height
      height: screenHeight * 0.05, // use 5% of screen height
      child: MaterialButton(
        onPressed: () {
          controller.onContinue();
        },
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: 0), // use 20% of screen width
        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child:  Text('Continue'.tr,
          style: const TextStyle(
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
class SkipButtonOnBoarding extends GetView<OnBoardingControllerImp>{
  const SkipButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.03), // use 3% of screen height
      child:TextButton(
          onPressed: (){
            controller.onSkip();
          },
          child:  Text('Skip'.tr, style: const TextStyle(color: AppColor.black, fontSize:16),)
      ),
    );
  }
}