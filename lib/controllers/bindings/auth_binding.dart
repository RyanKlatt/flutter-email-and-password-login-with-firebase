import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:flutter_starter/controllers/form_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    //Get.lazyPut<FormController>(() => FormController(), fenix: true);
  }
}
