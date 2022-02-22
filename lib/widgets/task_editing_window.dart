import 'package:flutter/material.dart';
import 'package:to_do_list2/tasks/task.dart';
import 'package:to_do_list2/style.dart';
import 'package:to_do_list2/widgets/text_input.dart';
import 'package:to_do_list2/widgets/buttons/button_toggle_status.dart';
import 'package:to_do_list2/widgets/buttons/button_back.dart';
import 'package:to_do_list2/widgets/buttons/button_save.dart';

class TaskEditingWinsow extends StatelessWidget {
  final Task task;
  final bool thisIsAddingATask;
  TaskEditingWinsow(this.task, this.thisIsAddingATask);

  @override
  Widget build(BuildContext context) {
    double sizeScreenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      backgroundColor: Colors.transparent,
      alignment: Alignment.topCenter,
      child: Container(
        height:
            sizeScreenHeight - 48.0 - MediaQuery.of(context).viewInsets.bottom,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: mainBackgroundColor(),
          gradient:
              LinearGradient(colors: [Color(0xFFFFFF00), Color(0xFF76FF03)]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            _column(context, task, thisIsAddingATask),
          ],
        ),
      ),
    );
  }

  Column _column(BuildContext context, Task task, bool thisIsAddingATask) {
    double sizeScreenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double size = thisIsAddingATask
                  ? (constraints.maxWidth - 32) / 3
                  : (constraints.maxWidth - 16) / 2;
              return Row(
                  verticalDirection: VerticalDirection.up,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _widgetList(size, task, thisIsAddingATask));
            },
          ),
        ),
        _divider(), //16
        SizedBox(
          height: 50,
          child: TextInput(
            task,
            thisIsTheTitle: true,
            thisIsAddingATask: thisIsAddingATask,
          ),
        ),
        _divider(), //16
        Container(
          height: (sizeScreenHeight -
              32.0 -
              100.0 -
              48.0 -
              10.0 -
              23.0 -
              MediaQuery.of(context).viewInsets.bottom),
          child: TextInput(
            task,
            thisIsTheTitle: false,
            thisIsAddingATask: thisIsAddingATask,
          ),
        ),
      ],
    );
  }

  List<Widget> _widgetList(double size, Task task, bool thisIsAddingATask) {
    if (thisIsAddingATask) {
      return [
        ButtonBack(size),
        _verticalDivider(),
        ButtonToggleStatus(size, task),
        _verticalDivider(),
        ButtonSave(size),
      ];
    }
    return [
      ButtonBack(size),
      _verticalDivider(),
      ButtonToggleStatus(size, task),
    ];
  }

  Divider _divider() {
    return Divider(
      indent: 10,
      endIndent: 10,
      thickness: 1,
      color: Colors.black,
    );
  }

  VerticalDivider _verticalDivider() {
    return VerticalDivider(
      color: Colors.black,
      thickness: 1,
      indent: 5,
      endIndent: 5,
    );
  }
}
