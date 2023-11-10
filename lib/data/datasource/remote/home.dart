import 'package:ecommerceapp/linkapi.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.getData(AppLink.home);
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.getData(AppLink.itemsSearch+search);
    return response.fold((l) => l, (r) => r);
  }
}