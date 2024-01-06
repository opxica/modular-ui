import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable outlined block level button by ModularUI
class MUIOutlinedBlockLevelButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Color of The Outlined Block Button, dafault : transparent
  final Color bgColor;

  /// Text Color of the Outlined Block Button, default : black
  final Color textColor;

  /// Border Color for the outlined Button
  final Color borderColor;

  /// Border width, default : 2
  final double borderWidth;

  /// Border Radius for Outlined Block Button, default : 10
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
  const MUIOutlinedBlockLevelButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor = Colors.transparent,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.borderWidth = 2,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactorPressed = 0.95,
    this.heightFactor = 0.05,
  });

  @override
  State<MUIOutlinedBlockLevelButton> createState() =>
      _MUIOutlinedBlockLevelButtonState();
}

class _MUIOutlinedBlockLevelButtonState
    extends State<MUIOutlinedBlockLevelButton> {
  bool _isOutlinedBlockLevelButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isOutlinedBlockLevelButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isOutlinedBlockLevelButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isOutlinedBlockLevelButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.bgColor,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            )),
        width: _isOutlinedBlockLevelButtonPressed
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
