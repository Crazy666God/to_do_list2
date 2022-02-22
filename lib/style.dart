import 'package:flutter/material.dart';

Color backgroundColorTask(bool status) {
  return status ? const Color(0xFF00BFA5) : const Color(0xFFFFA000);
}

BoxDecoration taskCardDesign(bool status) {
  if (status) {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black, blurRadius: 5.0, offset: Offset(5, 3))
      ],
      color: Colors.tealAccent[700], //0xFF00BFA5
      borderRadius: BorderRadius.circular(15.0),
    );
  }
  return BoxDecoration(
    boxShadow: const [
      BoxShadow(color: Colors.black, blurRadius: 5.0, offset: Offset(5, 3))
    ],
    color: Colors.amber[700], //0xFFFFA000
    borderRadius: BorderRadius.circular(15.0),
  );
}

TextStyle titleStyleAppBar() {
  return const TextStyle(
      color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic);
}

Color backgroundColorAppBar() {
  return const Color(0xFF26A69A); //Colors.teal[400]
}

Color mainBackgroundColor() {
  return const Color(0xFFC8E6C9); //Colors.green[100]
}
