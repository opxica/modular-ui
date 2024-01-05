import 'package:flutter/material.dart';
import 'package:modular_ui/src/buttons/primary_button.dart';

class SimpleCard extends StatelessWidget {
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
  final VoidCallback onButtonTap;
  const SimpleCard({
    super.key,
    required this.title,
    required this.description,
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
      child: Padding(
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
    );
  }
}
