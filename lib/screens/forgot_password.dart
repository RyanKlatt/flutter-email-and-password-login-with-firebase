import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:flutter_starter/controllers/form_controller.dart';
import 'package:flutter_starter/screens/register_page.dart';
import 'package:flutter_starter/screens/sign_in_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final FormController _formController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                  'Forgot Password?',
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
                        emailTextField(),
                        SizedBox(
                          height: 12.0,
                        ),
                        passwordResetButton(),
                        SizedBox(
                          height: 12.0,
                        ),
                        registerButton(),
                        rememberPasswordButton(),
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

  emailTextField() {
    return GetBuilder<FormController>(
      builder: (_) => TextField(
        focusNode: _formController.node,
        controller: _formController.emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        onChanged: (_) {
          _formController.showClearEmailIcon();
        },
        onSubmitted: (_) {
          _authController.sendPasswordResetEmail(
            _formController.emailController.text.trim(),
          );
        },
        decoration: InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email),
          suffixIcon: Visibility(
            visible: _formController.clearEmailIcon,
            child: GestureDetector(
              onTap: () => _formController.clearEmailField(),
              child: Icon(
                FontAwesomeIcons.timesCircle,
                size: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  RaisedButton passwordResetButton() {
    return RaisedButton(
      onPressed: () {
        _authController.sendPasswordResetEmail(
          _formController.emailController.text.trim(),
        );
      },
      padding: EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      elevation: 8.0,
      color: Colors.blueGrey[500],
      child: Text(
        'Reset Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  FlatButton registerButton() {
    return FlatButton(
      onPressed: () {
        Get.delete<FormController>();
        Get.to(() => RegisterPage());
      },
      child: Text(
        'Need an account? Register',
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }

  FlatButton rememberPasswordButton() {
    return FlatButton(
      onPressed: () {
        Get.delete<FormController>();
        Get.to(() => SignInPage());
      },
      child: Text(
        'Remember password? Sign In',
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}
