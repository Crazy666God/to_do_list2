import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/widgets/text_input.dart';
import 'package:to_do_list2/widgets/style.dart';

class PageAddTask extends StatelessWidget {
  final TaskService service;
  late int id = service.add('', '');
  
  PageAddTask(this.service, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        service.deleteTask(id);
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
              service.deleteTask(id);
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
          title: TextInput(service, id, thisIsTheTitle: true,),
        ),
        body: TextInput(service, id, thisIsTheTitle: false,),
        backgroundColor: mainBackgroundColor(),
      ),
    );
  }
}
