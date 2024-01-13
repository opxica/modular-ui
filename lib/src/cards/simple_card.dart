import 'package:flutter/material.dart';
import 'package:modular_ui/src/buttons/primary_button.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUISimpleCard extends StatefulWidget {
  const MUISimpleCard({
    super.key,
    required this.title,
    required this.description,
    required this.onButtonPressed,
    required this.buttonText,
    this.maxWidth = 430,
    this.descriptionStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    this.bgColor = Colors.white,
    this.borderRadius = 8,
  });

  /// The title of the card
  final String title;

  /// Text style of the title
  final TextStyle titleStyle;

  /// The description of the card
  final String description;

  /// Text style of the description
  final TextStyle descriptionStyle;

  /// The background color of the card
  final Color bgColor;

  /// The border radius of the card
  final double borderRadius;

  /// Text of the button
  final String buttonText;

  /// On Tap Function
  final VoidCallback onButtonPressed;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  @override
  State<MUISimpleCard> createState() => _MUISimpleCardState();
}

class _MUISimpleCardState extends State<MUISimpleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: widget.titleStyle),
            SizedBox(height: getScreenHeight(context) * 0.02),
            Text(
              widget.description,
              style: widget.descriptionStyle,
            ),
            const Spacer(),
            MUIPrimaryButton(
              text: widget.buttonText,
              onPressed: widget.onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
