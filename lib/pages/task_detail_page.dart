import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/widgets/update_text_task.dart';
import 'package:to_do_list2/widgets/update_title_task.dart';

class TaskDetailPage extends StatelessWidget {
  final TaskService service;
  final int id;

  const TaskDetailPage(this.service, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: UpdateTaskTitle(service, id),
        backgroundColor: Colors.black,
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.black)),
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
