import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/changelocal.dart';

class CustomPopUp extends GetView<LocaleController>  {
  const CustomPopUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,

        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Language".tr, style: Theme
                .of(context)
                .textTheme
                .headline1),
            const SizedBox(height: 20),
            Obx(() =>
                RadioListTile<String>(
                  title: Text("Arabic".tr, style: Theme.of(context).textTheme.bodyText1),
                  value: "ar",
                  groupValue: controller.selectedLang.value,
                  onChanged: (val) {
                    controller.selectedLang.value = val!;
                  },
                )),
            Obx(() =>
                RadioListTile<String>(
                  title: Text("English".tr, style: Theme.of(context).textTheme.bodyText1),
                  value: "en",
                  groupValue: controller.selectedLang.value,
                  onChanged: (val) {
                    controller.selectedLang.value = val!;
                  },
                )),
            ElevatedButton(
              onPressed: controller.continueButtonPressed,
              child: Text("Continue".tr),
            ),
          ],
        )
    );
  }
}
