import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIGradientButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Gradient of The Gradient Button, dafault : black and grey
  final Gradient bgGradient;

  /// Text Color of the Gradient Button, default : white
  final Color textColor;

  /// Border Radius for Gradient Button, default : 10
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
  const MUIGradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgGradient = const LinearGradient(colors: [Colors.black, Colors.grey]),
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
  State<MUIGradientButton> createState() => _MUIGradientButtonState();
}

class _MUIGradientButtonState extends State<MUIGradientButton> {
  bool _isGradientButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isGradientButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isGradientButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isGradientButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient: widget.bgGradient,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _isGradientButtonPressed
              ? getScreenWidth(context) * widget.widthFactorPressed
              : getScreenWidth(context) * widget.widthFactorUnpressed,
          vertical: _isGradientButtonPressed
              ? getScreenWidth(context) * widget.heightFactorPressed
              : getScreenWidth(context) * widget.heightFactorUnPressed,
        ),
        child: Text(
          widget.text,
          style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
