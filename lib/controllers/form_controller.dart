import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  void clearFields(_emailController, _passwordController, node) {
    _emailController.clear();
    _passwordController.clear();
    node.unfocus();
  }

  void nextFocus(node) {
    node.nextFocus();
  }

  void testFunction() {
    print('test');
  }
}
