import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/class/statusraquest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/auth/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool isvisible = true;
  StatusRequest? statusRequest=StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());


  changeVisibility() {
    isvisible = isvisible == true ? false : true;
    update();
  }


  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != confirmPassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }


  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}