import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget dialog(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUIOutlinedButton(
          text: "Show Dialog",
          onPressed: () {
            MUIPrimaryDialog(
              buttonBackgroundColor: Colors.white,
              buttonRadius: 5,
              buttonBorderWidth: 1,
              buttonBorderColor: Colors.black,
              ctaText: "Show Dialog",
              titleText: "Are you absolutely sure?",
              contentText:
                  "This action cannot be undone. This will permanently delete your account and remove your data from our servers.",
              primaryCta: "Continue",
              primaryOnPressed: () => Navigator.pop(context),
              secondaryOnPressed: () => Navigator.pop(context),
              secondaryCta: "Cancel",
            ).showDialogBox(context);
          })
    ],
  );
}
