import 'package:ecommerceapp/data/model/itemviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusraquest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/home.dart';

abstract class  HomeController extends SearchMixController {
  initialData()  ;
  getdata() ;
  goItems(List categories, int selectedCat, String categoryid  ) ;
  goFavorite() ;

}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  HomeData homedata = HomeData(Get.find());
  List categories = [];
  List items = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username") ;
    id = myServices.sharedPreferences.getString("id") ;
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata() ;
    initialData();
    super.onInit();
  }
  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }
  @override
  goItems(categories,selectedCat , categoryid) {
    print("Category ID being passed: $categoryid");
    Get.toNamed(
        AppRoute.items,
        arguments: {
          "categories": categories,
          "selectedCat": selectedCat,
          "catid": categoryid
        }
    );
  }

  @override
  goFavorite() {
    Get.toNamed(AppRoute.myfavorite);
  }

  goToPageProductDetails(itemsViewModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsViewModel": itemsViewModel});
  }

}
class SearchMixController extends GetxController {
  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false ;
  HomeData homedata = HomeData(Get.find());
  List<ItemsViewModel> listdata =[] ;



  checksearch(val){
    if(val==""){
      statusRequest = StatusRequest.none;
      isSearch = false ;
    }
    update();
  }
  onSearch(){
    isSearch = true ;
    searchData();
    update();
  }
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsViewModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
