import 'package:flutter/material.dart';
import 'package:to_do_list2/pages/task_detail_page.dart';
import 'package:to_do_list2/pages/home_page.dart';
import 'package:to_do_list2/pages/page_add_task.dart';
import 'package:to_do_list2/pages/delete_task_page.dart';

class ToDoList extends StatelessWidget {
  ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoList',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/page_add_task': (BuildContext context) => PageAddTask(),
        '/delete_task_page': (BuildContext context) => DeleteTaskPage(),
      },
      onGenerateRoute: (routeSettings) {
        List<String> path = routeSettings.name!.split("/") ;
        if(path[1] == 'task_detail_page') {
          return MaterialPageRoute(builder: (context) => TaskDetailPage(int.parse(path[2])));
        }
      },
    );
  }
}