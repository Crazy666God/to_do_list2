import 'package:flutter/material.dart';
import 'package:to_do_list2/tasks/temporary_task.dart';
import 'package:to_do_list2/widgets/task_editing_window.dart';

class ButtonAddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orange[900],
      child: const Icon(Icons.add),
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return TaskEditingWinsow(TemporaryTask().getTemporaryTask(), true);
        },
      ),
    );
  }
}