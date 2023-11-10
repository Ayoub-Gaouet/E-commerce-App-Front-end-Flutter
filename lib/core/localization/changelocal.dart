import 'package:ecommerceapp/core/constant/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/onboarding.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  RxString selectedLang = RxString('ar');
  Locale? language ;

  MyServices myServices = Get.find()  ;
  ThemeData appTheme = themeEnglish;

  changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferences.setString("lang", langcode) ;
    appTheme = langcode == "ar" ? themeArabic : themeEnglish ;
    Get.changeTheme(appTheme) ;
    Get.updateLocale(locale) ;
  }

  void continueButtonPressed() {
    changeLang(selectedLang.value);
    Get.offAll(() => const OnBoarding());
  }

  @override
  void onInit() {

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang") ;
    if (sharedPrefLang == "ar"){
      language = const Locale("ar")  ;
      appTheme = themeArabic ;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en")  ;
      appTheme = themeEnglish ;
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ;
      appTheme = themeEnglish ;
    }
    super.onInit();
  }

}