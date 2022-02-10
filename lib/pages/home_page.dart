import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/service/task.dart';
import 'package:to_do_list2/widgets/style.dart';

class HomePage extends StatefulWidget {
  final TaskService service;

  const HomePage(this.service, {Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor(),
      appBar: AppBar(
        title: const Text('ToDoList'),
        titleTextStyle: titleStyleAppBar(),
        backgroundColor: backgroundColorAppBar(),
        centerTitle: true,
      ),
      floatingActionButton: buttonAdd(),
      body: TaskList(widget.service),
    );
  }

  Widget buttonAdd() {
    return FloatingActionButton(
      backgroundColor: Colors.orange[900],
      child: const Icon(Icons.add),
      onPressed: () async {
        await Navigator.pushNamed(context, '/page_add_task');
        setState(() {});
      },
    );
  }
}

class TaskList extends StatefulWidget {
  final TaskService service;

  const TaskList(this.service, {Key? key}) : super(key: key);

  @override
  _TaskList createState() => _TaskList();
}

class _TaskList extends State<TaskList> {
  bool init = false;

  VoidCallback toggleStatus(int id) {
    return () => setState(() {
          widget.service.toggleStatus(id);
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> listTasks = widget.service.getList();
    return FutureBuilder(
      future: widget.service.storageReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text(
              'Loading...',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        } else {
          if (!init) {
            widget.service.initialization();
            listTasks = widget.service.getList();
            init = !init;
          }
          return Scrollbar(
            isAlwaysShown: true,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: listTasks.length,
              padding: const EdgeInsets.only(bottom: 100.0),
              itemBuilder: (_, index) => taskDetals(listTasks[index]),
            ),
          );
        }
      },
    );
  }

  Widget taskDetals(Task task) {
    return Container(
      decoration: taskCardDesign(task.status),
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              child: StatusIcon(task.status),
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
            ),
            onDoubleTap: toggleStatus(task.id),
          ),
          Expanded(child: GestureDetector(
              child: Container(
                color: backgroundColorTask(task.status),
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  task.title,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
              onTap: () {
                Future<void> future =  Navigator.pushNamed(
                    context, '/task_detail_page/' + task.id.toString());
                future.then((_) {setState(() {});});
                
              },
              onLongPress: () {
                Future<void> future = Navigator.pushNamed(context, '/delete_task_page');
                future.then((_) {setState(() {});});
              },
            ),
          ), 
        ],
      ),
    );
  }
}
