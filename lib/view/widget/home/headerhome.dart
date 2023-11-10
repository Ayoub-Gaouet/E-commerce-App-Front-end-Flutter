import 'package:ecommerceapp/view/widget/home/searchfieldheader.dart';
import 'package:flutter/material.dart';

import 'iconbtnwithcounterheader.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchFieldHeader(titleappbar: "Search product", onPressedSearch:(){}),
        IconBtnWithCounterHeader(
          icon: Icons.shopping_cart, // Use the appropriate IconData for the cart icon
          press: () {},
        ),
        IconBtnWithCounterHeader(
          icon: Icons.notifications, // Use the appropriate IconData for the bell icon
          numOfitem: 3,
          press: () {},
        ),
      ],
    );
  }
}


