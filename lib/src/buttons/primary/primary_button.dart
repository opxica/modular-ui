import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable Primary button by ModularUI with optional icons.
class MUIPrimaryButton extends StatefulWidget {
  const MUIPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.boxShadows,
    this.bgColor = const Color(0xff212123),
    this.tappedBgColor = const Color.fromARGB(255, 22, 22, 24),
    this.textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuration = 250,
    this.leadingIcon,
    this.actionIcon,
    this.iconColor = Colors.white,
  });

  /// The Text to display inside the button.
  final String text;

  /// Background Color of The Primary Button
  final Color bgColor;

  /// Background Color of The Primary Button when tapped.
  final Color tappedBgColor;

  /// Text Style of the Primary Button, default: white.
  final TextStyle textStyle;

  /// Border Radius for Primary Button, default: 10.
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
  State<MUIPrimaryButton> createState() => _MUIPrimaryButtonState();
}

class _MUIPrimaryButtonState extends State<MUIPrimaryButton> {
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
      },
      onTapUp: (_) {
        setState(() {
          _isPrimaryButtonPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPrimaryButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuration),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.borderRadius), color: _isPrimaryButtonPressed ? widget.tappedBgColor : widget.bgColor, boxShadow: widget.boxShadows),
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
            Text(widget.text, style: widget.textStyle),
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
