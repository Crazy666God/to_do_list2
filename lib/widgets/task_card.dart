import 'package:flutter/material.dart';
import 'package:to_do_list2/tasks/task.dart';
import 'package:to_do_list2/style.dart';
import 'package:to_do_list2/widgets/task_deletion_confirmation_window.dart';
import 'package:to_do_list2/widgets/task_editing_window.dart';
import 'package:to_do_list2/widgets/status_icon.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  TaskCard(this.task);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return TaskDeletionConfirmationWindow(task);
        },
      ),
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return TaskEditingWinsow(task, false);
        },
      ),
      child: Container(
        decoration: taskCardDesign(task.getStatus()),
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          children: [
            Container(
              child: StatusIcon(task.getStatus()),
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
            ),
            Expanded(
              child: Container(
                color: backgroundColorTask(task.getStatus()),
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  task.getTitle(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
