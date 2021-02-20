import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/auth_controller.dart';
import 'package:flutter_starter/controllers/form_controller.dart';
import 'package:flutter_starter/screens/sign_in_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
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
                  'Register Account',
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
                          height: 8.0,
                        ),
                        passwordTextField(),
                        SizedBox(
                          height: 12.0,
                        ),
                        signUpButton(),
                        SizedBox(
                          height: 12.0,
                        ),
                        haveAccountButton(),
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
        textInputAction: TextInputAction.next,
        onChanged: (_) {
          _formController.showClearEmailIcon();
        },
        onEditingComplete: () {
          _formController.node.nextFocus();
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

  passwordTextField() {
    return GetBuilder<FormController>(
      builder: (_) => TextField(
        controller: _formController.passwordController,
        onSubmitted: (_) {
          _authController.createUser(
            _formController.emailController.text.trim(),
            _formController.passwordController.text.trim(),
          );
        },
        onChanged: (_) {
          _formController.isPasswordIconHidden();
        },
        textInputAction: TextInputAction.done,
        obscureText: _formController.hidePasswordText,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: _formController.hidePasswordIcon,
                child: GestureDetector(
                  onTap: () => _formController.showPasswordToggle(),
                  child: Icon(
                    FontAwesomeIcons.eyeSlash,
                    size: 20.0,
                  ),
                ),
              ),
              Visibility(
                visible: _formController.showPasswordIcon,
                child: GestureDetector(
                  onTap: () => _formController.showPasswordToggle(),
                  child: Icon(
                    FontAwesomeIcons.eye,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton signUpButton() {
    return RaisedButton(
      onPressed: () {
        _authController.createUser(
          _formController.emailController.text.trim(),
          _formController.passwordController.text.trim(),
        );
      },
      padding: EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      elevation: 8.0,
      color: Colors.blueGrey[500],
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  FlatButton haveAccountButton() {
    return FlatButton(
      onPressed: () {
        Get.delete<FormController>();
        Get.to(() => SignInPage());
      },
      child: Text(
        'Have an account? Sign In',
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}
