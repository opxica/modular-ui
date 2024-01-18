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
          text("Carousel with default height and dot Indicator"),
          const SizedBox(height: 5),
          const MUICarousel(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            indicatorType: CarouselIndicatorType.dot,
            duration: Duration(seconds: 2),
          ),
          const SizedBox(height: 15),
          text("Carousel with default height and line Indicator"),
          const SizedBox(height: 5),
          const MUICarousel(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            indicatorType: CarouselIndicatorType.line,
          ),
          const SizedBox(height: 15),
          text("Carousel without buttons"),
          const SizedBox(height: 5),
          const MUICarousel(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            showButtons: false,
          ),
          const SizedBox(height: 15),
          text("Carousel without indicator"),
          const SizedBox(height: 5),
          const MUICarousel(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            showIndicator: false,
          ),
          const SizedBox(height: 15),
          text("Carousel with rounded Buttons"),
          const SizedBox(height: 5),
          const MUICarousel(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            showIndicator: false,
            buttonType: CarouselButtonType.rounded,
          ),
          const SizedBox(height: 15),
          text("Parallex Carousel and line Indicator"),
          const SizedBox(height: 5),
          const MUIParallexCarousal(
            images: [
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png",
              "https://github.com/shadcn.png"
            ],
            indicatorType: CarouselIndicatorType.line,
          ),
        ],
      ),
    );
  }
}
