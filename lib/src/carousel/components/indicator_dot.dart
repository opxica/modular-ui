import 'package:flutter/material.dart';

class IndicatorDot extends StatelessWidget {
  final int positionIndex, currentIndex;
  const IndicatorDot({
    super.key,
    required this.currentIndex,
    required this.positionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: positionIndex == currentIndex
              ? Colors.white
              : Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
