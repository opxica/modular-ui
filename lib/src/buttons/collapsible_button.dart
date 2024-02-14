
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

class MUICollapsibleButton extends StatefulWidget {
  const MUICollapsibleButton({
    super.key,
    required this.collapsibleChild,
    required this.text,
    this.bgColor = Colors.black,
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
    this.boxShadows,
    required this.onPressed,
    this.collapsibleChildSpacing = 15,
  });

  /// The Widget to display when the button is pressed.
  final Widget collapsibleChild;

  /// The spacing between the button and the collapsible child widget.
  final double? collapsibleChildSpacing;

  /// The Text to display inside the button.
  final String text;

  /// Background Color of The Primary Button, default: black.
  final Color bgColor;

  /// Text Color of the Primary Button, default: white.
  final Color textColor;

  /// Border Radius for Primary Button, default: 10.
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
  final void Function() onPressed;

  /// Box shadows for button
  final List<BoxShadow>? boxShadows;

  @override
  // ignore: library_private_types_in_public_api
  _MUICollapsibleButtonState createState() => _MUICollapsibleButtonState();
}

class _MUICollapsibleButtonState extends State<MUICollapsibleButton>
    with SingleTickerProviderStateMixin {
  bool _isCollapsibleButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MUIPrimaryButton(
          actionIcon: widget.actionIcon,
          onPressed: () {
            setState(() {
              _isCollapsibleButtonSelected = !_isCollapsibleButtonSelected;
            });
            widget.onPressed();
          },
          text: widget.text,
          bgColor: widget.bgColor,
          textColor: widget.textColor,
          borderRadius: widget.borderRadius,
          animationDuration: widget.animationDuration,
          hapticsEnabled: widget.hapticsEnabled,
          widthFactorUnpressed: widget.widthFactorUnpressed,
          widthFactorPressed: widget.widthFactorPressed,
          heightFactorPressed: widget.heightFactorPressed,
          heightFactorUnPressed: widget.heightFactorUnPressed,
          maxHorizontalPadding: widget.maxHorizontalPadding,
          leadingIcon: widget.leadingIcon,
          iconColor: widget.iconColor,
          boxShadows: widget.boxShadows,
        ),
        if (_isCollapsibleButtonSelected)
          Padding(
            padding: EdgeInsets.only(
              top: widget.collapsibleChildSpacing!,
            ),
            child: widget.collapsibleChild,
          )
      ],
    );
  }
}
