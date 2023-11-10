import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "Exit App".tr,
    content: Text("Are you sure to exit app?".tr),
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel".tr),
      ),
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("Exit".tr),
      ),
    ],
  );
  return Future.value(true);
}