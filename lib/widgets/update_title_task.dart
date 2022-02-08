import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';

class UpdateTaskTitle extends StatefulWidget {
  final TaskService service;
  final int id;

  const UpdateTaskTitle(this.service, this.id, {Key? key}) : super(key: key);

  @override
  _UpdateTaskTitle createState() => _UpdateTaskTitle();
}

class _UpdateTaskTitle extends State<UpdateTaskTitle> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        decoration: const InputDecoration(border: InputBorder.none),
        initialValue: widget.service.getTitleTask(widget.id),
        onChanged: (value) {
          widget.service.setTitleTask(widget.id, value.toString());
        },
      ),
    );
  }
}
