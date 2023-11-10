import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/iconbtnwithcounterheader.dart';

class CustomRowAppBarProductDetails extends StatelessWidget{
  const CustomRowAppBarProductDetails({Key? key, this.onPressedIcon}) : super(key: key);
  final void Function()? onPressedIcon;
  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
        ),
        Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
        Spacer(),
        Row(
          children: [
            IconBtnWithCounterHeader(
              icon: Icons.search, // Use the appropriate IconData for the bell icon
              press: () {},
            ),
          ],

        )

      ],
    );
  }
}