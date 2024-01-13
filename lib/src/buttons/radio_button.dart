import 'package:flutter/material.dart';

/// A Basic Radio provided by ModularUI
class MUIRadioButton extends StatelessWidget {
  const MUIRadioButton({
    super.key,
    this.color = Colors.black,
    this.checked = false,
    this.onChanged,
    this.size = 20,
    this.fillWidget,
  });

  ///Color of the radio button defaults to black
  final Color? color;

  ///Whether the radio button is checked or not
  final bool? checked;

  ///Called when the value of the radio button should change.
  final ValueChanged<bool>? onChanged;

  ///The size of the radio button
  final double? size;

  ///The widget to fill the radio button with defaults to a circle with the color of the radio button
  final Widget? fillWidget;

  static Widget newYork({
    Color? color,
    bool? checked,
    ValueChanged<bool>? onChanged,
    double? size,
    Widget? fillWidget,
  }) {
    return MUIRadioButton(
      color: color ?? Colors.black,
      checked: checked,
      onChanged: onChanged,
      size: size,
      fillWidget: Icon(
        Icons.check,
        size: 14,
        color: checked == true ? Colors.black : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size ?? 20),
          onTap: () => onChanged?.call(!(checked ?? false)),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(((size ?? 20) / 2) * (1 / 3)),
              child: fillWidget ??
                  Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: checked == true ? color : Colors.transparent,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
