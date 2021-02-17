import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  bool clearEmailIcon = false;
  bool showPasswordIcon = false;
  bool hidePasswordIcon = false;
  bool hidePasswordText = true;

  @override
  void onInit() {
    super.onInit();
    print('oninit');
  }

  @override
  void onClose() {
    super.onClose();
    print('close');
  }

  void clearEmailField(_emailController) {
    _emailController.clear();
    clearEmailIcon = false;
    update();
  }

  void showClearEmailIcon(_emailController) {
    if (!_emailController.text.isEmpty) {
      clearEmailIcon = true;
      update();
    } else {
      clearEmailIcon = false;
      update();
    }
  }

  void isPasswordIconHidden(_passwordController) {
    if (!_passwordController.text.isEmpty && showPasswordIcon == false) {
      hidePasswordIcon = true;
      hidePasswordText = true;
      update();
    } else if (!_passwordController.text.isEmpty && hidePasswordIcon == false) {
      showPasswordIcon = true;
      hidePasswordText = false;
      update();
    } else if (_passwordController.text.isEmpty) {
      hidePasswordIcon = false;
      showPasswordIcon = false;
      hidePasswordText = true;
      update();
    }
  }

  void showPassword() {
    hidePasswordText = false;
    hidePasswordIcon = false;
    showPasswordIcon = true;
    update();
  }

  void hidePassword() {
    hidePasswordText = true;
    hidePasswordIcon = true;
    showPasswordIcon = false;
    update();
  }

  void clearFields(_emailController, _passwordController, node) {
    _emailController.clear();
    _passwordController.clear();
    clearEmailIcon = false;
    hidePasswordIcon = false;
    showPasswordIcon = false;
    node.unfocus();
  }

  void nextFocus(node) {
    node.nextFocus();
  }

  void testFunction() {
    print('test');
  }
}
