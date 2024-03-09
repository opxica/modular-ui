import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget dialog(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUISecondaryButton(
        text: 'Show Dialog Box',
        borderColor: Colors.grey.shade300,
        bgColor: Colors.white,
        onPressed: () {
          MUIPrimaryDialog(
              titleText: 'Alert Dialog',
              contentText: 'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
              buttonsAlignment: MainAxisAlignment.spaceEvenly,
              buttons: [
                MUIPrimaryButton(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                MUISecondaryButton(
                  text: 'Done',
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
