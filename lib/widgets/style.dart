import 'package:flutter/material.dart';

class StateIcon extends StatelessWidget {
  final bool status;
  final double iconSize = 40.0;

  const StateIcon(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Icon(Icons.check_circle_outline_rounded,
          color: Colors.cyan[900], size: iconSize);
    }
    return Icon(Icons.circle_outlined,
        color: Colors.orange[900], size: iconSize);
  }
}

BoxDecoration taskCardDesign(bool status) {
  if (status) {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black, blurRadius: 5.0, offset: Offset(5, 3))
      ],
      color: Colors.tealAccent[700],
      borderRadius: BorderRadius.circular(15.0),
    );
  }
  return BoxDecoration(
    boxShadow: const [
      BoxShadow(color: Colors.black, blurRadius: 5.0, offset: Offset(5, 3))
    ],
    color: Colors.amber[700],
    borderRadius: BorderRadius.circular(15.0),
  );
}

TextStyle titleStyleAppBar() {
  return const TextStyle(
      color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic);
}

Color backgroundColorAppBar() {
  return const Color(0xFF26A69A);  //Colors.teal[400]
}

Color mainBackgroundColor() {
  return const Color(0xFFC8E6C9); //Colors.green[100]
}
