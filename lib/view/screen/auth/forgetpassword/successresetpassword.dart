import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/successresetpassword_controller.dart';
import '../../../widget/auth/customButtomAuth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =Get.put(SuccessResetPasswordControllerImp());

    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child:Icon(Icons.check_circle_outline_rounded,size: 200,)),
                SizedBox(height: 20,),
                Text('Success'.tr, style: Theme.of(context).textTheme.headline1,),
                SizedBox(height: 20,),
                Text('descriptionSuccessResetPassword'.tr, style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child:  CustomButtomAuth(text: "Go To Login".tr, onPressed: () {
                    controller.goToLogin();
                  }),
                ),
              ],
            )
        ));
  }
}