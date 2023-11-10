import 'package:ecommerceapp/view/widget/onboarding/customslider.dart';
import 'package:ecommerceapp/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customrow.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;

    // Fetch screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate margin
    double responsiveMargin = screenWidth * 0.05; // This would be equivalent to 20px on a 400px wide screen.

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsiveMargin),
            child: const Column(
              children: [
                Expanded(
                    flex: 0,
                    child:  CustomRowOnBoarding()
                ),
                Expanded(
                  flex: 9,
                  child:  CustomSlider(),
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        CustomDotController(),
                        Spacer(flex: 10),
                        ContinueButtonOnBoarding(),
                        Spacer(flex: 2,),
                        SkipButtonOnBoarding(),
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
