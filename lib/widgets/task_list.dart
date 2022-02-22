import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/tasks/task.dart';
import 'package:to_do_list2/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskService taskService = Provider.of<TaskService>(context);
    return StreamBuilder<List<Task>>(
      stream: taskService.streamListTasks,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          taskService.initialization();
          return const Center(
            child: Text(
              'Loading...',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        List<Task> listTasks = snapshot.data!;
        return Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listTasks.length,
            padding: const EdgeInsets.only(bottom: 100.0),
            itemBuilder: (context, index) =>
                TaskCard(listTasks[index]),
          ),
        );
      },
    );
  }
}
