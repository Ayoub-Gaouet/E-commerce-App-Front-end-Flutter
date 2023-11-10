import 'package:ecommerceapp/core/class/statusraquest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey <FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController telephone;
  late TextEditingController password;
  bool isvisible = true;
  StatusRequest? statusRequest=StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  changeVisibility() {
    isvisible = isvisible == true ? false : true;
    update();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          username.text, password.text, email.text, telephone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      print(statusRequest);
      if (StatusRequest.success == statusRequest) {
        print(response['status'] );
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
            "email":email.text
          });
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController() ;
    telephone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    telephone.dispose();
    password.dispose();
    super.dispose();
  }
}