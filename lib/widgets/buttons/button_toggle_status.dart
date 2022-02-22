import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/tasks/task.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/style.dart';

class ButtonToggleStatus extends StatefulWidget {
  final double _size;
  final Task _task;
  ButtonToggleStatus(this._size, this._task);

  @override
  _ButtonToggleStatus createState() => _ButtonToggleStatus(_size, _task);
}

class _ButtonToggleStatus extends State<ButtonToggleStatus> {
  final double _size;
  final Task _task;
  _ButtonToggleStatus(this._size, this._task);

  @override
  Widget build(BuildContext context) {
    TaskService taskService = Provider.of<TaskService>(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColorTask(_task.getStatus()),
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        width: _size,
        child: Text(
          'Toggle\nstatus',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17),
        ),
      ),
      onTap: () {
        setState(() {
          taskService.toggleStatus(_task.getId());
        });
      },
    );
  }
}