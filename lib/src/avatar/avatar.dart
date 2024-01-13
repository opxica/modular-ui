import 'package:flutter/material.dart';

class MUIAvatar extends StatelessWidget {
  const MUIAvatar({
    super.key,
    required this.imageUrl,
    this.size = 32,
    required this.fallbackText,
    required this.onTap,
    required this.textColor,
  });

  /// ImageUrl for  Avatar
  final String imageUrl;

  /// Size for Avatar, default: 32
  final double size;

  /// Fallback Text for Avatar, length is limited to 2 characters
  final String fallbackText;

  /// On Tap Function
  final VoidCallback onTap;

  /// Text Color for Fallback Text
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    /// Truncate fallback text to 2 characters
    final truncatedFallbackText =
        fallbackText.length > 2 ? fallbackText.substring(0, 2) : fallbackText;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: textColor.withOpacity(0.5)),
        child: ClipOval(
          child: imageUrl.isNotEmpty
              ? imageUrl.startsWith('http')
                  ? Image.network(
                      imageUrl,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      imageUrl,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
              : Center(
                  child: Text(
                    /// Fallback Text is always uppercase
                    truncatedFallbackText.toUpperCase(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: size * 0.4,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
