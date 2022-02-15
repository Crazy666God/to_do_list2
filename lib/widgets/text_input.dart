import 'package:flutter/material.dart';
import 'package:to_do_list2/adapter_for_the_service.dart';


class TextInput extends StatefulWidget {
  final int id;
  final bool thisIsTheTitle;

  const TextInput(this.id, {required this.thisIsTheTitle, Key? key})
      : super(key: key);

  @override
  _TextInput createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  final AdapterForTheService adapter = AdapterForTheService();
  @override
  Widget build(BuildContext context) {
    if (widget.thisIsTheTitle) {
      return TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        decoration: const InputDecoration(border: InputBorder.none),
        initialValue: adapter.getTitleTask(widget.id),
        onChanged: (value) {
          adapter.setTitleTask(widget.id, value.toString());
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
        initialValue: adapter.getTextTask(widget.id),
        onChanged: (value) {
          adapter.setTextTask(widget.id, value.toString());
        },
      ),
    );
  }
}
