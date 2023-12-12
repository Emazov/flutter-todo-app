import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_todo_empty/models/task/task_model.dart';
import 'package:flutter_todo_empty/screens/home_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  var box = await Hive.openBox<TaskModel>('tasks');
  for (var task in box.values) {
    if (task.createdAt.day != DateTime.now().day) {
      box.delete(task.id);
    }
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black))),
      home: const HomeScreen(),
    );
  }
}
