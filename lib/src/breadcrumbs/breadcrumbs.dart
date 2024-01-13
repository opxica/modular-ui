import 'package:flutter/material.dart';

class MUIBreadcrumbItem {
  MUIBreadcrumbItem({
    required this.label,
    this.icon,
  });

  /// The label of the breadcrumb.
  final String label;

  /// An possible icon to display in front of the label.
  final Widget? icon;
}

/// A Breadcrumb Item to display to the user where he is.
/// Usage:
/// ```dart MUIBreadcrumbs(); ```
///
class MUIBreadcrumbs extends StatefulWidget {
  const MUIBreadcrumbs({
    super.key,
    required this.crumbs,
    this.onTap,
    this.hoverColor = Colors.blue,
    this.textColor = Colors.grey,
    this.dividerColor = Colors.grey,
    this.currentColor = Colors.black,
    this.borderRadius = 6,
    this.backgroundColor = const Color.fromRGBO(236, 239, 241, 0.6),
  });

  /// The breadcrumbs to display.
  final List<MUIBreadcrumbItem> crumbs;

  /// Callback for when a breadcrumb is tapped.
  final Function(int index)? onTap;

  /// The color that is displayed when hovering on a breadcrumb.
  final Color hoverColor;

  /// The color of the last breadcrumb item.
  final Color currentColor;

  /// The color of the [/] divider between the breadcrumb items.
  final Color dividerColor;

  /// The color of the text.
  final Color textColor;

  /// The border radius for the container around the breadcrumbs.
  final double borderRadius;

  /// The color of the container behind the breadcrumbs;
  final Color backgroundColor;
  @override
  State<MUIBreadcrumbs> createState() => _MUIBreadcrumbsState();
}

class _MUIBreadcrumbsState extends State<MUIBreadcrumbs> {
  MouseCursor cursor = SystemMouseCursors.basic;
  int hoverIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor,
      ),
      child: Wrap(
        children: [
          for (int crumb = 0; crumb < widget.crumbs.length; crumb++)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (crumb != 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.dividerColor,
                      ),
                    ),
                  ),
                if (widget.crumbs[crumb].icon != null)
                  GestureDetector(
                      onTap: () {
                        widget.onTap?.call(crumb);
                      },
                      child: widget.crumbs[crumb].icon!),
                GestureDetector(
                  onTap: () {
                    widget.onTap?.call(crumb);
                  },
                  child: MouseRegion(
                    cursor: cursor,
                    onEnter: (_) {
                      setState(() {
                        hoverIndex = crumb;
                        cursor = SystemMouseCursors.click;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        hoverIndex = -1;
                        cursor = SystemMouseCursors.basic;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: (crumb + 1 == widget.crumbs.length) ? 0 : 8.0),
                      child: Text(
                        widget.crumbs[crumb].label,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: (crumb == hoverIndex)
                              ? widget.hoverColor
                              : (crumb + 1 == widget.crumbs.length)
                                  ? widget.currentColor
                                  : widget.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
