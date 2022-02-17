import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list2/service/task.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/widgets/style.dart';

class DeleteTaskPage extends StatefulWidget {
  const DeleteTaskPage({Key? key}) : super(key: key);

  @override
  _DeleteTaskPage createState() => _DeleteTaskPage();
}

class _DeleteTaskPage extends State<DeleteTaskPage> {
  int _selectedIndex = 0;

  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      serviceAction(index, context);
    });
  }

  void serviceAction(int index, BuildContext context) {
    var taskService = Provider.of<TaskService>(context, listen: false);
    if (index == 0) {
      taskService.selectCompletedTasks();
    } else if (index == 1) {
      confirmationDelete(context);
    } else if (index == 2) {
      taskService.selectAll();
    }
  }

  Future<void> confirmationDelete(BuildContext context) async {
    var taskService = Provider.of<TaskService>(context, listen: false);
    bool result = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => Popup(),
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            }));

    if (result == true) {
      taskService.deleteSelectTasks();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var taskService = Provider.of<TaskService>(context);
    List<Task> listTasks = taskService.getListTask();
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: titleStyleAppBar(),
        centerTitle: true,
        backgroundColor: backgroundColorAppBar(),
        title: Text(
          taskService.getNumberSelectedItems().toString() + ' item selected',
          style: const TextStyle(color: Colors.black),
        ),
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => backgroundColorAppBar())),
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: mainBackgroundColor(),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_rounded), label: 'select completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delete_forever), label: 'delete'),
          BottomNavigationBarItem(
              icon: Icon(Icons.select_all), label: 'select all'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
      backgroundColor: mainBackgroundColor(),
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: listTasks.length,
          itemBuilder: (_, index) => taskDetals(listTasks[index]),
        ),
      ),
    );
  }

  Widget taskDetals(Task task) {
    return Container(
      decoration: taskCardDesign(task.getStatus()),
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          task.toggleSelected();
          setState(() {});
        },
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
                child: Text(
                  task.getTitle(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.fade,
                ),
                padding: const EdgeInsets.symmetric(vertical: 13.0),
              ),
            ),
            Checkbox(
              value: task.getSelected(),
              onChanged: (bool? value) {
                task.toggleSelected();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

class Popup extends StatelessWidget {
  const Popup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taskService = Provider.of<TaskService>(context);
    return AlertDialog(
      title: Center(
        child: getText(taskService.getNumberSelectedItems()),
      ),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
      backgroundColor: Colors.black,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.blue[900], fontSize: 25.0),
              ),
              onTap: () {
                Navigator.pop(context, false);
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
                Navigator.pop(context, true);
              },
            )
          ],
        ),
      ],
    );
  }

  Widget getText(int i) {
    if (i == 1) {
      return const Text('Delete this task?');
    }
    return Text('Delete ' + i.toString() + ' tasks?');
  }
}
