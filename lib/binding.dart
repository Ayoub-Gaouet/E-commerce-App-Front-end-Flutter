import 'package:ecommerceapp/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:get/get.dart';

import 'controller/auth/signup_controller.dart';
import 'core/class/crud.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud()) ;

    Get.lazyPut(() =>SignUpControllerImp(),fenix: true);
    Get.lazyPut(() =>ForgetPasswordControllerImp(),fenix: true);
    Get.lazyPut(() => LoginControllerImpl(),fenix: true );
  }
}