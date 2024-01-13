import 'package:flutter/material.dart';

class MUICheckBox extends StatefulWidget {
  const MUICheckBox({
    super.key,
    required this.onChanged,
    required this.child,
    required this.checked,
    this.fillColor = Colors.black,
    this.iconColor = Colors.white,
    this.size = 14,
    this.borderRadius = 4,
    this.animationDuration = 100,
  });

  /// The state of the checkbox, its either checked or not.
  final bool checked;

  /// Typically a Text, the checkbox will also be checked if the child is tapped.
  final Widget child;

  /// Callback for when either the checkbox or the child got pressed.
  final Function(bool)? onChanged;

  /// The fill color of the checkbox. Shown when checked = true
  final Color fillColor;

  /// The color of the check icon inside the checkbox.
  final Color iconColor;

  /// The size of the checkbox.
  final double size;

  /// The border radius of the checkbox.
  final double borderRadius;

  /// How long the duration between checked and unchecked state is. The duration is in ms.
  final int animationDuration;

  @override
  State<MUICheckBox> createState() => _MUICheckBoxState();
}

class _MUICheckBoxState extends State<MUICheckBox> {
  MouseCursor cursor = SystemMouseCursors.basic;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              widget.onChanged?.call(widget.checked ? false : true);
            },
            child: AnimatedContainer(
              width: widget.size,
              height: widget.size,
              duration: Duration(milliseconds: widget.animationDuration),
              decoration: BoxDecoration(
                color: widget.checked ? widget.fillColor : null,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(color: widget.fillColor),
              ),
              child: (widget.checked)
                  ? Center(
                      child: Icon(
                        Icons.check,
                        color: widget.iconColor,
                        size: widget.size - 2,
                      ),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                widget.onChanged?.call(widget.checked ? false : true);
              },
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
