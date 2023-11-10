

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String telephone ) async {
    var response = await crud.postData(AppLink.signup, {
      "username" : username ,
      "email" : email ,
      "password" : password  ,
      "telephone" : telephone  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}