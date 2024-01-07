import 'package:flutter/material.dart';

class MUIBlogCard extends StatelessWidget {
  const MUIBlogCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onBlogCardTap,
    required this.imagelink,
    this.onMoreTap,
    this.cardWidth,
    this.morebtnStyle,
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

  final String title;
  final String description;
  final VoidCallback onBlogCardTap;
  final double? cardWidth;
  final VoidCallback? onMoreTap;
  final ButtonStyle? morebtnStyle;
  final String imagelink;
  final List<String> circularAvatarImages;
  final TextStyle descriptionStyle, titleStyle, dateStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBlogCardTap,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        elevation: 5,
        child: SizedBox(
          width: cardWidth ?? 350,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(imagelink),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: titleStyle),
                    const SizedBox(height: 12),
                    Text(description, style: descriptionStyle),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            for (int i = 0;
                                i < circularAvatarImages.length;
                                i++)
                              Align(
                                widthFactor: 0.7,
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundImage:
                                        NetworkImage(circularAvatarImages[i]),
                                  ),
                                ),
                              ),
                            if (circularAvatarImages.length >= 7)
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: TextButton(
                                  onPressed: onMoreTap,
                                  style: morebtnStyle,
                                  child: const Text('More...'),
                                ),
                              ),
                          ],
                        ),
                        Text('January 10', style: dateStyle),
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
