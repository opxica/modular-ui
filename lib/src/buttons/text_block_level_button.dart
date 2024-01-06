import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable text block level button by ModularUI
class MUITextBlockLevelButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Color of The Text Block Button is pressed, dafault : grey
  final Color bgColor;

  /// Text Color of the Text Block Button, default : black
  final Color textColor;

  /// Border Radius for Text Block Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuraton;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width determines the width of the button in pressedState
  final double widthFactor;

  /// A double value which gets multiplied by the current screen height determines the height of the button in pressedState
  final double heightFactor;

  /// On Tap Function
  final VoidCallback onTap;
  const MUITextBlockLevelButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor = Colors.grey,
    this.textColor = Colors.black,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactor = 0.95,
    this.heightFactor = 0.05,
  });

  @override
  State<MUITextBlockLevelButton> createState() => _MUITextBlockLevelButtonState();
}

class _MUITextBlockLevelButtonState extends State<MUITextBlockLevelButton> {
  bool _isTextBlockLevelButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTextBlockLevelButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isTextBlockLevelButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTextBlockLevelButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: _isTextBlockLevelButtonPressed
              ? widget.bgColor
              : Colors.transparent,
        ),
        width: getScreenWidth(context) * widget.widthFactor,
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
