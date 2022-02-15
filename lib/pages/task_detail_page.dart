import 'package:flutter/material.dart';
import 'package:to_do_list2/widgets/text_input.dart';
import 'package:to_do_list2/widgets/style.dart';

class TaskDetailPage extends StatelessWidget {
  final int id;
  const TaskDetailPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextInput(id, thisIsTheTitle: true),
        backgroundColor: backgroundColorAppBar(),
        leading: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => backgroundColorAppBar())),
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  TextInput(id, thisIsTheTitle: false,),
      backgroundColor: mainBackgroundColor(),
    );
  }
}
