import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MUISecondaryButton extends StatefulWidget {
  const MUISecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.5,
    this.textStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuration = 250,
    this.maxHorizontalPadding = 50,
    this.leadingIcon,
    this.actionIcon,
    this.iconColor = Colors.black,
    this.boxShadows,
  });

  /// The Text to display inside the button
  final String text;

  /// Text Color of the Secondary  Button, default : black
  final TextStyle textStyle;

  /// Border Color for the Button also equals to background color when button is tapped
  final Color borderColor;

  /// Background color of secondary button
  final Color bgColor;

  /// Border width, default : 1.5
  final double borderWidth;

  /// Border Radius for Secondary  Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuration;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which determines maximum horizontal padding a button can accumulate
  /// Play with this value if you want to use the button on a larger screen size
  final double maxHorizontalPadding;

  /// Optional leading icon for the button.
  final IconData? leadingIcon;

  /// Optional action icon for the button.
  final IconData? actionIcon;

  /// Icon color for both leading and action icons, default: white.
  final Color iconColor;

  /// On Pressed Function
  final VoidCallback onPressed;

  /// Box shadows for button
  final List<BoxShadow>? boxShadows;

  @override
  State<MUISecondaryButton> createState() => _MUISecondaryButtonState();
}

class _MUISecondaryButtonState extends State<MUISecondaryButton> {
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
      },
      onTapUp: (_) {
        setState(() {
          _isSecondaryButtonPressed = false;
        });
        widget.onPressed();
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
          color: _isSecondaryButtonPressed ? widget.borderColor : widget.bgColor,
          boxShadow: widget.boxShadows,
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.leadingIcon != null)
              Icon(
                widget.leadingIcon,
                color: widget.iconColor,
                // size: getScreenWidth(context) * 0.05,
                size: 12,
              ),
            SizedBox(width: widget.leadingIcon != null ? 8.0 : 0.0),
            Text(
              widget.text,
              style: widget.textStyle
            ),
            SizedBox(width: widget.actionIcon != null ? 8.0 : 0.0),
            if (widget.actionIcon != null)
              Icon(
                widget.actionIcon,
                color: widget.iconColor,
                // size: getScreenWidth(context) * 0.05,
                size: 12,
              ),
          ],
        ),
      ),
    );
  }
}
