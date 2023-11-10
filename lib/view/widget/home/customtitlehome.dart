import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({Key? key, required this.title,required this.press,}) : super(key: key);
  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
            style: TextStyle(
                fontSize: 20,
                color:AppColor.black ,
                fontWeight: FontWeight.bold
            )
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More".tr,
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}

