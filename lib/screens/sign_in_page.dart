import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/screens/register_page.dart';
import 'package:flutter_starter/services/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    void _clearFields() {
      _emailController.clear();
      _passwordController.clear();
    }

    void _goToRegisterAccountPage() {
      _clearFields();
      node.unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ),
      );
    }

    _signIn() async {
      bool signedIn = await context.read<AuthService>().signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (!signedIn) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Login Failed',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.error_outline,
                        color: Colors.red[400],
                        size: 40.0,
                      ),
                    ],
                  ),
                  content: Text('Email or Password not valid.'),
                  actions: [
                    FlatButton(
                      child: Text(
                        'Try Again',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
            barrierDismissible: true);
      }
    }

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
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) async => _signIn(),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.solidEyeSlash,
                                size: 18.0,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        RaisedButton(
                          onPressed: _signIn,
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
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        FlatButton(
                          onPressed: _goToRegisterAccountPage,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
