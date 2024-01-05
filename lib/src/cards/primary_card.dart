import 'package:flutter/material.dart';
import 'package:modular_ui/src/buttons/primary_button.dart';

class MUIPrimaryCard extends StatelessWidget {
  /// The title of the card
  final String title;

  /// Text style of the title
  final TextStyle titleStyle;

  /// The description of the card
  final String description;

  /// Text style of the description
  final TextStyle descriptionStyle;

  /// Image widget to display in the card
  final Widget image;

  /// The background color of the card
  final Color bgColor;

  /// The border radius of the card
  final double borderRadius;

  /// Border Radius of the image
  final double imageRadius;

  /// Text of the button
  final String buttonText;

  /// Outer Horizontal Margin for card
  final double horizontalMargin;

  /// Outer Vertical Margin for card
  final double verticalMargin;

  /// On Tap Function
  final VoidCallback onButtonTap;
  const MUIPrimaryCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onButtonTap,
    required this.buttonText,
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
    this.imageRadius = 8,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(2, 4),
                ),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(imageRadius),
                child: image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleStyle),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: descriptionStyle,
                ),
                const SizedBox(height: 8),
                MUIPrimaryButton(
                  text: buttonText,
                  onTap: onButtonTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
