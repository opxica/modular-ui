import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A customizable loading block level button by ModularUI
class MUILoadingBlockLevelButton extends StatefulWidget {
  /// The Text to display inside the button
  final String text;

  /// Future Function to be passed, must be a awaited
  final Future Function() onPressed;

  /// Text to be shown when widget is in loading state, empty string by default
  final String loadingStateText;

  /// Background Color when button is in loading state
  final Color loadingStateBackgroundColor;

  /// Text Color when button is in loading state
  final Color loadingStateTextColor;

  /// Background Color of The Loading Block Button, dafault : Black
  final Color bgColor;

  /// Text Color of the Loading Block Button, default : white
  final Color textColor;

  /// Border Radius for Loading Block Button, default : 10
  final double borderRadius;

  /// Animation Duration in Milliseconds, default : 250 ms
  final int animationDuraton;

  /// Enables Light Haptic Feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when button is pressed
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height determines the height of the button
  final double heightFactor;

  const MUILoadingBlockLevelButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loadingStateText = '',
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.loadingStateBackgroundColor = Colors.grey,
    this.loadingStateTextColor = Colors.white,
    this.borderRadius = 10,
    this.animationDuraton = 250,
    this.hapticsEnabled = false,
    this.widthFactorPressed = 0.95,
    this.heightFactor = 0.05,
  });

  @override
  State<MUILoadingBlockLevelButton> createState() =>
      _MUILoadingBlockLevelButtonState();
}

class _MUILoadingBlockLevelButtonState
    extends State<MUILoadingBlockLevelButton> {
  bool _isLoadingBlockLevelButtonPressed = false;

  void _startLoading() {
    setState(() {
      _isLoadingBlockLevelButtonPressed = true;
    });
  }

  void _stopLoading() {
    setState(() {
      _isLoadingBlockLevelButtonPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) async {
        _startLoading();
        try {
          await widget.onPressed();
        } finally {
          _stopLoading();
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDuraton),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: !_isLoadingBlockLevelButtonPressed
              ? widget.bgColor
              : widget.loadingStateBackgroundColor,
        ),
        width: _isLoadingBlockLevelButtonPressed
            ? getScreenWidth(context) * widget.widthFactorPressed
            : getScreenWidth(context),
        height: getScreenHeight(context) * widget.heightFactor,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            child: !_isLoadingBlockLevelButtonPressed
                ? Text(
                    widget.text,
                    style: TextStyle(color: widget.textColor),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getScreenWidth(context) * 0.02),
                        width: getScreenWidth(context) * 0.04,
                        height: getScreenWidth(context) * 0.04,
                        child: CircularProgressIndicator(
                          color: widget.loadingStateTextColor,
                        ),
                      ),
                      Text(
                        widget.loadingStateText,
                        style: TextStyle(color: widget.loadingStateTextColor),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
