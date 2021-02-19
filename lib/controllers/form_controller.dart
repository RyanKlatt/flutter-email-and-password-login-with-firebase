import 'package:get/get.dart';

class FormController extends FullLifeCycleController {
  bool clearEmailIcon;
  bool showPasswordIcon;
  bool hidePasswordIcon;
  bool hidePasswordText;

  @override
  void onInit() {
    super.onInit();
    clearEmailIcon = false;
    showPasswordIcon = false;
    hidePasswordIcon = false;
    hidePasswordText = true;
    print('oninit');
  }

  @override
  void onReady() {
    super.onReady();
    clearEmailIcon = false;
    showPasswordIcon = false;
    hidePasswordIcon = false;
    hidePasswordText = true;
    print('onReady');
  }

  @override
  void onClose() {
    super.onClose();
    clearEmailIcon = false;
    showPasswordIcon = false;
    hidePasswordIcon = false;
    hidePasswordText = true;
    print('onClose');
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

  void clearFields(_emailController, _passwordController, node) {
    _emailController.clear();
    _passwordController.clear();
    clearEmailIcon = false;
    hidePasswordIcon = false;
    showPasswordIcon = false;
    node.unfocus();
    update();
  }
}
