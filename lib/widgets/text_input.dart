import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/tasks/task.dart';
import 'package:to_do_list2/tasks/temporary_task.dart';

class TextInput extends StatelessWidget {
  final bool thisIsAddingATask;
  final Task task;
  final bool thisIsTheTitle;

  TextInput(this.task,
      {this.thisIsTheTitle = false, required this.thisIsAddingATask, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TaskService taskService = Provider.of<TaskService>(context);
    if (thisIsTheTitle) {
      return Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.bottom,
        child: 
       TextFormField(
        style: _textStyle(),
        decoration: const InputDecoration(border: InputBorder.none),
        initialValue: task.getTitle(),
        onChanged: (str) {
          if (thisIsAddingATask) {
            TemporaryTask().setTitleTemporaryTask(str);
          }
          taskService.setTitleTask(task.getId(), str);
          taskService.updateStream();
        },
      ),);
    }
    return Scrollbar(
      child: TextFormField(
        style: _textStyle(),
        decoration: const InputDecoration(border: InputBorder.none),
        expands: true,
        minLines: null,
        maxLines: null,
        initialValue: task.getText(),
        onChanged: (str) {
          if (thisIsAddingATask) {
            TemporaryTask().setTextTemporaryTask(str);
          }
          taskService.setTextTask(task.getId(), str);
          taskService.updateStream();
        },
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    );
  }
}
