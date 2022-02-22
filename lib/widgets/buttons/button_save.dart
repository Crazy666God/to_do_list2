import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/tasks/temporary_task.dart';

class ButtonSave extends StatelessWidget {
  final double _size;

  ButtonSave(this._size);

  @override
  Widget build(BuildContext context) {
    TaskService taskService = Provider.of<TaskService>(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: _size,
        alignment: Alignment.center,
        child: Text(
          'Save',
          style: TextStyle(fontSize: 17),
        ),
      ),
      onTap: () {
        taskService.addTask(
          TemporaryTask().getTemporaryTask().getTitle(),
          TemporaryTask().getTemporaryTask().getText(),
        );
        TemporaryTask().clearTemporaryTask();
        taskService.updateStream();
        Navigator.pop(context);
      },
    );
  }
}