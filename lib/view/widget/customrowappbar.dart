import 'package:flutter/material.dart';

import 'home/iconbtnwithcounterheader.dart';

class CustomRowAppBar extends StatelessWidget{
  const CustomRowAppBar({Key? key,  this.onPressedFav,  this.onPressedIcon}) : super(key: key);
  final void Function()? onPressedIcon;
  final void Function()? onPressedFav;
  @override
  Widget build(BuildContext context) {
    return Row (
      children: [

        Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
        Spacer(),
        Row(
          children: [
            IconBtnWithCounterHeader(
              icon: Icons.favorite, // Use the appropriate IconData for the cart icon
              press: () {
                onPressedFav!();              },
            ),
            SizedBox(width: 10,),
            IconBtnWithCounterHeader(
              icon: Icons.notifications, // Use the appropriate IconData for the bell icon
              numOfitem: 3,
              press: () {
                onPressedIcon;
              },
            ),

          ],

        )

      ],
    );
  }
}