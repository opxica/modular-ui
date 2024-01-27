import 'package:flutter/material.dart';
import 'package:modular_ui/constants/shadows.dart';

class MUIProfileCard extends StatefulWidget {
  const MUIProfileCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.designation,
    this.socialIcons = const [],
    this.borderRadius = 8,
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
  final String imageUrl;

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
  State<MUIProfileCard> createState() => _MUIProfileCardState();
}

class _MUIProfileCardState extends State<MUIProfileCard> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.all(widget.borderRadius),
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  boxShadow: mUILightSmallShadow,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: widget.nameStyle,
            ),
            const SizedBox(height: 12),
            Text(
              widget.designation,
              style: widget.designationStyle,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.socialIcons,
            ),
          ],
        ),
      ),
    );
  }
}
