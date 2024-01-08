import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';

class PassView extends StatelessWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Padding(
        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
        child: Wrap(children: [
          view('8 or_more character'.tr, authController.lengthCheck),
          view('1 number'.tr, authController.numberCheck),
          view('1 upper case'.tr, authController.uppercaseCheck),
          view('1 lower case'.tr, authController.lowercaseCheck),
          view('1 special character'.tr, authController.spatialCheck),
        ]),
      );
    });
  }

  Widget view(String title, bool done) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(done ? Icons.check : Icons.clear,
            color: done ? Colors.green : Colors.red, size: 12),
        Text(title,
            style: robotoRegular.copyWith(
                fontWeight: FontWeight.w600,
                color: done ? Colors.green : Colors.red,
                fontSize: 12))
      ]),
    );
  }
}
