import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/view/screen/address/addressview.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceapp/view/screen/auth/signup.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/successsignup.dart';
import 'package:ecommerceapp/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerceapp/view/screen/cart.dart';
import 'package:ecommerceapp/view/screen/home/homescreen.dart';
import 'package:ecommerceapp/view/screen/items.dart';
import 'package:ecommerceapp/view/screen/language.dart';
import 'package:ecommerceapp/view/screen/myfavorite.dart';
import 'package:ecommerceapp/view/screen/onboarding.dart';
import 'package:ecommerceapp/view/screen/productdetails.dart';
import 'package:get/get.dart';

import 'view/screen/auth/login.dart';
List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page:() =>Language(),
      middlewares: [
        MyMiddleware()
      ]
  ),
  //auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: ()=>const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: ()=>const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: ()=>const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: ()=>const SuccessSignUp()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: ()=>const VerfiyCodeSignUp()),
  //home
  GetPage(name: AppRoute.homePage, page: ()=>const HomeScreen()),
  //onBoarding
  GetPage(name: AppRoute.onBoarding, page: ()=>const OnBoarding()),
  //items
  GetPage(name: AppRoute.items, page: ()=>const Items()),
  //productdetails
  GetPage(name: AppRoute.productDetails, page: ()=> ProductDetails()),
  //Favorite
  GetPage(name: AppRoute.myfavorite, page: ()=>const MyFavorite()),
  //cart
  GetPage(name: AppRoute.cart, page: ()=> Cart()),
  //address
  GetPage(name: AppRoute.addressview, page: ()=> AddressView()),

];
