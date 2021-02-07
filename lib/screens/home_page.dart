import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
                context.read<AuthService>().signOut(context);
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
