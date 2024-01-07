import 'package:flutter/material.dart';

class MUICheckBox extends StatefulWidget {
  const MUICheckBox({
    super.key,
    required this.onChanged,
    required this.child,
    required this.checked,
  });

  /// The state of the checkbox, its either checked or not.
  final bool checked;

  /// Typically a Text, the checkbox will also be checked if the child is tapped.
  final Widget child;

  /// Callback for when either the checkbox or the child got pressed.
  final Function(bool)? onChanged;

  @override
  State<MUICheckBox> createState() => _MUICheckBoxState();
}

class _MUICheckBoxState extends State<MUICheckBox> {
  MouseCursor cursor = SystemMouseCursors.basic;
  @override
  Widget build(BuildContext context) {
    Color fillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    Color iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
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
              width: 14,
              height: 14,
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: widget.checked ? fillColor : null,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: fillColor),
              ),
              child: (widget.checked)
                  ? Center(
                      child: Icon(
                        Icons.check,
                        color: iconColor,
                        size: 12,
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
                child: widget.child),
          ),
        ],
      ),
    );
  }
}
