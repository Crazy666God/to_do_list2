import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';

class ButtonBack extends StatelessWidget {
  final double _size;

  ButtonBack(this._size);

  @override
  Widget build(BuildContext context) {
    TaskService taskService = Provider.of<TaskService>(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
         // color: Colors.yellow[200],
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        width: _size,
        child: Icon(Icons.arrow_back),
      ),
      onTap: () {
        taskService.updateStream();
        Navigator.pop(context);
      },
    );
  }
}