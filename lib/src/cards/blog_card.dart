import 'package:flutter/material.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

class MUIBlogCard extends StatefulWidget {
  const MUIBlogCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onBlogCardTap,
    required this.imagelink,
    required this.date,
    this.avatarRad = 16,
    this.maxWidth = 430,
    this.widgetHeight = 550,
    this.onMoreTap,
    this.morebtnStyle,
    this.bgColor = Colors.white,
    this.elevation,
    this.avatarSpacing,
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
  }) : super(key: key);

  /// The line `final String title;` is declaring a final variable named `title` of type `String`. This
  /// variable is required and will be used as the title of the blog card.
  final String title;

  /// The line `final String date;` is declaring a final variable named `date` of type `String`. This
  /// variable is required and will be used to provide the date for the blog card. The date will be
  /// displayed on the blog card using the specified text style.
  final String date;

  /// The line `final String description;` is declaring a final variable named `description` of type
  /// `String`. This variable is required and will be used as the description of the blog card.
  final String description;

  /// The line `final VoidCallback onBlogCardTap;` is declaring a final variable named `onBlogCardTap`
  /// of type `VoidCallback`. This variable is required and will be used as the callback function when
  /// the blog card is tapped. A `VoidCallback` is a function that takes no arguments and returns no
  /// value.
  final VoidCallback onBlogCardTap;

  /// The line `final VoidCallback? onMoreTap;` is declaring a final variable named `onMoreTap` of type
  /// `VoidCallback?`. The `?` indicates that the variable can be nullable, meaning it can have a value
  /// of `null`. This variable is optional and can be used as the callback function when the "More"
  /// button on the blog card is tapped. If no value is provided, the "More" button will not be
  /// displayed.
  final VoidCallback? onMoreTap;

  /// The line `final ButtonStyle? morebtnStyle;` is declaring a final variable named `morebtnStyle` of
  /// type `ButtonStyle?`. The `?` indicates that the variable can be nullable, meaning it can have a
  /// value of `null`. This variable is optional and can be used to specify the style of the "More"
  /// button on the blog card. If no value is provided, the default button style will be used.
  final ButtonStyle? morebtnStyle;

  /// The line `final String imagelink;` is declaring a final variable named `imagelink` of type
  /// `String`. This variable is required and will be used as the link to the image that will be
  /// displayed on the blog card.
  final String imagelink;

  /// The line `final List<String> circularAvatarImages;` is declaring a final variable named
  /// `circularAvatarImages` of type `List<String>`. This variable is required and will be used to
  /// provide a list of image links for circular avatars that will be displayed on the blog card. Each
  /// image link in the list should be of type `String`.
  final List<String> circularAvatarImages;

  /// The line `final TextStyle descriptionStyle, titleStyle, dateStyle;` is declaring three final
  /// variables named `descriptionStyle`, `titleStyle`, and `dateStyle` of type `TextStyle`. These
  /// variables are optional and can be used to specify the style of the description, title, and date
  /// text in the blog card. If no value is provided, the default text styles will be used.
  final TextStyle descriptionStyle, titleStyle, dateStyle;

  /// Sets the elevation of the MUIBlogCard
  final double? elevation;

  ///Sets the spacing between circular avatars
  final double? avatarSpacing;

  /// Sets the radius of the circular avatar
  final double avatarRad;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  /// Overall height of this widget, It has a fixed value by default
  /// You can provide a dynamic height to this widget or leave it as it is.
  final double widgetHeight;

  /// Background color of card
  final Color bgColor;

  @override
  State<MUIBlogCard> createState() => _MUIBlogCardState();
}

class _MUIBlogCardState extends State<MUIBlogCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      height: widget.widgetHeight,
      child: GestureDetector(
        onTap: widget.onBlogCardTap,
        child: Material(
          color: widget.bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          elevation: widget.elevation ?? 5,
          child: Column(
            children: [
              /// The `ClipRRect` widget is used to clip the child widget, in this case, an
              /// `Image.network` widget, with rounded corners. The `borderRadius` property is set to
              /// `BorderRadius.vertical(top: Radius.circular(16))`, which creates rounded corners only
              /// on the top of the image. This gives the image a visually appealing shape.
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(widget.imagelink),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// The line `Text(title, style: titleStyle)` is creating a `Text` widget with the
                    /// `title` as its text content and `titleStyle` as its style. This widget is used
                    /// to display the title of the blog card with the specified text style.
                    Text(widget.title, style: widget.titleStyle),

                    /// `const SizedBox(height: 12)` is creating a `SizedBox` widget with a fixed height
                    /// of 12 pixels. This widget is used to add vertical spacing between the
                    /// `ClipRRect` widget (which displays the image) and the `Padding` widget (which
                    /// contains the title, description, and other elements of the blog card). The
                    /// `SizedBox` widget ensures that there is a consistent vertical spacing between
                    /// these two widgets.
                    const SizedBox(height: 12),

                    /// The line `Text(description, style: descriptionStyle)` is creating a `Text`
                    /// widget with the `description` as its text content and `descriptionStyle` as its
                    /// style. This widget is used to display the description of the blog card with the
                    /// specified text style.
                    Text(widget.description, style: widget.descriptionStyle),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// The `Row` widget is used to display a row of widgets horizontally. In this
                        /// case, the `Row` widget is used to display a row of circular avatars and a
                        /// "More" button.
                        Row(
                          children: [
                            /// The code `for (int i = 0; i < circularAvatarImages.length; i++)` is a
                            /// for loop that iterates over the `circularAvatarImages` list. It starts
                            /// with `i` equal to 0, and continues as long as `i` is less than the
                            /// length of the `circularAvatarImages` list. On each iteration, it
                            /// executes the code inside the loop.
                            for (int i = 0;
                                i < widget.circularAvatarImages.length;
                                i++)
                              Align(
                                widthFactor: widget.avatarSpacing ?? 0.7,
                                child: CircleAvatar(
                                  radius: widget.avatarRad + 1,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: widget.avatarRad,
                                    backgroundImage: NetworkImage(
                                        widget.circularAvatarImages[i]),
                                  ),
                                ),
                              ),

                            /// The code `if (circularAvatarImages.length >= 7)` checks if the length of
                            /// the `circularAvatarImages` list is greater than or equal to 7. If this
                            /// condition is true, it adds a `Padding` widget with a left padding of 7
                            /// pixels, followed by a `TextButton` widget.
                            if (widget.circularAvatarImages.length >= 7)
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: TextButton(
                                  onPressed: widget.onMoreTap,
                                  style: widget.morebtnStyle,
                                  child: const Text('More...'),
                                ),
                              ),
                          ],
                        ),

                        /// This widget is used to display the date of the blog card with the
                        /// specified text style. The `dateStyle` variable is optional and can be used to
                        /// customize the style of the date text. If no value is provided, the default
                        /// text style will be used.
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
    );
  }
}
