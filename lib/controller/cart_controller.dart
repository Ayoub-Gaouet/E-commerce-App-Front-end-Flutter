import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusraquest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/cartmodel.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  double priceorders = 0.0;
  List<CartModel> data = [];
  int totalcountitems = 0;
  Map<String, dynamic> countPriceData = {};


  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("The product has been added to your cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("The product has been removed from your cart"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success" && response['data'] != null) {
          List dataresponse = response['data'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          countPriceData = response['countprise'];
          totalcountitems = countPriceData['totalcount'];
          priceorders = double.parse(countPriceData['totalprice'].toString());
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  refrechPage() {
    resetVarCart();
    view();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
