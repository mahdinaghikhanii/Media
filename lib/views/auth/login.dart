import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/auth_controller.dart';
import '../../helper/responsive_helper.dart';
import '../../widgets/custom_text_fild.dart';
import 'widgets/pass_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _confirmPasswordFocus = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              Center(
                child: LottieBuilder.asset(
                  "assets/pas.json",
                  width: 350,
                  height: 350,
                ),
              ),
              const Positioned(
                bottom: 18,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Set your password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Text(
            "Please enter your password and follow\nthe rules",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 30, bottom: 10),
              child: CustomTextField(
                titleText: 'password'.tr,
                hintText: '8_character'.tr,
                controller: _passwordController,
                nextFocus: _confirmPasswordFocus,
                inputType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock,
                isPassword: true,
                showTitle: ResponsiveHelper.isDesktop(context),
                onChanged: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (!authController.showPassView) {
                      authController.showHidePass();
                    }
                    authController.validPassCheck(value);
                  } else {
                    if (authController.showPassView) {
                      authController.showHidePass();
                    }
                  }
                },
              )),
          authController.showPassView ? const PassView() : const SizedBox(),
          const SizedBox(height: 90),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: Get.width,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFC5F41),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: const Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )))
        ]);
      }),
    );
  }
}
