import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/widget/language/custompopup.dart';

abstract class OnBoardingController extends GetxController {
  void onSkip();
  void onPageChanged(int index);
  void onContinue();
  void onClickPopUpLang();
}
class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  void onContinue() {
    currentPage++;
    if (currentPage> onBoardingList.length-1){
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    }else {
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }
  @override
  void onClickPopUpLang(){
    Get.bottomSheet(
        const CustomPopUp()
    );

  }
  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }
  @override
  void onSkip() {
    myServices.sharedPreferences.setString("onboarding", "1");
    Get.offAllNamed(AppRoute.login);
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}