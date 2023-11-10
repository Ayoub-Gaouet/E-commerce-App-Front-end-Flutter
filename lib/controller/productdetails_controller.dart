import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusraquest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/model/itemviewmodel.dart';

abstract class ProductDetailsController extends GetxController {
  goToPageCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());
  late ItemsViewModel itemsViewModel;
  late StatusRequest statusRequest;
  int countItems =0;
  MyServices myServices = Get.find();


  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsViewModel = Get.arguments['itemsViewModel'];
    countItems= await getCountItems(itemsViewModel.itemId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  List <dynamic> subitems = [
    {"name": "red", "id": 1, "active": false, "color": Colors.red},
    {"name": "yellow", "id": 2, "active": false, "color": Colors.yellow},
    {"name": "black", "id": 3, "active": true, "color": Colors.black},
  ];
  getCountItems(String itemsid ) async {
    statusRequest = StatusRequest.loading;
    var response = await cartController.cartData.getCountCart(myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems =0;
        countitems = response['data'];
        print("=============================== Controller Countitems $countitems ");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  add() {
    cartController.add(itemsViewModel.itemId.toString());
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      cartController.delete(itemsViewModel.itemId.toString());
      countItems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  goToPageCart() {
    Get.toNamed(AppRoute.cart);
    cartController.refrechPage();
  }
}