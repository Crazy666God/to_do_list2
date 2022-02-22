import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  final bool status;
  final double iconSize = 40.0;

  const StatusIcon(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return status
        ? Icon(Icons.check_circle_outline_rounded,
            color: Colors.cyan[900], size: iconSize) //0xFF006064
        : Icon(Icons.circle_outlined,
            color: Colors.orange[900], size: iconSize); //0xFFE65100
  }
}