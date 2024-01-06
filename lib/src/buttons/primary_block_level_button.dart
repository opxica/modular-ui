import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable primary block level button by ModularUI
class MUIPrimaryBlockButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Background Color of The Primary Block Button, dafault : Black
  final Color bgColor;

  /// Text Color of the Primary Block Button, default : white
  final Color textColor;

  /// Border Radius for Primary Block Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuraton;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when button is pressed
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height determines the height of the button
  final double heightFactor;

  /// On Tap Function
  final VoidCallback onTap;
  const MUIPrimaryBlockButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.hapticsEnabled = false,
    this.animationDuraton = 250,
    this.widthFactorPressed = 0.95,
    this.heightFactor = 0.05,
  });

  @override
  State<MUIPrimaryBlockButton> createState() => _MUIPrimaryBlockButtonState();
}

class _MUIPrimaryBlockButtonState extends State<MUIPrimaryBlockButton> {
  bool _isPrimaryBlockLevelButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPrimaryBlockLevelButtonPressed = true;
        });
        if (widget.hapticsEnabled) {
          HapticFeedback.lightImpact();
        }
        widget.onTap();
      },
      onTapUp: (_) {
        setState(() {
          _isPrimaryBlockLevelButtonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPrimaryBlockLevelButtonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.bgColor,
        ),
        width: _isPrimaryBlockLevelButtonPressed
            ? getScreenWidth(context) * widget.widthFactorPressed
            : getScreenWidth(context),
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
