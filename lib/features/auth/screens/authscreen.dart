import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginView = true;
  bool _rememberUser = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoginView
          ? LoginWidget(
              rememberUser: _rememberUser,
              onRememberChanged: (value) {
                setState(() {
                  _rememberUser = value ?? false;
                });
              },
              onSwitchToSignUp: () {
                setState(() {
                  _isLoginView = false;
                });
              },
            )
          : Column(
              children: [
                Expanded(
                  child: MultiStageSignUpForm(
                    onSwitchToLogin: () {
                      setState(() {
                        _isLoginView = false;
                      });
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLoginView = true;
                    });
                  },
                  child: Text('Already have an account? Log In'),
                ),
              ],
            ),
    );
  }
}
