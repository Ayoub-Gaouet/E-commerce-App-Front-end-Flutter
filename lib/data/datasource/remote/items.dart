import 'package:ecommerceapp/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsData{
  Crud crud ;
  ItemsData(this.crud);
  getData(String id , String userId) async{
    var response = await crud.getData(AppLink.items+id.toString()+ "/"+userId.toString());
    return response.fold((l) => l, (r) => r);
  }
}