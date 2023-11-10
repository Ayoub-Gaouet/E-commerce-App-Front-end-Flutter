import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String users_id, String items_id) async {
    var response = await crud
        .postData(AppLink.cartAdd+users_id.toString()+"/"+items_id.toString(), {});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String users_id, String items_id) async {
    var response = await crud.deleteData(AppLink.cartRemove+users_id.toString()+"/"+items_id.toString());
    return response.fold((l) => l, (r) => r);
  }
  
  getCountCart(String users_id, String items_id) async {
    var response = await crud.getData(AppLink.cartGetCountitems+users_id.toString()+"/"+items_id.toString());
    return response.fold((l) => l, (r) => r);
  }
  viewCart(String usersid) async {
    var response = await crud.getData(AppLink.cartView+usersid.toString(),);
    return response.fold((l) => l, (r) => r);
  }
}