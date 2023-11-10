import 'package:get/get.dart';

import '../../core/class/statusraquest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/forgetpassword/verifycode.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verfiyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  StatusRequest? statusRequest=StatusRequest.none;

  @override
  checkCode() {}
  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reSend(){
    verfiyCodeSignUpData.resendData(email!);
  }
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}