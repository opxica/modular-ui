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
  @override
  Widget build(BuildContext context) {
    Widget text(String text) {
      return Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text("Slider with different height from default"),
          const SizedBox(height: 5),
          MUISlider(
            value: 50,
            height: 3,
            min: 0,
            max: 100,
            thumbColor: Colors.white,
            onChanged: (value) {
              setState(() {
                print(value);
              });
            },
          ),
          const SizedBox(height: 15),
          text("Slider with default height and different Color"),
          const SizedBox(height: 5),
          MUISlider(
            value: 50,
            min: 0,
            max: 100,
            onChanged: (value) {},
            activeColor: Colors.red,
          ),
          const SizedBox(height: 15),
          text("Slider with bigger height"),
          const SizedBox(height: 5),
          MUISlider(
            value: 50,
            height: 10,
            min: 0,
            max: 100,
            activeColor: Colors.green,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
