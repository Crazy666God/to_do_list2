import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';

class UpdateTaskText extends StatefulWidget {
  final TaskService service;
  final int id;

  const UpdateTaskText(this.service, this.id, {Key? key}) : super(key: key);

  @override
  _UpdateTaskText createState() => _UpdateTaskText();
}

class _UpdateTaskText extends State<UpdateTaskText> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        decoration: const InputDecoration(border: InputBorder.none),
        expands: true,
        maxLines: null,
        minLines: null,
        initialValue: widget.service.getTextTask(widget.id),
        onChanged: (value) {
          widget.service.setTextTask(widget.id, value.toString());
        },
      ),
    );
  }
}
