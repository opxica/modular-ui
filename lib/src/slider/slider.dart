import 'package:flutter/material.dart';

class MUISlider extends StatefulWidget {
  const MUISlider(
      {super.key,
      this.height,
      this.inactiveColor = Colors.grey,
      this.activeColor = Colors.black,
      this.thumbColor});

  /// Height for Slider ; default: 200
  final double? height;

  /// Inactive Color for Slider ; default: Colors.grey
  final Color? inactiveColor;

  /// Active Color for Slider ; default: Colors.black
  final Color? activeColor;

  /// Thumb Color for Slider ; default: Colors.black
  final Color? thumbColor;

  @override
  State<MUISlider> createState() => _MUISliderState();
}

class _MUISliderState extends State<MUISlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      ),
      child: Slider(
        value: 25,
        min: 0,
        max: 100,
        onChanged: (value) {},
        activeColor: widget.activeColor,
        inactiveColor: widget.inactiveColor,
        thumbColor: widget.thumbColor,
      ),
    );
  }
}
