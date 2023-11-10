import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Inter",
  appBarTheme: AppBarTheme(
    color:AppColor.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ,color:AppColor.black),
    headline2: TextStyle(fontWeight: FontWeight.bold, fontSize: 22 ,color:AppColor.black),
    bodyText1:TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 1.5 ,color:AppColor.grey ),
    bodyText2:TextStyle(fontWeight: FontWeight.w700, fontSize: 16, height: 1.5 ,color:AppColor.grey ),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ,color:AppColor.black),
    headline2: TextStyle(fontWeight: FontWeight.bold, fontSize: 22 ,color:AppColor.black),
    bodyText1:TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 1.5 ,color:AppColor.grey ),
    bodyText2:TextStyle(fontWeight: FontWeight.w700, fontSize: 16, height: 1.5 ,color:AppColor.grey ),
  ),
);