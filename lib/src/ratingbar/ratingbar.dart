import 'package:flutter/material.dart';

class MUIRatingBar extends StatefulWidget {
  const MUIRatingBar({
    super.key,
    this.selectedCount = 1,
    this.icon = Icons.star_rounded,
    this.iconOutlined = Icons.star_border_rounded,
    this.borderColor = Colors.grey,
    this.selectedColor = Colors.orange,
    this.itemCount = 5,
    this.size = 24,
    this.onChanged,
  });

  /// How many stars are selected;
  final int selectedCount;

  /// The Icon that is used for the filled icon.
  final IconData icon;

  /// The icon that is shown by default.
  final IconData iconOutlined;

  /// The borderColor, the color in which the iconOutlined is shown.
  final Color borderColor;

  /// The color in which the selected icons are shown.
  final Color selectedColor;

  /// How much icons to render.
  final int itemCount;

  /// Called when the user selects an amount of stars.
  final Function(int)? onChanged;

  /// The size of the icons
  final double size;
  @override
  State<MUIRatingBar> createState() => _MUIRatingBarState();
}

class _MUIRatingBarState extends State<MUIRatingBar> {
  MouseCursor cursor = SystemMouseCursors.basic;
  int hoverSelected = 0;
  @override
  Widget build(BuildContext context) {
    int selectedCount =
        hoverSelected != 0 ? hoverSelected : widget.selectedCount;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < widget.itemCount; i++)
          GestureDetector(
            onTap: () {
              widget.onChanged?.call(i + 1);
            },
            child: MouseRegion(
              cursor: cursor,
              onEnter: (_) {
                setState(() {
                  hoverSelected = i + 1;
                  cursor = SystemMouseCursors.click;
                });
              },
              onExit: (_) {
                setState(() {
                  hoverSelected = 0;
                  cursor = SystemMouseCursors.basic;
                });
              },
              child: Icon(
                selectedCount > i ? widget.icon : widget.iconOutlined,
                color: selectedCount > i
                    ? widget.selectedColor
                    : widget.borderColor,
                size: widget.size,
              ),
            ),
          )
      ],
    );
  }
}
