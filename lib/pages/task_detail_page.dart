import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/widgets/text_input.dart';
import 'package:to_do_list2/widgets/style.dart';

class TaskDetailPage extends StatelessWidget {
  final TaskService service;
  final int id;

  const TaskDetailPage(this.service, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextInput(service, id, thisIsTheTitle: true),
        backgroundColor: backgroundColorAppBar(),
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => backgroundColorAppBar())),
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  TextInput(service, id, thisIsTheTitle: false,),
      backgroundColor: mainBackgroundColor(),
    );
  }
}
