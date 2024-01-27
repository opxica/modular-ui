import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget ratingBar() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MUIRatingBar(
            selectedCount: 4,
          ),
        ],
      ),
    ],
  );
}
