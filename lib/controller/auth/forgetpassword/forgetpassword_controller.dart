import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/class/statusraquest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/auth/forgetpassword/CheckEmail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest? statusRequest=StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());



  @override
  checkEmail() {}
  @override
  goToVerfiyCode() async{
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCode, arguments: {
            "email":email.text
          });
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Email Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      print("Not Valid");
    }
  }
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}