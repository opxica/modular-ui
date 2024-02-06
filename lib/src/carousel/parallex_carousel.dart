import "dart:async";
import "package:flutter/material.dart";
import "package:modular_ui/modular_ui.dart";
import "package:modular_ui/src/carousel/components/indicator_dot.dart";
import "package:modular_ui/src/carousel/components/indicator_line.dart";

class MUIParallexCarousel extends StatefulWidget {
  const MUIParallexCarousel(
      {super.key,
      required this.images,
      this.height = 200,
      this.duration = const Duration(seconds: 5),
      this.borderRadius = 8,
      this.padding = const EdgeInsets.all(8),
      this.indicatorType = CarouselIndicatorType.dot,
      this.curve = Curves.easeInOut,
      this.swipeDuration = const Duration(milliseconds: 500),
      this.showIndicator = true,
      this.showButtons = false,
      this.buttonType = CarouselButtonType.iconOnly,
      this.maxWidth = 430});

  /// ImageUrls for  Carousel
  final List<String> images;

  /// Height for Carousel ; default: 200
  final double? height;

  /// Duration for Carousel ; default: 5 seconds
  final Duration? duration;

  /// Border Radius for Carousel ; default: 8
  final double? borderRadius;

  /// Padding Around Carousel ; deault : All : 8
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
  State<MUIParallexCarousel> createState() => _MUIParallexCarouselState();
}

class _MUIParallexCarouselState extends State<MUIParallexCarousel> {
  late PageController _pageController;
  int currentIndex = 0;

  void _startAutoChange() {
    Timer.periodic(widget.duration!, (timer) {
      if (currentIndex != widget.images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: widget.swipeDuration!,
        curve: widget.curve!,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9, initialPage: 1);
    _startAutoChange();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
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
              PageView.builder(
                physics: const BouncingScrollPhysics(),
                allowImplicitScrolling: true,
                clipBehavior: Clip.none,
                controller: _pageController,
                onPageChanged: onChangedFunction,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double pageOffset = 0;
                      if (_pageController.position.haveDimensions) {
                        pageOffset = _pageController.page! - index;
                      }

                      return Container(
                        clipBehavior: Clip.none,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius!),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius!),
                          child: widget.images[index].startsWith("http")
                              ? Image.network(
                                  widget.images[index],
                                  fit: BoxFit.none,
                                  alignment: Alignment(-pageOffset.abs(), 0),
                                  height: widget.height,
                                  width: widget.maxWidth,
                                )
                              : Image.asset(
                                  widget.images[index],
                                  fit: BoxFit.none,
                                  height: widget.height,
                                  width: widget.maxWidth,
                                  alignment: Alignment(-pageOffset.abs(), 0),
                                ),
                        ),
                      );
                    },
                  );
                },
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
                                _pageController.animateToPage(
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
                                _pageController.animateToPage(
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
                            (index) => widget.indicatorType ==
                                    CarouselIndicatorType.dot
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
        ));
  }
}
