import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable Secondary button by ModularUI with optional icons.
class MUISeconaryButton extends StatefulWidget {
  const MUISeconaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.boxShadows,
    this.bgColor = const Color(0xff212123),
    this.tappedBgColor = const Color.fromARGB(255, 22, 22, 24),
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuration = 250,
    this.leadingIcon,
    this.actionIcon,
    this.iconColor = Colors.white,
  }) : super(key: key);

  /// The Text to display inside the button.
  final String text;

  /// Background Color of The Secondary Button
  final Color bgColor;

  /// Background Color of The Secondary Button when tapped.
  final Color tappedBgColor;

  /// Text Color of the Secondary Button, default: white.
  final Color textColor;

  /// Border Radius for Secondary Button, default: 10.
  final double borderRadius;

  /// Animation Duration in Milliseconds, default: 250 ms.
  final int animationDuration;

  /// Enables Light Haptic Feedback.
  final bool hapticsEnabled;

  /// Optional leading icon for the button.
  final IconData? leadingIcon;

  /// Optional action icon for the button.
  final IconData? actionIcon;

  /// Icon color for both leading and action icons, default: white.
  final Color iconColor;

  /// On Pressed Function.
  final VoidCallback onPressed;

  /// Box shadows for button
  final List<BoxShadow>? boxShadows;

  @override
  State<MUISeconaryButton> createState() => _MUISecondaryButtonState();
}

class _MUISecondaryButtonState extends State<MUISeconaryButton> {
  bool _isSecondaryButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isSecondaryButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onPressed();
      },
      onTapUp: (_) {
        setState(() {
          _isSecondaryButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isSecondaryButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color:
              _isSecondaryButtonPressed ? widget.tappedBgColor : widget.bgColor,
          boxShadow: widget.boxShadows
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.leadingIcon != null)
              Icon(
                widget.leadingIcon,
                color: widget.iconColor,
                size: 12,
              ),
            SizedBox(width: widget.leadingIcon != null ? 8.0 : 0.0),
            Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: widget.actionIcon != null ? 8.0 : 0.0),
            if (widget.actionIcon != null)
              Icon(
                widget.actionIcon,
                color: widget.iconColor,
                size: 12,
              ),
          ],
        ),
      ),
    );
  }
}
