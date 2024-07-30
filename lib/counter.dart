// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class counter extends StatelessWidget {
  int alltodos;
  int completed;
  counter({super.key, required this.alltodos, required this.completed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "${completed}/${alltodos}",
        style: TextStyle(
            fontSize: 44,
            color: completed == alltodos ? Colors.greenAccent : Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
