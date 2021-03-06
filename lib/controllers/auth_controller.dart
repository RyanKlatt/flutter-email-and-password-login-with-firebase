import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/form_controller.dart';
import 'package:flutter_starter/screens/home_page.dart';
import 'package:flutter_starter/screens/sign_in_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  @override
  void onInit() async {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.delete<FormController>();
      Get.offAll(() => HomePage());
    } catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error Creating User',
          'Email already in use.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          backgroundColor: Colors.red[900],
        );
      } else {
        Get.snackbar(
          'Error Creating User',
          'Email must be valid and password at least 6 charaters.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          backgroundColor: Colors.red[900],
        );
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.delete<FormController>();
      Get.offAll(() => HomePage());
    } catch (e) {
      Get.snackbar(
        'Error Logging In',
        'Email or password is invalid.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[900],
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.delete<FormController>();
      Get.offAll(() => SignInPage());
    } catch (e) {
      Get.snackbar('Error Logging Out', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
          radius: 20.0,
          title: 'Password Reset Email Sent',
          content: Text('Please check your email to reset password.'),
          textConfirm: 'Ok',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.delete<FormController>();
            Get.offAll(() => SignInPage());
          });
    } catch (e) {
      Get.snackbar(
        'Error Resetting Password',
        'Email is invalid.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[900],
      );
    }
  }
}
