import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MUISecondaryOutlinedButton extends StatefulWidget {
  const MUISecondaryOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = Colors.transparent,
    this.tappedBgColor =  Colors.grey,
    this.borderColor = Colors.grey,
    this.borderWidth = 2,
    this.textColor = Colors.black,
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

  /// Background Color of The Secondary Outlined Button,
  final Color bgColor;

  /// Background Color of The Secondary Outlined Button when tapped
  final Color tappedBgColor;

  /// Text Color of the Secondary Outlined Button, default : black
  final Color textColor;

  /// Border Color for the outlined Button
  final Color borderColor;

  /// Border width, default : 2
  final double borderWidth;

  /// Border Radius for Secondary Outlined Button, default : 10
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
  State<MUISecondaryOutlinedButton> createState() =>
      _MUISecondaryOutlinedButtonState();
}

class _MUISecondaryOutlinedButtonState
    extends State<MUISecondaryOutlinedButton> {
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
        widget.onPressed();
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
        duration: Duration(milliseconds: widget.animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: _isOutlinedButtonPressed ? widget.tappedBgColor : widget.bgColor ,
          boxShadow: widget.boxShadows,
          border: Border.all(
            color: _isOutlinedButtonPressed
                ? Colors.transparent
                : widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
              style: TextStyle(
                  color: widget.textColor, fontWeight: FontWeight.bold),
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
