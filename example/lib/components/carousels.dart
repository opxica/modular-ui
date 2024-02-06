import 'package:example/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget carousel() {
  return const _Carousels();
}

class _Carousels extends StatefulWidget {
  const _Carousels();

  @override
  State<_Carousels> createState() => __CarouselsState();
}

class __CarouselsState extends State<_Carousels> {
  @override
  Widget build(BuildContext context) {
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
          const MUIParallexCarousel(
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
