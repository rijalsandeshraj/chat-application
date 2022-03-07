import 'package:chat_application/controller/auth_controller.dart';
import 'package:chat_application/widgets/authentication/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;

  void _submitAuthForm(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    setState(() {
      _isLoading = true;
    });
    if (isLogin) {
      AuthController().signInWithFirebase(email, password, onException: (err) {
        setState(() {
          _isLoading = false;
        });
        AuthController().showError(err, ctx);
      });
    } else {
      AuthController().signUpWithFirebase(email, password, username: username,
          onException: (err) {
        setState(() {
          _isLoading = false;
        });
        AuthController().showError(err, ctx);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(submitFn: _submitAuthForm, isLoading: _isLoading),
    );
  }
}
