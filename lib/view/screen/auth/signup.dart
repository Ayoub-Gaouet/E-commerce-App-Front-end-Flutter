import 'package:ecommerceapp/controller/auth/signup_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/view/widget/auth/customButtomAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceapp/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerceapp/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformauth.dart';

class SignUp extends StatelessWidget {
  const SignUp ({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title:Text('Sign Up'.tr,
            style:Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColor.grey),),
        ),
        body: SafeArea(
          child:WillPopScope (
          onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(builder: (controller )=>
                HandlingDataRequest(statusRequest: controller.statusRequest!, widget:Container(
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.02),
                  child:Form(
                    key: controller.formstate,
                    child:  ListView(
                      children: [
                        const CustomTextTitleAuth(
                          text: 'Welcome',
                        ),
                        SizedBox(height: deviceHeight * 0.01,),
                        const CustomTextBodyAuth(text:"descriptionSignUp"),
                        SizedBox(height: deviceHeight * 0.03),
                        CustomTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                            controller: controller.username,
                            hintText: 'Enter your Username',
                            labelText: 'Username',
                            iconData: Icons.person_outline
                        ),
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
                        CustomTextFormAuth(
                            isNumber: true,
                            valid: (val){
                              return validInput(val!, 22788941, 11, "telephone");
                            },
                            controller: controller.telephone,
                            hintText: 'Enter your Telephone',
                            labelText: 'Telephone',
                            iconData: Icons.phone_outlined
                        ),
                        SizedBox(height: deviceHeight * 0.03),
                        GetBuilder<SignUpControllerImp>(builder: (controller)=>
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
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              iconData: Icons.lock_outline,
                            ),
                        ),
                        SizedBox(height: deviceHeight * 0.04),
                        CustomButtomAuth(text: "Sign Up", onPressed: () {
                          controller.signUp();
                        }),
                        SizedBox(height: deviceHeight * 0.05),
                        CustomTextSignUpOrSignIn(
                          textone: "Have an account?",
                          texttwo: "Sign In",
                          onTap: () {
                            controller.goToSignIn();
                          },
                        )
                      ],
                    ),
                  ),
                ),
            )
            ),
          ),
        )
    );
  }

}
