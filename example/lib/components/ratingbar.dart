import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget ratingbar() {
  return Column(
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
