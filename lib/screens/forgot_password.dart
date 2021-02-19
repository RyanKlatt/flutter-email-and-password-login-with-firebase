import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: FlatButton(
            child: Text('go back'),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
