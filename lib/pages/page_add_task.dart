import 'package:flutter/material.dart';
import 'package:to_do_list2/widgets/text_input.dart';
import 'package:to_do_list2/widgets/style.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task_service.dart';

class PageAddTask extends StatelessWidget {
  PageAddTask({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var taskService = Provider.of<TaskService>(context);
    int id = taskService.add('', '');
    return WillPopScope(
      onWillPop: () async {
        taskService.deleteTask(id);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColorAppBar(),
          leading: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => backgroundColorAppBar())),
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              taskService.deleteTask(id);
              Navigator.pop(context);
            },
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => backgroundColorAppBar())),
              child: const Icon(Icons.done),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          title: TextInput(id, thisIsTheTitle: true,),
        ),
        body: TextInput(id, thisIsTheTitle: false,),
        backgroundColor: mainBackgroundColor(),
      ),
    );
  }
}
