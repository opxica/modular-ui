import 'dart:math';

import 'package:flutter/material.dart';

class MUITab {
  final String label;
  final Widget? icon;

  MUITab({required this.label, this.icon});
}

class MUITabs extends StatefulWidget {
  const MUITabs({
    super.key,
    required this.tabs,
    this.tabIndex = 0,
    this.backgroundColor = const Color.fromRGBO(236, 239, 241, 0.6),
    this.curve = Curves.easeInOut,
    this.onChanged,
    this.indicatorColor = Colors.white,
    this.indicatorBorderRadius = 6,
    this.maxTabSize = 100,
    this.borderRadius = 8,
    this.labelStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    this.axis = Axis.horizontal,
    this.animationDuration = 400,
    this.underline = false,
    this.underlineHeight = 2,
  }) : assert((underline != true || axis == Axis.horizontal),
            "Underline is not supported for the vertical tabs.");

  /// The tabs to display in the tabbar.
  final List<MUITab> tabs;

  /// The color to display behind the bar.
  final Color backgroundColor;

  /// Which tab currently is selected.
  final int tabIndex;

  /// The curve for
  final Curve curve;

  /// Called when the user taps on a tab.
  final Function(int index)? onChanged;

  /// How long the animation of the tabIndicator takes. In milliseconds.
  final int animationDuration;

  /// The color of the indicator.
  final Color indicatorColor;

  /// The indicators border radius.
  final double indicatorBorderRadius;

  /// The maximum size for one singular tab.
  /// The final tab size is calculated from the given space and
  /// can't exceed the given `maxTabSize`.
  final double maxTabSize;

  /// The border radius of the container that is wrapped around the tapbar and gives it the background color.
  final double borderRadius;

  /// The style of the tab labels.
  final TextStyle labelStyle;

  /// The axis in which the tabbar should be. Horizontal/Vertical.
  final Axis axis;

  /// Whetever the tabs are indicated with an underline or not.
  final bool underline;

  /// If underline == true, defines the height of the underline.
  final double underlineHeight;

  factory MUITabs.transparent({
    required List<MUITab> tabs,
    int tabIndex = 0,
    Curve curve = Curves.easeInOut,
    Function(int)? onChanged,
    Color indicatorColor = Colors.grey,
    double indicatorBorderRadius = 6,
    double maxTabSize = 100,
    double borderRadius = 8,
    int animationDuration = 400,
    TextStyle labelStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    Axis axis = Axis.horizontal,
  }) {
    return MUITabs(
      tabs: tabs,
      tabIndex: tabIndex,
      curve: curve,
      onChanged: onChanged,
      indicatorColor: indicatorColor,
      indicatorBorderRadius: indicatorBorderRadius,
      maxTabSize: maxTabSize,
      borderRadius: borderRadius,
      backgroundColor: Colors.transparent,
      labelStyle: labelStyle,
      axis: axis,
      animationDuration: animationDuration,
    );
  }

  factory MUITabs.underlined({
    required List<MUITab> tabs,
    int tabIndex = 0,
    Curve curve = Curves.easeInOut,
    Color underlineColor = Colors.black,
    double underlineHeight = 2,
    Function(int)? onChanged,
    double underlineBorderRadius = 6,
    double maxTabSize = 100,
    double borderRadius = 8,
    int animationDuration = 400,
    TextStyle labelStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    Axis axis = Axis.horizontal,
  }) {
    return MUITabs(
      tabs: tabs,
      tabIndex: tabIndex,
      curve: curve,
      onChanged: onChanged,
      indicatorColor: underlineColor,
      indicatorBorderRadius: underlineBorderRadius,
      maxTabSize: maxTabSize,
      borderRadius: borderRadius,
      backgroundColor: Colors.transparent,
      labelStyle: labelStyle,
      axis: axis,
      underlineHeight: underlineHeight,
      underline: true,
      animationDuration: animationDuration,
    );
  }

  @override
  State<MUITabs> createState() => _MUITabsState();
}

class _MUITabsState extends State<MUITabs> {
  MouseCursor cursor = SystemMouseCursors.basic;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: (widget.axis == Axis.horizontal)
            ? _barSize(constraints.maxWidth)
            : _tabSize(constraints.maxWidth) + 6,
        height: (widget.axis == Axis.vertical) ? _barHeight() : null,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              left: (widget.axis == Axis.horizontal)
                  ? _tabSize(constraints.maxWidth) * widget.tabIndex
                  : 0,
              top: (widget.axis == Axis.vertical)
                  ? (_tabHeight() + 6) * widget.tabIndex
                  : 0,
              duration: Duration(milliseconds: widget.animationDuration),
              curve: widget.curve,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  height: _tabHeight(),
                  child: Column(
                    mainAxisAlignment: (widget.underline)
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: _tabSize(constraints.maxWidth),
                            height: (widget.underline)
                                ? widget.underlineHeight
                                : 30,
                            decoration: BoxDecoration(
                              color: widget.indicatorColor,
                              borderRadius: BorderRadius.circular(
                                  widget.indicatorBorderRadius),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (widget.axis == Axis.horizontal)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            for (int i = 0; i < widget.tabs.length; i++)
                              GestureDetector(
                                onTap: () {
                                  widget.onChanged?.call(i);
                                },
                                child: MouseRegion(
                                  cursor: cursor,
                                  onEnter: (_) {
                                    setState(() {
                                      cursor = SystemMouseCursors.click;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      cursor = SystemMouseCursors.basic;
                                    });
                                  },
                                  child: Container(
                                    width: _tabSize(constraints.maxWidth),
                                    height: 30,
                                    color: Colors.white.withOpacity(0),
                                    child: Center(
                                        child: Text(widget.tabs[i].label)),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.tabs.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.onChanged?.call(i);
                                },
                                child: MouseRegion(
                                  cursor: cursor,
                                  onEnter: (_) {
                                    setState(() {
                                      cursor = SystemMouseCursors.click;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      cursor = SystemMouseCursors.basic;
                                    });
                                  },
                                  child: Container(
                                    width: _tabSize(constraints.maxWidth),
                                    height: 30,
                                    color: Colors.white.withOpacity(0),
                                    child: Center(
                                        child: Text(widget.tabs[i].label)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
          ],
        ),
      );
    });
  }

  double _tabHeight() {
    return 30;
  }

  double _barHeight() {
    return (_tabHeight() + 6) * widget.tabs.length;
  }

  double _barSize(double totalWidth) {
    return _tabSize(totalWidth) * widget.tabs.length + 6;
  }

  double _tabSize(double totalWidth) {
    return min((totalWidth / widget.tabs.length) * 0.9, widget.maxTabSize);
  }
}
