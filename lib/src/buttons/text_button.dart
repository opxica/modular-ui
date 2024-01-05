import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUITextButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Color when the text button is pressed, default : grey
  final Color bgColor;

  /// Text Color of the Text Button, default : black
  final Color textColor;

  /// Border Radius for Text Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuraton;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when button is pressed
  final double widthFactor;

  /// A double value which gets multiplied by the current screen height when button is pressed
  final double heightFactor;

  /// On Tap Function
  final VoidCallback onTap;
  const MUITextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor = Colors.grey,
    this.textColor = Colors.black,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactor = 0.04,
    this.heightFactor = 0.03,
  });

  @override
  State<MUITextButton> createState() => _MUITextButtonState();
}

class _MUITextButtonState extends State<MUITextButton> {
  bool _isTextButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTextButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isTextButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTextButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: _isTextButtonPressed ? widget.bgColor : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * widget.widthFactor,
          vertical: getScreenWidth(context) * widget.heightFactor,
        ),
        child: Text(
          widget.text,
          style:
              TextStyle(color: widget.textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
