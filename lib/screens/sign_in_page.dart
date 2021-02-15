import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:flutter_starter/controllers/form_controller.dart';
import 'package:flutter_starter/screens/register_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Login Example App',
                  style: GoogleFonts.amaticSc(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 30.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        emailTextField(node),
                        SizedBox(
                          height: 8.0,
                        ),
                        passwordTextField(),
                        SizedBox(
                          height: 12.0,
                        ),
                        signInButton(),
                        SizedBox(
                          height: 12.0,
                        ),
                        registerButton(node),
                        forgotPasswordButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField emailTextField(node) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        Get.find<FormController>().nextFocus(node);
      },
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  TextField passwordTextField() {
    return TextField(
      onSubmitted: (_) {
        Get.find<AuthController>().login(
            _emailController.text.trim(), _passwordController.text.trim());
      },
      controller: _passwordController,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Stack(
          children: [
            Visibility(
              visible: false,
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidEyeSlash,
                  size: 18.0,
                ),
                onPressed: () {
                  print('hello');
                },
              ),
            ),
            Visibility(
              visible: false,
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidEye,
                  size: 18.0,
                ),
                onPressed: () {
                  print('hello');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton signInButton() {
    return RaisedButton(
      onPressed: () {
        Get.find<AuthController>().login(
            _emailController.text.trim(), _passwordController.text.trim());
      },
      padding: EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      elevation: 8.0,
      color: Colors.blueGrey[500],
      child: Text(
        'Sign In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  FlatButton registerButton(node) {
    return FlatButton(
      onPressed: () {
        Get.find<FormController>()
            .clearFields(_emailController, _passwordController, node);
        Get.to(() => RegisterPage());
      },
      child: Text(
        'Need an account? Register',
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }

  FlatButton forgotPasswordButton() {
    return FlatButton(
      onPressed: () {
        Get.find<FormController>().testFunction();
      },
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}
