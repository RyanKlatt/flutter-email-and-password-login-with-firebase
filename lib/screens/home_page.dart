import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        centerTitle: true,
        elevation: 6.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.defaultDialog(
                    radius: 20.0,
                    title: 'Logout?',
                    content: Text('Are you sure you want to log out?'),
                    textConfirm: 'Yes',
                    confirmTextColor: Colors.white,
                    textCancel: 'No',
                    cancelTextColor: Colors.blueGrey[500],
                    onConfirm: () {
                      _authController.signOut();
                    });
              },
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome Home!',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
