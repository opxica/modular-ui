import 'package:flutter/material.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIProfileCard extends StatefulWidget {
  const MUIProfileCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.designation,
    this.maxWidth = 430,
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

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;



  @override
  State<MUIProfileCard> createState() => _MUIProfileCardState();
}

class _MUIProfileCardState extends State<MUIProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
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
      child: IntrinsicHeight(
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
