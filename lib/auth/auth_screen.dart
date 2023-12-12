import 'package:flutter/material.dart';
import 'package:flutter_todo_empty/screens/login.dart';
import 'package:flutter_todo_empty/screens/signup.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool a = true;
  void navigate() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginScreen(navigate);
    } else {
      return SignupScreen(navigate);
    }
  }
}
