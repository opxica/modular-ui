// ignore_for_file: prefer_const_constructors

import 'package:example/widgets/text.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Custom Switch
        text("Custom Switch"),
        SizedBox(height: 6),
        MUISwitch(
          width: 150,
          onStateCol: Colors.green,
          offStateCol: Colors.blue,
          height: 50,
          circleSize: 45,
          checked: value0,
          animationDuration: Duration(milliseconds: 500),
          onChanged: (value) => setState(() {
            value0 = value;
          }),
        ),
        SizedBox(height: 16),

        /// Default Switch
        text("Default Switch"),
        SizedBox(height: 6),
        MUISwitch(
          checked: value1,
          onChanged: (value) => setState(() {
            value1 = value;
          }),
        ),
        SizedBox(height: 16),

        /// New York Switch
        text("New York Switch"),
        SizedBox(height: 6),
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
