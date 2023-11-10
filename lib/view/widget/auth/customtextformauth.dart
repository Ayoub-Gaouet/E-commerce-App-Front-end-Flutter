import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTextFormAuth extends StatelessWidget{
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth(
      {key,
        required this.hintText,
        required this.labelText,
        required this.iconData,
        required this.controller,
        required this.valid,
        required this.isNumber,
        this.obscureText,
        this.onTapIcon
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        keyboardType: isNumber?TextInputType.numberWithOptions(decimal: true):TextInputType.text,
        validator:valid,
        obscureText: obscureText==null || obscureText== false ?false:true,
        decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: const TextStyle(color: AppColor.grey,fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0,horizontal:40),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(labelText.tr),
          ),
          suffixIcon: InkWell(child:Icon(iconData),onTap:onTapIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: AppColor.black),
          ),
        )
    );
  }
}