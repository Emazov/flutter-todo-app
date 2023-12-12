import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_todo_empty/models/task/task_model.dart';

class HiveDataStore {
  static const taskBoxName = 'tasks';
  final Box<TaskModel> box = Hive.box<TaskModel>(taskBoxName);

  Future<void> addTask({required TaskModel task}) async {
    await box.put(task.id, task);
  }

  Future<TaskModel?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> updateTask({required TaskModel task}) async {
    await task.save();
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  ValueListenable<Box<TaskModel>> listenToTasks() {
    return Hive.box<TaskModel>(taskBoxName).listenable();
  }
}
