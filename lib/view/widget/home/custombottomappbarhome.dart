import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CusttomBottomAppBarHome extends GetView<HomeScreenControllerImp> {
  const CusttomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width / 5;

    return BottomAppBar(
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              controller.ListPage.length,
              ((index) {
                return CustomButtonAppBar(
                  textbutton: controller.bottomappbar[index]["title"],
                  icon: controller.bottomappbar[index]["icon"],
                  onPressed: () {
                    controller.changePage(index);

                  },
                  isPressed: controller.currentPage == index,
                  size: buttonSize,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
