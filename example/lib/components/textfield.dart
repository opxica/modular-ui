import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget textfield() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MUIPrimaryInputField(
            hintText: "Enter your name",
            controller: TextEditingController(),
            filledColor: Colors.white,
            suffixIcon: Icons.person,
            // prefixIcon: Icons.person,
          ),
        ],
      ),
    ],
  );
}
