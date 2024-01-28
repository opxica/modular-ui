import 'package:flutter/material.dart';

class MUIBlogCard extends StatefulWidget {
  const MUIBlogCard({
    super.key,
    required this.title,
    required this.description,
    required this.onBlogCardPressed,
    required this.image,
    required this.date,
    this.avatarRad = 16,
    this.onMoreTap,
    this.moreButtonStyle,
    this.bgColor = Colors.white,
    this.elevation,
    this.avatarSpacing,
    this.aspectRatio = 16 / 9,
    this.descriptionStyle = const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    this.dateStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black87,
    ),
    required this.circularAvatarImages,
  });

  /// Title of Blog Card
  final String title;

  /// Date Text of Blog Card
  final String date;

  // Description Text of Blog Card
  final String description;

  /// Used as the callback function when the blog card is tapped with no arguments and returns void.
  final VoidCallback onBlogCardPressed;

  /// Used as the callback function when the "More"
  /// button on the blog card is tapped. If no value is provided, the "More" button will not be
  /// displayed.
  final VoidCallback? onMoreTap;

  /// Used to specify the style of the "More"
  /// button on the blog card. If no value is provided, the default button style will be used.
  final ButtonStyle? moreButtonStyle;

  /// Used as the link to the image that will be
  /// displayed on the blog card.
  final Image image;

  /// Used to provide a list of image links for circular avatars that will be displayed on the blog card. Each
  /// image link in the list should be of type `String`.
  final List<String> circularAvatarImages;

  /// Used to specify the style of the description
  final TextStyle descriptionStyle;

  /// Used to specify the style of the title
  final TextStyle titleStyle;

  /// Used to specify the style of the date
  final TextStyle dateStyle;

  /// Sets the elevation of the MUIBlogCard
  final double? elevation;

  ///Sets the spacing between circular avatars
  final double? avatarSpacing;

  /// Sets the radius of the circular avatar
  final double avatarRad;

  /// Background color of card
  final Color bgColor;

  /// AspectRatio of Image to be shown
  final double aspectRatio;

  @override
  State<MUIBlogCard> createState() => _MUIBlogCardState();
}

class _MUIBlogCardState extends State<MUIBlogCard> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: widget.onBlogCardPressed,
        child: Material(
          color: widget.bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          elevation: widget.elevation ?? 5,
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: AspectRatio(
                    aspectRatio: widget.aspectRatio,
                    child: widget.image,
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.title, style: widget.titleStyle),
                      const SizedBox(height: 12),
                      Text(widget.description, style: widget.descriptionStyle),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              /// display list of avatars.
                              for (int cAvatarImage = 0;
                                  cAvatarImage <
                                      widget.circularAvatarImages.length;
                                  cAvatarImage++)
                                Align(
                                  widthFactor: widget.avatarSpacing ?? 0.7,
                                  child: CircleAvatar(
                                    radius: widget.avatarRad + 1,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: widget.avatarRad,
                                      backgroundImage: NetworkImage(widget
                                          .circularAvatarImages[cAvatarImage]),
                                    ),
                                  ),
                                ),

                              /// Padding only if list of avatar is >= 7
                              if (widget.circularAvatarImages.length >= 7)
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: TextButton(
                                    onPressed: widget.onMoreTap,
                                    style: widget.moreButtonStyle,
                                    child: const Text('More...'),
                                  ),
                                ),
                            ],
                          ),
                          Text(widget.date, style: widget.dateStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
