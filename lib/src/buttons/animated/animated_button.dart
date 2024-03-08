import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable animated button by ModularUI with optional icons.
class MUIAnimatedButton extends StatefulWidget {
  const MUIAnimatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    this.boxShadows,
  });

  /// The Text to display inside the button.
  final String text;

  /// Background Color of The Animated Button, default: black.
  final Color bgColor;

  /// Text Style of the Animated Button, default: white.
  final TextStyle textStyle;

  /// Border Radius for Animated Button, default: 10.
  final double borderRadius;

  /// Animation Duration in Milliseconds, default: 250 ms.
  final int animationDuration;

  /// Enables Light Haptic Feedback.
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when the button is not pressed.
  final double widthFactorUnpressed;

  /// A double value which gets multiplied by the current screen width when the button is pressed.
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height when the button is pressed.
  final double heightFactorPressed;

  /// A double value which gets multiplied by the current screen height when the button is not pressed.
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

  /// On Pressed Function.
  final VoidCallback onPressed;

  /// Box shadows for button
  final List<BoxShadow>? boxShadows;

  @override
  State<MUIAnimatedButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<MUIAnimatedButton> {
  bool _isAnimatedButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isAnimatedButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
      },
      onTapUp: (_) {
        setState(() {
          _isAnimatedButtonPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isAnimatedButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.bgColor,
          boxShadow: widget.boxShadows,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _isAnimatedButtonPressed ? getScreenWidth(context) * widget.widthFactorPressed : getScreenWidth(context) * widget.widthFactorUnpressed,
          vertical: _isAnimatedButtonPressed ? getScreenWidth(context) * widget.heightFactorPressed : getScreenWidth(context) * widget.heightFactorUnPressed,
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
