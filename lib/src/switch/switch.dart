import 'package:flutter/material.dart';

/// A Basic Switch provided by ModularUI
class MUISwitch extends StatelessWidget {
  const MUISwitch({
    super.key,
    this.checked = false,
    this.onChanged,
    this.width = 40,
    this.height = 20,
    this.circleSize = 18,
    this.animationDuration = Durations.short3,
    this.animationCurve = Curves.easeInOut,
    this.onStateCol = Colors.white,
    this.offStateCol = const Color.fromARGB(255, 39, 39, 42),
  });

  /// The value to use for the underlying checkbox widget.
  final bool checked;

  /// Called when the value of the checkbox should change.
  final ValueChanged<bool>? onChanged;

  /// The width of the switch.
  final double width;

  /// The height of the switch.
  final double height;

  /// The absolute size of the circle, aka diameter
  final double circleSize;

  /// The duration of the animation. Defaults to [Durations.short3].
  final Duration animationDuration;

  /// The curve of the animation. Defaults to [Curves.easeInOut].
  final Curve animationCurve;

  final Color onStateCol;

  final Color offStateCol;

  static Widget newYork({
    bool checked = false,
    ValueChanged<bool>? onChanged,
    double width = 38,
    double height = 18,
    double circleSize = 16,
    Color onStateCol = Colors.white,
    Color offStateCol = const Color.fromARGB(255, 39, 39, 42),
  }) {
    return MUISwitch(
      checked: checked,
      onChanged: onChanged,
      width: width,
      height: height,
      circleSize: circleSize,
      onStateCol: onStateCol,
      offStateCol: offStateCol,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height + 2 * (height - circleSize),
      duration: animationDuration,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width),
        color: checked ? onStateCol : offStateCol,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(width),
          onTap: () => onChanged?.call(!checked),
          child: AnimatedAlign(
            curve: animationCurve,
            duration: animationDuration,
            alignment: checked ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all((height - circleSize)),
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width),
                color: const Color.fromARGB(255, 9, 9, 11),
              ),
              child: const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
