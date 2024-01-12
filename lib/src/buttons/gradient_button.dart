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
  final int animationDuration;

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

  const MUIGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgGradient = const LinearGradient(colors: [Colors.black, Colors.grey]),
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuration = 250,
    this.widthFactorUnpressed = 0.04,
    this.widthFactorPressed = 0.035,
    this.heightFactorUnPressed = 0.03,
    this.heightFactorPressed = 0.03,
    this.maxHorizontalPadding = 70,
    this.leadingIcon,
    this.actionIcon,
    this.iconColor = Colors.white,
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
        widget.onPressed();
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
        duration: Duration(milliseconds: widget.animationDuration),
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
        ).clamp(
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          EdgeInsets.symmetric(
            horizontal: widget.maxHorizontalPadding,
            vertical: 16,
          ),
        ),
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
