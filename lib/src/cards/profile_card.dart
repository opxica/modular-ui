import 'package:flutter/material.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIProfileCard extends StatelessWidget {
  const MUIProfileCard({
    super.key,
    required this.name,
    required this.url,
    required this.designation,
    this.socialIcons = const [],
    this.borderRadius = 16,
    this.bgColor = Colors.white,
    this.nameStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    this.designationStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
  });

  /// Url for profile image
  final String url;

  /// Name of the person
  final String name;

  /// TextStyle of the name
  final TextStyle nameStyle;

  /// Designation of the person
  final String designation;

  /// TextStyle of the designation
  final TextStyle designationStyle;

  /// Border radius of the card
  final double borderRadius;

  /// List of social icons to display in the card footer
  final List<Widget> socialIcons;

  /// Background color of the card
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderRadius),
      width: getScreenWidth(context) * 0.9,
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: nameStyle,
          ),
          const SizedBox(height: 12),
          Text(
            designation,
            style: designationStyle,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: socialIcons,
          ),
        ],
      ),
    );
  }
}
