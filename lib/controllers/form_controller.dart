import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  bool clearEmailIcon = false;

  void clearEmailField(_emailController) {
    _emailController.clear();
    clearEmailIcon = false;
    update();
  }

  void showEmailIcon(_emailController) {
    if (!_emailController.text.isEmpty) {
      clearEmailIcon = true;
      update();
    } else {
      clearEmailIcon = false;
      update();
    }
  }

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
