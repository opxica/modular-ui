import 'package:flutter/material.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A Basic Input Text Field Widget provided by ModularUI
class MUIPrimaryInputField extends StatefulWidget {
  const MUIPrimaryInputField({
    super.key,
    this.widthFactor = 0.95,
    required this.hintText,
    required this.controller,
    required this.filledColor,
    this.borderRadius = 12,
    this.borderWidth = 1.5,
    this.disabledBorderColor = Colors.grey,
    this.enabledBorderColor = Colors.black,
    this.cursorColor = Colors.grey,
    this.textStyle = const TextStyle(),
    this.hintStyle = const TextStyle(fontWeight: FontWeight.w400),
    this.isObscure = false,
  });

  /// A double value which gets multiplied with current screen width determines the width of text field
  final double widthFactor;

  /// Border radius for Text field
  final double borderRadius;

  /// Filled Color for Text field
  final Color filledColor;

  /// Hint text for text field
  final String hintText;

  /// Text style for text field
  final TextStyle textStyle;

  /// hint style for text field
  final TextStyle hintStyle;

  /// Is obscure ?
  final bool isObscure;

  /// Border color  when text field is selected
  final Color enabledBorderColor;

  /// Border color when text field is not selected
  final Color disabledBorderColor;

  /// Border width
  final double borderWidth;

  /// Text editing controller
  final TextEditingController controller;

  /// Cursor Color for text field
  final Color cursorColor;

  @override
  State<MUIPrimaryInputField> createState() => _MUIPrimaryInputField();
}

class _MUIPrimaryInputField extends State<MUIPrimaryInputField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(context) * widget.widthFactor,
      child: TextFormField(
        controller: widget.controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        style: widget.textStyle,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.filledColor,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.disabledBorderColor,
              width: widget.borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.enabledBorderColor,
              width: widget.borderWidth,
            ),
          ),
        ),
        cursorColor: widget.cursorColor,
      ),
    );
  }
}
