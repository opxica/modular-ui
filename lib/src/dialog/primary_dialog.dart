import 'package:flutter/material.dart';

/// Primary Dialog provided my Modular UI
class MUIPrimaryDialog {
  const MUIPrimaryDialog({
    required this.titleText,
    required this.contentText,
    this.buttons,
    this.buttonsAlignment,
    this.dialogRadius,
    this.dialogBackgroundColor,
    this.titleStyle,
    this.contentStyle,
  });

  /// Title of the dialog box that appears on the top
  final String titleText;

  /// The main content of the dialog box
  final String contentText;

  /// border radius of the dialog box [default: 5]
  final double? dialogRadius;

  /// color of the dialog box [default: white]
  final Color? dialogBackgroundColor;

  /// text style of the dialog box [default: size=18, bold, color=black]
  final TextStyle? titleStyle;

  /// text style of the dialog box [default: color=black54]
  final TextStyle? contentStyle;

  /// List of Buttons or Widgets to be shown in the primary dialog box
  /// For example if you want to show a done and cancel button then give the list two buttons as any flutter default widget or any modular ui widget
  final List<Widget>? buttons;

  /// Main axis alignment for buttons
  final MainAxisAlignment? buttonsAlignment;

  Future<dynamic> showDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // change the shape of the dialog box to bordered rect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            dialogRadius ?? 5,
          ),
        ),
        backgroundColor: dialogBackgroundColor ?? Colors.white,
        surfaceTintColor: dialogBackgroundColor ?? Colors.white,

        // title text of the dialog
        title: Text(
          titleText,
          style: titleStyle ??
              const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ),

        // content text of the dialog
        content: Text(
          contentText,
          style: contentStyle ?? const TextStyle(color: Colors.black54),
        ),

        // action buttons of the dialog
        actions: buttons,
        actionsAlignment: buttonsAlignment,
      ),
    );
  }
}
