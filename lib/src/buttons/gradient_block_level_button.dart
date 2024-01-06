import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable gradient block level button by ModularUI
class MUIGradientBlockLevelButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Gradient of The Gradient Block Button, dafault : Black and grey
  final Gradient bgGradient;

  /// Text Color of the Gradient Block Button, default : white
  final Color textColor;

  /// Border Radius for Gradient Block Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuraton;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when button is pressed
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height determines the height of the button
  final double heightFactor;

  /// On Tap Function
  final VoidCallback onTap;
  const MUIGradientBlockLevelButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgGradient = const LinearGradient(colors: [Colors.black, Colors.grey]),
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactorPressed = 0.95,
    this.heightFactor = 0.05,
  });

  @override
  State<MUIGradientBlockLevelButton> createState() =>
      _MUIGradientBlockLevelButtonState();
}

class _MUIGradientBlockLevelButtonState
    extends State<MUIGradientBlockLevelButton> {
  bool _isGradientBlockLevelButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isGradientBlockLevelButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isGradientBlockLevelButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isGradientBlockLevelButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient: widget.bgGradient,
        ),
        width: _isGradientBlockLevelButtonPressed
            ? getScreenWidth(context) * widget.widthFactorPressed
            : getScreenWidth(context),
        height: getScreenHeight(context) * widget.heightFactor,
        child: Center(
          child: Text(
            widget.text,
            style:
                TextStyle(color: widget.textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
