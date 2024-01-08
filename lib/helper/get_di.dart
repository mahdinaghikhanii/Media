import 'package:get/get.dart';

import '../controller/auth_controller.dart';

Future<Map<String, Map<String, String>>> init() async {
  Get.lazyPut(() => AuthController());

  Map<String, Map<String, String>> languages = {};
  return languages;
}
