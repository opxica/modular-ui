import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget dialog(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUISecondaryOutlinedButton(
        text: 'Secondary Outlined Button',
        borderColor: Colors.grey.shade300,
        bgColor: Colors.white,
        onPressed: () {
          MUIPrimaryDialog(
              titleText: 'titleText',
              contentText: 'contentText',
              buttonsAlignment: MainAxisAlignment.spaceEvenly,
              buttons: [
                MUISecondaryButton(
                    text: 'Button 1',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                MUISecondaryOutlinedButton(
                  text: 'Button 2',
                  onPressed: () {},
                  bgColor: Colors.grey.shade200,
                  borderColor: Colors.grey.shade300,
                )
              ]).showDialogBox(context);
        },
      ),
    ],
  );
}
