import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homescreen_controller.dart';
import '../../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller)=>Scaffold(
      bottomNavigationBar:CusttomBottomAppBarHome(),
      body: controller.ListPage.elementAt(controller.currentPage),
    ),
    );
  }
}