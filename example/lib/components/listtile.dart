import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget listtile() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUIPrimaryListTile(
        leading: Icon(Icons.home),
        title: Text("Modular UI"),
        description: Text("description"),
        bgColor: Color(0xFFa2d2ff),
        action: Icon(Icons.edit),
      ),
    ],
  );
}
