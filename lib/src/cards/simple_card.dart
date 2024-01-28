import 'package:flutter/material.dart';
import 'package:modular_ui/src/buttons/primary_button.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUISimpleCard extends StatefulWidget {
  const MUISimpleCard({
    super.key,
    required this.title,
    required this.description,
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
    this.buttons = const [],
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

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  /// List of Flutter Widgets or ModularUI Widgets which can be used as buttons for MUISimpleCard.
  /// You can provide buttons to this list.
  final List<Widget>? buttons;

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
           Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.buttons!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
