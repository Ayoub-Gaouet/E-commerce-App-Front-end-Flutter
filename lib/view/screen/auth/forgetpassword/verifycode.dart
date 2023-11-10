import 'package:ecommerceapp/controller/auth/forgetpassword/verifycode_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/class/handlingdataview.dart';

class VerfiyCode  extends StatelessWidget {
  const VerfiyCode  ({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title:Text('Verfification Code'.tr,
            style:Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColor.grey),),
        ),
        body: SafeArea(
          child:GetBuilder<VerifyCodeControllerImp>(builder: (controller )=>
              HandlingDataRequest(statusRequest: controller.statusRequest!, widget:Container(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.02),
                child:  ListView(
                  children: [
                    const CustomTextTitleAuth(
                      text: 'Check code',
                    ),
                    SizedBox(height: deviceHeight * 0.01,),
                    const CustomTextBodyAuth(text:"descriptionCheckCode"),
                    SizedBox(height: deviceHeight * 0.03),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(10),
                      numberOfFields: 5,
                      borderColor: AppColor.grey,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                      },
                      onSubmit: (String verificationCode) {
                        controller.goToResetPassword(verificationCode);
                      }, // end onSubmit
                    ),
                  ],
                ),
              )
          )
        )
      )
    );
  }
}
