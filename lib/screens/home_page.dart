import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
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
                controller.signOut();
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
