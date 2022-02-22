import 'package:flutter/material.dart';
import 'package:to_do_list2/style.dart';
import 'package:to_do_list2/widgets/task_counter.dart';
import 'package:to_do_list2/widgets/buttons/button_add_task.dart';
import 'package:to_do_list2/widgets/task_list.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoList',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mainBackgroundColor(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: backgroundColorAppBar(),
          titleTextStyle: titleStyleAppBar(),
          title: Text('ToDoList'),
          actions: <Widget>[
            TaskCounter(),
          ],
        ),
        floatingActionButton: ButtonAddTask(),
        body: TaskList(),
      ),
    );
  }
}