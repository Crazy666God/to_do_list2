import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/widgets/update_text_task.dart';
import 'package:to_do_list2/widgets/update_title_task.dart';

class PageAddTask extends StatelessWidget {
  TaskService service;
  late int id = service.add('', '');

  PageAddTask(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black)),
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            service.deleteTask(id);
            Navigator.pop(context);
          },
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black)),
            child: const Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: UpdateTaskTitle(service, id),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        color: Colors.black54,
        child: UpdateTaskText(service, id),
      ),
    );
  }
}
