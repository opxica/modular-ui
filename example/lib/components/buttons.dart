import 'package:modular_ui/modular_ui.dart';
import 'package:flutter/material.dart';

Widget button() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUIPrimaryButton(text: "Button 1", onTap: () {}),
      LoadingButton(
        text: "Button 2",
        onPressed: () async {},
        loadingStateText: "hehe",
      ),
    ],
  );
}
