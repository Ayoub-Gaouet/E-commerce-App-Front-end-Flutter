import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTextBodyAuth extends StatelessWidget{
  final String text;
  const CustomTextBodyAuth({Key? key, required this.text,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(text.tr,
        textAlign:TextAlign.center,
        style:Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: AppColor.grey),
      ),
    );
  }

}