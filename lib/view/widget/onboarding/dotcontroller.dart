import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller)=> Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            onBoardingList.length,
                (index) => AnimatedContainer(
              duration: const Duration(
                  milliseconds: 900
              ),
              margin: const EdgeInsets.only(right: 5),
              width: controller.currentPage == index ? 20 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: controller.currentPage == index ? AppColor.primaryColor : AppColor.bluefata7,
                borderRadius: BorderRadius.circular(10),
              ),
            )
        ),
      ],
    ));
  }
}