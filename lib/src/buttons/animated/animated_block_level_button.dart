import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable animated button which takes the complete available width
class MUIAnimatedBlockButton extends StatefulWidget {
  const MUIAnimatedBlockButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.bgColor = Colors.black,
      this.textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      this.borderRadius = 10,
      this.hapticsEnabled = false,
      this.animationDuration = 250,
      this.widthFactorPressed = 0.95,
      this.heightFactor = 0.05,
      this.leadingIcon,
      this.actionIcon,
      this.iconColor = Colors.white,
      this.widthFactor = 0.98,
      this.boxShadows});

  /// The Text to display inside the button
  final String text;

  /// Background Color of The Animated Block Button, default: Black
  final Color bgColor;

  /// Text style of the Animated Block Button, default: white
  final TextStyle textStyle;

  /// Border Radius for Animated Block Button, default: 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default: 250 ms
  final int animationDuration;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when button is pressed
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height determines the height of the button
  final double heightFactor;

  /// A double value which gets multiplied with current screen width when button is not pressed
  final double widthFactor;

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
  State<MUIAnimatedBlockButton> createState() => _MUIAnimatedBlockButtonState();
}

class _MUIAnimatedBlockButtonState extends State<MUIAnimatedBlockButton> {
  bool _isAnimatedBlockLevelButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isAnimatedBlockLevelButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
      },
      onTapUp: (_) {
        setState(() {
          _isAnimatedBlockLevelButtonPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isAnimatedBlockLevelButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.bgColor,
          boxShadow: widget.boxShadows,
        ),
        width: _isAnimatedBlockLevelButtonPressed ? getScreenWidth(context) * widget.widthFactorPressed : getScreenWidth(context) * widget.widthFactor,
        height: getScreenHeight(context) * widget.heightFactor,
        child: Center(
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
              Text(widget.text, style: widget.textStyle),
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
      ),
    );
  }
}
