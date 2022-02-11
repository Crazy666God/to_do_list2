import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';

class TextInput extends StatefulWidget {
  final TaskService service;
  final int id;
  final bool thisIsTheTitle;

  const TextInput(this.service, this.id, {required this.thisIsTheTitle, Key? key})
      : super(key: key);

  @override
  _TextInput createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    if (widget.thisIsTheTitle) {
      return TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        decoration: const InputDecoration(border: InputBorder.none),
        initialValue: widget.service.getTitleTask(widget.id),
        onChanged: (value) {
          widget.service.setTitleTask(widget.id, value.toString());
        },
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
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
