import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:flutter_starter/screens/home_page.dart';
import 'package:flutter_starter/screens/sign_in_page.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? HomePage()
          : SignInPage();
    });
  }
}
