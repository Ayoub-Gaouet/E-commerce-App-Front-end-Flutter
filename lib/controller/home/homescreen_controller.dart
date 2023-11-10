import 'package:ecommerceapp/view/screen/cart.dart';
import 'package:ecommerceapp/view/screen/home/homepage.dart';
import 'package:ecommerceapp/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
changePage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> ListPage = [
    HomePage(),
    Cart(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Profile'),
      ],
    ),
    Settings(),
  ];
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "cart", "icon": Icons.shopping_cart},
    {"title": "profile", "icon": Icons.person},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int currentPage) {
    this.currentPage = currentPage;
    update();
  }
  
}