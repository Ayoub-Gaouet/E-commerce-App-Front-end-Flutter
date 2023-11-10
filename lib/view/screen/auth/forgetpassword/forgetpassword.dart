import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/customButtomAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextformauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword ({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title:Text('Forget Password'.tr,
            style:Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColor.grey),),
        ),
        body: SafeArea(
          child:GetBuilder<ForgetPasswordControllerImp>(builder: (controller )=>
              HandlingDataRequest(statusRequest: controller.statusRequest!, widget:Container(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.02),
                child: Form(
                  key: controller.formstate,
                  child:  ListView(
                    children: [
                      const CustomTextTitleAuth(
                        text: 'Check Email',
                      ),
                      SizedBox(height: deviceHeight * 0.01,),
                      const CustomTextBodyAuth(text:"descriptionCheckEmail"),
                      SizedBox(height: deviceHeight * 0.03),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val){
                          return validInput(val!, 5, 100, "email");
                        },
                        controller: controller.email,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        iconData: Icons.email_outlined,
                      ),
                      SizedBox(height: deviceHeight * 0.04),
                      CustomButtomAuth(text: "Check", onPressed: () {
                        controller.goToVerfiyCode();
                      }),
                    ],
                  ),
                ),
              ),
            )
          )
        )
    );
  }

}
