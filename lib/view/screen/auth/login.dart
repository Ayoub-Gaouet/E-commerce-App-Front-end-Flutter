import 'package:ecommerceapp/core/class/handlingdataview.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/functions/alertexitapp.dart';
import 'package:ecommerceapp/core/functions/validinput.dart';
import 'package:ecommerceapp/view/widget/auth/customButtomAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerceapp/view/widget/auth/logoauth.dart';
import 'package:ecommerceapp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../widget/auth/customtextformauth.dart';

class Login extends StatelessWidget {
  const Login ({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Get.put(LoginControllerImpl());
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title:Text('Sign In'.tr,
            style:Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColor.grey),),
        ),
        body: SafeArea(
          child:WillPopScope (
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImpl>(builder: (controller)=>
                HandlingDataRequest(statusRequest: controller.statusRequest!, widget:Container(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.02),
                  child:Form(
                    key: controller.formstate,
                    child:  ListView(
                      children: [
                        const LogoAuth(),
                        SizedBox(height: deviceHeight * 0.02),
                        const CustomTextTitleAuth(
                          text: 'Welcome Back',
                        ),
                        SizedBox(height: deviceHeight * 0.01,),
                        const CustomTextBodyAuth(text:"descriptionSignIn"),
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
                        SizedBox(height: deviceHeight * 0.03),
                        GetBuilder<LoginControllerImpl>(builder: (controller)=>
                            CustomTextFormAuth(
                              obscureText: controller.isvisible,
                              isNumber: false,
                              onTapIcon: () {
                                controller.changeVisibility();
                              },
                              valid: (val){
                                return validInput(val!, 5, 30, "password");
                              },
                              controller: controller.password,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              iconData: Icons.lock_outline,
                            ),
                        ),
                        SizedBox(height: deviceHeight * 0.01),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            'Forget Password'.tr,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        CustomButtomAuth(text: "Sign In", onPressed: () {
                          controller.login();
                        }),
                        SizedBox(height: deviceHeight * 0.05),
                        CustomTextSignUpOrSignIn(
                          textone: "Don't have an account ? ",
                          texttwo: "Sign Up",
                          onTap: () {
                            controller.goToSignUp();
                          },
                        )
                      ],
                    ),
                  ),
                ),
            )
          )
        )
    )
    );
  }
}
