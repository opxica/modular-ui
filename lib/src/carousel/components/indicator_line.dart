import 'package:flutter/material.dart';

class IndicatorLine extends StatelessWidget {
  final int positionIndex, currentIndex;
  const IndicatorLine({
    super.key,
    required this.currentIndex,
    required this.positionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 4,
        width: positionIndex == currentIndex ? 26 : 16,
        decoration: BoxDecoration(
          color: positionIndex == currentIndex
              ? Colors.white
              : Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
