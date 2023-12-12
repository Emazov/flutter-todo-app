import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  TaskModel(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.isCompleted});

  factory TaskModel.create({required String name, DateTime? createdAt}) =>
      TaskModel(
          id: const Uuid().v1(),
          name: name,
          createdAt: createdAt ?? DateTime.now(),
          isCompleted: false);

  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  bool isCompleted;
}
