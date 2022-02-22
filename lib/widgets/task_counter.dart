import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';



class TaskCounter extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    TaskService taskService = Provider.of<TaskService>(context);
    return Chip(
    backgroundColor: Colors.red,
    label: StreamBuilder<int>(
      stream: taskService.streamListTasks.map((list) => list.length),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          return Text(
            (snapshot.data).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          );
        }
        return Text('0');
      },
    ),
  );
  }

}