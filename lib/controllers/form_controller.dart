import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends FullLifeCycleController {
  bool clearEmailIcon;
  bool showPasswordIcon;
  bool hidePasswordIcon;
  bool hidePasswordText;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FocusNode node;

  @override
  void onInit() {
    super.onInit();
    clearEmailIcon = false;
    showPasswordIcon = false;
    hidePasswordIcon = false;
    hidePasswordText = true;
    node = FocusNode();
    print('oninit');
  }

  @override
  void onClose() {
    super.onClose();
    clearEmailIcon = false;
    showPasswordIcon = false;
    hidePasswordIcon = false;
    hidePasswordText = true;
    emailController.clear();
    passwordController.clear();
    node.unfocus();
    print('onClose');
  }

  void clearEmailField() {
    emailController.clear();
    clearEmailIcon = false;
    update();
  }

  void showClearEmailIcon() {
    if (emailController.text.isNotEmpty) {
      clearEmailIcon = true;
      update();
    } else {
      clearEmailIcon = false;
      update();
    }
  }

  void isPasswordIconHidden() {
    if (passwordController.text.isNotEmpty && showPasswordIcon == false) {
      hidePasswordIcon = true;
      hidePasswordText = true;
      update();
    } else if (passwordController.text.isNotEmpty &&
        hidePasswordIcon == false) {
      showPasswordIcon = true;
      hidePasswordText = false;
      update();
    } else if (passwordController.text.isEmpty) {
      hidePasswordIcon = false;
      showPasswordIcon = false;
      hidePasswordText = true;
      update();
    }
  }

  void showPasswordToggle() {
    if (hidePasswordText == true) {
      hidePasswordText = false;
      hidePasswordIcon = false;
      showPasswordIcon = true;
      update();
    } else {
      hidePasswordText = true;
      hidePasswordIcon = true;
      showPasswordIcon = false;
      update();
    }
  }
}
