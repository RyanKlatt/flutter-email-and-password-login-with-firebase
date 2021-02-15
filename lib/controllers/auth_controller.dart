import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;

  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
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

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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
    } catch (e) {
      Get.snackbar('Error Logging Out', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
