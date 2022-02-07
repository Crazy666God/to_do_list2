import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/service/task.dart';
import 'package:to_do_list2/widgets/state_icon.dart';

class HomePage extends StatefulWidget {
  final TaskService service;

  HomePage(this.service, {Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      floatingActionButton: buttonAdd(),
      body: TaskList(widget.service),
    );
  }

  Widget buttonAdd() {
    return FloatingActionButton(
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

  TaskList(this.service, {Key? key}) : super(key: key);

  @override
  _TaskList createState() => _TaskList();
}

class _TaskList extends State<TaskList> {
  VoidCallback toggleStatus(int id) {
    return () => setState(() {
          widget.service.toggleStatus(id);
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> listTasks = widget.service.getList();
    /*return FutureBuilder(
      future: ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Text('Loading...'),
          );
        } else { */
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
    //    }
    //     },
    //   );
  }

  Widget taskDetals(Task task) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                child: StateIcon(task.status),
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
              ),
              onDoubleTap: toggleStatus(task.id),
            ),
            Expanded(
              child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.0),
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
                    setState(() {
                      Navigator.pushNamed(
                          context, '/task_detail_page/' + task.id.toString());
                    });
                  },
                  onLongPress:() async {
                    await Navigator.pushNamed(context, '/delete_task_page');
                    setState(() {});
                  },
                  ),
            ),
          ],
        ),
      );
  }
}
