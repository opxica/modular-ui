import 'package:flutter/material.dart';
import 'package:modular_ui/constants/shadows.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIPrimaryCard extends StatefulWidget {
  const MUIPrimaryCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.bgColor = Colors.white,
    this.borderRadius = 8,
    this.imageRadius = 8,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.aspectRatio = 16 / 9,
    this.descriptionStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    this.buttons = const [],
    this.maxWidth = 430,
  });

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

  /// Outer Horizontal Margin for card
  final double horizontalMargin;

  /// Outer Vertical Margin for card
  final double verticalMargin;

  /// AspectRatio of Image to be shown
  final double aspectRatio;

  /// List of Flutter Widgets or ModularUI Widgets which can be used as buttons for MUIPrimaryCard.
  /// You can provide buttons to this list.
  final List<Widget>? buttons;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  @override
  State<MUIPrimaryCard> createState() => _MUIPrimaryCardState();
}

class _MUIPrimaryCardState extends State<MUIPrimaryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.bgColor,
        boxShadow: mUILightBigShadow,
      ),
      margin: EdgeInsets.symmetric(
        vertical: widget.verticalMargin,
        horizontal: widget.horizontalMargin,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IntrinsicHeight(
              child: IntrinsicWidth(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    boxShadow: mUILightSmallShadow,
                  ),
                  child: AspectRatio(
                    aspectRatio: widget.aspectRatio,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(widget.imageRadius),
                      child: widget.image,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: widget.titleStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: widget.descriptionStyle,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: (widget.buttons!.length == 1)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceEvenly,
                  children: widget.buttons!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
