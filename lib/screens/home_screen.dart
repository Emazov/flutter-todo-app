import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_todo_empty/data/task/hive_data_store.dart';
import 'package:flutter_todo_empty/models/task/task_model.dart';
import 'package:flutter_todo_empty/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HiveDataStore dataStore = HiveDataStore();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dataStore.listenToTasks(),
        builder: (BuildContext context, Box<TaskModel> box, Widget? child) {
          var tasks = box.values.toList();
          tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 6),
                          child: const Text(
                            'My today Tasks',
                            style: TextStyle(color: Colors.black),
                          ))),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: ListTile(
                                  title: TextField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter task name'),
                                    onSubmitted: (value) {
                                      Navigator.pop(context);
                                      // var currentDate = DateTime.now();
                                      DatePicker.showTimePicker(context,
                                          showSecondsColumn: false,
                                          showTitleActions: true,
                                          onChanged: (date) {},
                                          onConfirm: (date) {
                                        if (value.isNotEmpty) {
                                          var task = TaskModel.create(
                                              name: value, createdAt: date);
                                          dataStore.addTask(task: task);
                                        }
                                      }, currentTime: DateTime.now());
                                    },
                                    autofocus: true,
                                  ),
                                ),
                              );
                            });
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: Icon(Icons.add),
                      ))
                ],
              ),
              body: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  var task = tasks[index];
                  return Dismissible(
                      background: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('This task was deleted',
                              style: TextStyle(
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      onDismissed: (direction) {
                        dataStore.deleteTask(task: task);
                      },
                      key: Key(task.id),
                      child: TaskWidget(task: task));
                },
              ));
        });
  }
}
