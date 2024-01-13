import 'package:flutter/material.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUILoadingButton extends StatefulWidget {
  const MUILoadingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loadingStateText = '',
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.loadingStateBackgroundColor = Colors.grey,
    this.loadingStateTextColor = Colors.white,
    this.borderRadius = 10,
    this.animationDuration = 250,
    this.hapticsEnabled = false,
    this.widthFactorUnpressed = 0.04,
    this.widthFactorPressed = 0.035,
    this.heightFactorUnPressed = 0.03,
    this.heightFactorPressed = 0.025,
    this.leadingIcon,
    this.actionIcon,
    this.iconColor = Colors.white,
  });

  /// Text for Loading Button
  final String text;

  /// Future Function to be passed, must be awaited
  final Future Function() onPressed;

  /// Text to be shown when the widget is in the loading state, empty string by default
  final String loadingStateText;

  /// Background color of the loading button
  final Color bgColor;

  /// Text color of the loading button
  final Color textColor;

  /// Background Color when the button is in the loading state
  final Color loadingStateBackgroundColor;

  /// Text Color when the button is in the loading state
  final Color loadingStateTextColor;

  /// Border radius, default value is 10
  final double borderRadius;

  /// Animation duration in milliseconds, default value is 250ms
  final int animationDuration;

  /// Enables light haptic feedback
  final bool hapticsEnabled;

  /// A double value which gets multiplied by the current screen width when the button is not pressed
  final double widthFactorUnpressed;

  /// A double value which gets multiplied by the current screen width when the button is pressed
  final double widthFactorPressed;

  /// A double value which gets multiplied by the current screen height when the button is pressed
  final double heightFactorPressed;

  /// A double value which gets multiplied by the current screen height when the button is not pressed
  final double heightFactorUnPressed;

  /// Optional leading icon for the button.
  final IconData? leadingIcon;

  /// Optional action icon for the button.
  final IconData? actionIcon;

  /// Icon color for both leading and action icons, default: white.
  final Color iconColor;

  @override
  State<MUILoadingButton> createState() => _MUILoadingButtonState();
}

class _MUILoadingButtonState extends State<MUILoadingButton> {
  bool _isLoadingButtonPressed = false;

  void _startLoading() {
    setState(() {
      _isLoadingButtonPressed = true;
    });
  }

  void _stopLoading() {
    setState(() {
      _isLoadingButtonPressed = false;
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
        duration: Duration(milliseconds: widget.animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: !_isLoadingButtonPressed
              ? widget.bgColor
              : widget.loadingStateBackgroundColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _isLoadingButtonPressed
              ? getScreenWidth(context) * widget.widthFactorPressed
              : getScreenWidth(context) * widget.widthFactorUnpressed,
          vertical: _isLoadingButtonPressed
              ? getScreenWidth(context) * widget.heightFactorPressed
              : getScreenWidth(context) * widget.heightFactorUnPressed,
        ).clamp(
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 16,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          child: !_isLoadingButtonPressed
              ? Row(
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
                      style: TextStyle(color: widget.textColor),
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
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getScreenWidth(context) * 0.02),
                      width: 18,
                      height: 18,
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
    );
  }
}
