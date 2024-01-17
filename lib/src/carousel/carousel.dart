import 'dart:async';
import 'package:flutter/material.dart';
import 'package:modular_ui/enums/carousel_button_type.dart';
import 'package:modular_ui/enums/carousel_indicator_type.dart';
import 'package:modular_ui/src/carousel/components/indicator_dot.dart';
import 'package:modular_ui/src/carousel/components/indicator_line.dart';

class MUICarousel extends StatefulWidget {
  const MUICarousel({
    super.key,
    required this.images,
    this.height = 200,
    this.duration = const Duration(seconds: 5),
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(8),
    this.indicatorType = CarouselIndicatorType.dot,
    this.curve = Curves.easeInOut,
    this.swipeDuration = const Duration(milliseconds: 500),
    this.showIndicator = true,
    this.showButtons = true,
    this.buttonType = CarouselButtonType.iconOnly,
    this.maxWidth = 430,
  });

  /// ImageUrls for  Carousel
  final List<String> images;

  /// Height for Carousel ; default: 200
  final double? height;

  /// Duration for Carousel ; default: 5 seconds
  final Duration? duration;

  /// Border Radius for Carousel ; default: 8
  final double? borderRadius;

  /// Padding Around Carousel ; default : All : 8
  final EdgeInsetsGeometry? padding;

  /// Indicator Type for Carousel ; default: dot
  final CarouselIndicatorType? indicatorType;

  /// Curve Animation for Carousel ; default: Curves.easeInOut
  final Curve? curve;

  /// Duration for Carousel ; default: 500 milliseconds
  final Duration? swipeDuration;

  /// Boolean to enable/disable indicator ; default: true
  final bool? showIndicator;

  /// Boolean to enable/disable indicator ; default: true
  final bool? showButtons;

  /// Carousel Button Types
  final CarouselButtonType? buttonType;

  /// Max Width for Carousel ; default: 430
  final double? maxWidth;

  @override
  State<MUICarousel> createState() => _MUICarouselState();
}

class _MUICarouselState extends State<MUICarousel> {
  PageController? _pageController;
  int currentIndex = 0;

  void _startAutoChange() {
    Timer.periodic(widget.duration!, (timer) {
      if (currentIndex != widget.images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController!.animateToPage(
        currentIndex,
        duration: widget.swipeDuration!,
        curve: widget.curve!,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoChange();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding!,
      child: SizedBox(
        height: widget.height,
        width: widget.maxWidth,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: onChangedFunction,
              physics: const BouncingScrollPhysics(),
              allowImplicitScrolling: true,
              children: List.generate(
                widget.images.length,
                (index) {
                  final image = widget.images[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: widget.height,
                      width: widget.maxWidth,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                        child: image.startsWith("http")
                            ? FadeInImage(
                                placeholder: const AssetImage(""),
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                                fadeInDuration:
                                    const Duration(milliseconds: 300),
                                fadeOutDuration:
                                    const Duration(milliseconds: 100),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                                placeholderErrorBuilder:
                                    (context, error, stackTrace) {
                                  return const Center(
                                    child:
                                        CircularProgressIndicator(), // Circular loader for placeholder
                                  );
                                },
                              )
                            : Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            widget.showButtons!
                ? Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (currentIndex != 0) {
                                currentIndex--;
                              } else {
                                currentIndex = widget.images.length - 1;
                              }
                              _pageController!.animateToPage(
                                currentIndex,
                                duration: widget.swipeDuration!,
                                curve: widget.curve!,
                              );
                            },
                            icon: CircleAvatar(
                              backgroundColor: widget.buttonType ==
                                      CarouselButtonType.iconOnly
                                  ? Colors.transparent
                                  : Colors.white.withOpacity(0.6),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (currentIndex != widget.images.length - 1) {
                                currentIndex++;
                              } else {
                                currentIndex = 0;
                              }
                              _pageController!.animateToPage(
                                currentIndex,
                                duration: widget.swipeDuration!,
                                curve: widget.curve!,
                              );
                            },
                            icon: CircleAvatar(
                              backgroundColor: widget.buttonType ==
                                      CarouselButtonType.iconOnly
                                  ? Colors.transparent
                                  : Colors.white.withOpacity(0.6),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.showIndicator!
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.images.length,
                          (index) =>
                              widget.indicatorType == CarouselIndicatorType.dot
                                  ? IndicatorDot(
                                      currentIndex: currentIndex,
                                      positionIndex: index)
                                  : IndicatorLine(
                                      currentIndex: currentIndex,
                                      positionIndex: index),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
