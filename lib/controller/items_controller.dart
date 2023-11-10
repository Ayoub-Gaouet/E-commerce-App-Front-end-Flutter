import 'package:ecommerceapp/data/model/itemviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusraquest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/items.dart';
import 'home/home_controller.dart';

abstract class ItemsController extends GetxController{
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsViewModel itemsViewModel);

}
class ItemsControllerImp extends SearchMixController{
  MyServices myServices = Get.find();
  List categories = [];
  String? catid;
  int? selectedCat;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  @override
  intialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }
  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }


  @override
  getItems(String categoryid,) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    print("=============================== Category Id $categoryid ");
    var response = await itemsData.getData(categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  goToPageProductDetails(itemsViewModel) {
    Get.toNamed("productdetails", arguments: {"itemsViewModel": itemsViewModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }
}