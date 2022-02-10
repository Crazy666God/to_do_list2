import 'package:flutter/material.dart';
import 'package:to_do_list2/service/task_service.dart';
import 'package:to_do_list2/service/task.dart';
import 'package:to_do_list2/widgets/style.dart';

class DeleteTaskPage extends StatefulWidget {
  final TaskService service;

  const DeleteTaskPage(this.service, {Key? key}) : super(key: key);

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
    if (index == 0) {
      widget.service.selectCompletedTask();
    } else if (index == 1) {
      confirmationDelete(context);
    } else if (index == 2) {
      widget.service.selectAll();
    }
  }

  Future<void> confirmationDelete(BuildContext context) async {
    bool result = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => Popup(widget.service),
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
      widget.service.deleteSelectTasks();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Task> listTasks = widget.service.getList();
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: titleStyleAppBar(),
        centerTitle: true,
        backgroundColor: backgroundColorAppBar(),
        title: Text(
          widget.service.getNumberSelectedItems().toString() + ' item selected',
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
        backgroundColor: mainBackgroundColor(), //изменить цвет
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
      decoration: taskCardDesign(task.status),
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          task.flag = !task.flag;
          setState(() {});
        },
        child: Row(
          children: [
            Container(
              child: StatusIcon(task.status),
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
            ),
            Expanded(
              child: Container(
                color: backgroundColorTask(task.status),
                child: Text(
                  task.title,
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
              value: task.flag,
              onChanged: (bool? value) {
                task.flag = value!;
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
  final TaskService service;

  const Popup(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: getText(service.getNumberSelectedItems()),
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
