import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/register_page.dart';
import 'package:flutter_starter/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Sign In Example App'),
        centerTitle: true,
        elevation: 6.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => node.unfocus(),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.read<AuthService>().signIn(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                    },
                    elevation: 8.0,
                    color: Colors.blueGrey[500],
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _goToRegisterAccountPage(context),
                    child: Text(
                      'Need an account? Register',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToRegisterAccountPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }
}
