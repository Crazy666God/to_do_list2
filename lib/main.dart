import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/to_do_list.dart';
import 'package:provider/provider.dart';

void main() {
  TaskService _taskService = TaskService();
  runApp(
    MultiProvider(
      providers: [
        Provider<TaskService>.value(value: _taskService),
      ],
      builder: (context, child) => ToDoList(),
    ),
  );
}
