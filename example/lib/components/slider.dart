import 'package:example/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget slider() {
  return const _Slider();
}

class _Slider extends StatefulWidget {
  const _Slider();

  @override
  State<_Slider> createState() => __SliderState();
}

class __SliderState extends State<_Slider> {
  double value1 = 70;
  double value2 = 40;
  double value3 = 80;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text("Slider with different height from default"),
          const SizedBox(height: 5),
          MUISlider(
            value: value1,
            height: 3,
            min: 0,
            max: 100,
            thumbColor: Colors.white,
            onChanged: (val) {
              setState(() {
                value1 = val;
              });
            },
          ),
          const SizedBox(height: 15),
          text("Slider with default height and different Color"),
          const SizedBox(height: 5),
          MUISlider(
            value: value2,
            min: 0,
            max: 100,
            onChanged: (val) {
              setState(() {
                value2 = val;
              });
            },
            activeColor: Colors.red,
          ),
          const SizedBox(height: 15),
          text("Slider with bigger height"),
          const SizedBox(height: 5),
          MUISlider(
            value: value3,
            height: 10,
            min: 0,
            max: 100,
            activeColor: Colors.green,
            onChanged: (val) {
              setState(() {
                value3 = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
