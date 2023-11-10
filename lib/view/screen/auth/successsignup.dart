import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../widget/auth/customButtomAuth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =Get.put(SuccessSignUpControllerImp());
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
                Text('descriptionSuccessSignUp'.tr, style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,),
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