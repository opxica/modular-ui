// ignore_for_file: prefer_const_constructors

import 'package:modular_ui/modular_ui.dart';
import 'package:flutter/material.dart';

Widget switchComponent() {
  return _Switches();
}

class _Switches extends StatefulWidget {
  const _Switches({
    super.key,
  });

  @override
  State<_Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<_Switches> {
  bool value0 = false;
  bool value1 = false;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    Widget text(String text) {
      return Text(
        text,
        style: TextStyle(
          fontSize: 16,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text("Custom Switch"),
        SizedBox(height: 5),
        MUISwitch(
          width: 150,
          height: 50,
          circleSize: 45,
          checked: value0,
          animationDuration: Duration(milliseconds: 500),
          onChanged: (value) => setState(() {
            value0 = value;
          }),
        ),
        SizedBox(height: 5),
        text("Default Switch"),
        SizedBox(height: 5),
        MUISwitch(
          checked: value1,
          onChanged: (value) => setState(() {
            value1 = value;
          }),
        ),
        SizedBox(height: 5),
        text("New York Switch"),
        SizedBox(height: 5),
        MUISwitch.newYork(
          checked: value2,
          onChanged: (value) => setState(() {
            value2 = value;
          }),
        ),
      ],
    );
  }
}
