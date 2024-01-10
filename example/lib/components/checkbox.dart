import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget checkbox() {
  ValueNotifier<bool> checkedNotifier = ValueNotifier(true);
  return ValueListenableBuilder(
    valueListenable: checkedNotifier,
    builder: (context, checked, child) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MUICheckBox(
          checked: checkedNotifier.value,
          onChanged: (value) {
            checkedNotifier.value = value;
          },
          child: const Text(
            "Accept Terms and conditions",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
  );
}
