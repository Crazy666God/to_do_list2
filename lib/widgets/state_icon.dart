import 'package:flutter/material.dart';

class StateIcon extends StatelessWidget {
  final bool status;
  final double iconSize = 40.0;

  const StateIcon(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Icon(Icons.star_outlined, color: Colors.green, size: iconSize);
    }
    return Icon(Icons.star_border, color: Colors.red, size: iconSize);
  }
}
