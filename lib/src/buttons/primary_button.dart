import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable primary button by ModularUI
class MUIPrimaryButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Color of The Primary Button, dafault : black
  final Color bgColor;

  /// Text Color of the Primary Button, default : white
  final Color textColor;

  /// Border Radius for Primary Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuraton;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when button is not pressed
  final double widthFactorUnpressed;

  /// A double value which gets multiplied by the current screen width when button is pressed
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height when button is  pressed
  final double heightFactorPressed;

  /// A double value which gets multiplied by the current screen height when button is not pressed
  final double heightFactorUnPressed;

  /// On Tap Function
  final VoidCallback onTap;

  const MUIPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactorUnpressed = 0.04,
    this.widthFactorPressed = 0.035,
    this.heightFactorUnPressed = 0.03,
    this.heightFactorPressed = 0.025,
  });

  @override
  State<MUIPrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<MUIPrimaryButton> {
  bool _isPrimaryButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPrimaryButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isPrimaryButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPrimaryButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.bgColor,
        ),
        margin: EdgeInsets.all(getScreenWidth(context) * 0.02),
        padding: EdgeInsets.symmetric(
          horizontal: _isPrimaryButtonPressed
              ? getScreenWidth(context) * widget.widthFactorPressed
              : getScreenWidth(context) * widget.widthFactorUnpressed,
          vertical: _isPrimaryButtonPressed
              ? getScreenWidth(context) * widget.heightFactorPressed
              : getScreenWidth(context) * widget.heightFactorUnPressed,
        ),
        child: Text(
          widget.text,
          style: TextStyle(color: widget.textColor),
        ),
      ),
    );
  }
}
