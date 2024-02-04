import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget ratingBar() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MUIRatingBar(
            selectedCount: 3,
            icon: Icons.star_rounded,
            iconOutlined: Icons.star_border_rounded,
            borderColor: Colors.grey,
            selectedColor: Colors.orange,
            itemCount: 5,
            size: 24,
            onChanged: (count) {
              // Handle rating change
            },
          ),
        ],
      ),
    ],
  );
}
