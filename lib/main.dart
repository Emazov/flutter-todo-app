import 'package:flutter/material.dart';
import 'package:flutter_todo_empty/auth/auth_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home: AuthScreen(),
    );
  }
}
