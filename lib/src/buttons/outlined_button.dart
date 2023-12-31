import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIOutlinedButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Color of The Outlined Button, dafault : transparent
  final Color bgColor;

  /// Text Color of the Outlined Button, default : black
  final Color textColor;

  /// Border Color for the outlined Button
  final Color borderColor;

  /// Border width, default : 2
  final double borderWidth;

  /// Border Radius for Outlined Button, default : 10
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

  /// Optional leading icon for the button.
  final IconData? leadingIcon;

  /// Optional action icon for the button.
  final IconData? actionIcon;

  /// Icon color for both leading and action icons, default: white.
  final Color iconColor;

  /// On Tap Function
  final VoidCallback onTap;

  const MUIOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor = Colors.transparent,
    this.borderColor = Colors.black,
    this.borderWidth = 2,
    this.textColor = Colors.black,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactorUnpressed = 0.04,
    this.widthFactorPressed = 0.035,
    this.heightFactorUnPressed = 0.03,
    this.heightFactorPressed = 0.03,
    this.leadingIcon,
    this.actionIcon,
    this.iconColor = Colors.black,
  });

  @override
  State<MUIOutlinedButton> createState() => _MUIOutlinedButtonState();
}

class _MUIOutlinedButtonState extends State<MUIOutlinedButton> {
  bool _isOutlinedButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isOutlinedButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isOutlinedButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isOutlinedButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.bgColor,
          border: Border.all(
            color: _isOutlinedButtonPressed
                ? Colors.transparent
                : widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _isOutlinedButtonPressed
              ? getScreenWidth(context) * widget.widthFactorPressed
              : getScreenWidth(context) * widget.widthFactorUnpressed,
          vertical: _isOutlinedButtonPressed
              ? getScreenWidth(context) * widget.heightFactorPressed
              : getScreenWidth(context) * widget.heightFactorUnPressed,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.leadingIcon != null)
              Icon(
                widget.leadingIcon,
                color: widget.iconColor,
                size: getScreenWidth(context) * 0.05,
              ),
            SizedBox(width: widget.leadingIcon != null ? 8.0 : 0.0),
            Text(
              widget.text,
              style:
                  TextStyle(color: widget.textColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: widget.actionIcon != null ? 8.0 : 0.0),
            if (widget.actionIcon != null)
              Icon(
                widget.actionIcon,
                color: widget.iconColor,
                size: getScreenWidth(context) * 0.05,
              ),
          ],
        ),
      ),
    );
  }
}
