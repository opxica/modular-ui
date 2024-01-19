import 'package:flutter/material.dart';
import 'package:modular_ui/src/slider/components/custom_slider_thumb_shape.dart';

class MUISlider extends StatefulWidget {
  const MUISlider(
      {Key? key,
      this.height = 5,
      this.inactiveColor = const Color(0xffECEFF1),
      this.activeColor = Colors.black,
      this.thumbColor = Colors.white,
      required this.onChanged,
      required this.value,
      required this.min,
      required this.max,
      this.onChangeStart,
      this.onChangeEnd})
      : assert(min <= max),
        assert(value >= min && value <= max,
            'Value $value is not between minimum $min and maximum $max'),
        super(key: key);

  /// Height for Slider ; default: 5
  final double? height;

  /// Inactive Color for Slider ; default: Colors.grey
  final Color? inactiveColor;

  /// Active Color for Slider ; default: Colors.black
  final Color? activeColor;

  /// Thumb Color for Slider ; default: Colors.black
  final Color? thumbColor;

  /// OnChanged for Slider
  final void Function(double) onChanged;

  /// Value for Slider
  final double value;

  /// Minimum Value for Slider ; default: 0
  final double min;

  /// Maximum Value for Slider ; default: 100
  final double max;

  /// OnChangedStart for Slider
  final void Function(double)? onChangeStart;

  /// OnChangedEnd for Slider
  final void Function(double)? onChangeEnd;

  /// Thumb Radius for Slider ; default: 10

  @override
  State<MUISlider> createState() => _MUISliderState();
}

class _MUISliderState extends State<MUISlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: widget.height,
        thumbShape: CustomSliderThumbShape(thumbRadius: widget.height! + 5),
      ),
      child: Slider(
        value: widget.value,
        min: widget.min,
        max: widget.max,
        onChanged: (value) {
          widget.onChanged(value);
        },
        activeColor: widget.activeColor,
        inactiveColor: widget.inactiveColor,
        thumbColor: widget.thumbColor,
      ),
    );
  }
}
