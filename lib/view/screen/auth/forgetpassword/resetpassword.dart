import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customButtomAuth.dart';
import '../../../widget/auth/customtextformauth.dart';

class ResetPassword  extends StatelessWidget {
  const ResetPassword  ({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title:Text('Reset Password'.tr,
            style:Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColor.grey),),
        ),
        body: SafeArea(
          child:GetBuilder<ResetPasswordControllerImp>(builder: (controller )=>
              HandlingDataRequest(statusRequest: controller.statusRequest!, widget:Container(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.02),
                child: Form(
                  key: controller.formstate,
                  child:  ListView(
                    children: [
                      const CustomTextTitleAuth(
                        text: 'New Password',
                      ),
                      SizedBox(height: deviceHeight * 0.01,),
                      const CustomTextBodyAuth(text:"descriptionNewPassword"),
                      SizedBox(height: deviceHeight * 0.03),
                      GetBuilder<ResetPasswordControllerImp>(builder: (controller)=>
                        CustomTextFormAuth(
                          obscureText: controller.isvisible,
                          onTapIcon: () {
                            controller.changeVisibility();
                          },
                          isNumber: false,
                          valid: (val){
                            return validInput(val!, 5, 30, "password");
                          },
                          controller: controller.password,
                          hintText: 'Enter your new password',
                          labelText: 'New Password',
                          iconData: Icons.lock_outline,
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      GetBuilder<ResetPasswordControllerImp>(builder: (controller)=>
                        CustomTextFormAuth(
                          obscureText: controller.isvisible,
                          onTapIcon: () {
                            controller.changeVisibility();
                          },
                          isNumber: false,
                          valid: (val){
                            return validInput(val!, 5, 30, "password");
                          },
                          controller: controller.confirmPassword,
                          hintText: 'Re Enter your new password',
                          labelText: 'Confirm New Password',
                          iconData: Icons.lock_outline,
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.04),
                      CustomButtomAuth(text: "Save", onPressed: () {
                        controller.goToSuccessResetPassword();
                      }),

                    ],
                  ),
                ),
              ),
          )
          ),
        )
    );
  }

}
