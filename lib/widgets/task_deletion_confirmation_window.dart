import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/tasks/task.dart';
import 'package:to_do_list2/style.dart';

class TaskDeletionConfirmationWindow extends StatelessWidget {
  final Task task;

  TaskDeletionConfirmationWindow(this.task);
  @override
  Widget build(BuildContext context) {
    TaskService _taskService = Provider.of<TaskService>(context);
    return Dialog(
      backgroundColor: mainBackgroundColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxHeight: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Delete this task?',
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.blue[900], fontSize: 25.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.red[900], fontSize: 25.0),
                  ),
                  onTap: () {
                    _taskService.deleteTask(task.getId());
                    _taskService.updateStream();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
