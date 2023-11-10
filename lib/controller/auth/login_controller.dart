import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusraquest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}
class LoginControllerImpl extends LoginController{
  GlobalKey <FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isvisible = true;
  StatusRequest? statusRequest=StatusRequest.none;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());



  changeVisibility() {
    isvisible = isvisible == true ? false : true;
    update();
  }

  @override
  login() async{
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      dynamic  response = await loginData.postdata(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        if (response['status'] == "success") {
          if(response['data']['approve']==true){
            myServices.sharedPreferences.setString("id", response['data']['id'].toString());
            myServices.sharedPreferences.setString("username", response['data']['username']);
            myServices.sharedPreferences.setString("email", response['data']['email']);
            myServices.sharedPreferences.setString("telephone", response['data']['telephone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.homePage);
          }else{
            Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {"email":email.text}
            );
          }
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Email Or Password Not Correct"
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value
    ;});
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}