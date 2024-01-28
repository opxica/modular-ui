import 'package:flutter/material.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A Custom List Tile provided by ModularUI
class MUIPrimaryListTile extends StatefulWidget {
  const MUIPrimaryListTile({
    super.key,
    required this.title,
    required this.description,
    this.leading,
    this.action,
    this.bgColor = Colors.black,
    this.maxWidth = 430,
    this.borderRadius = 10,
    this.onTitlePressed,
    this.onDescriptionPressed,
    this.onPressed,
  });

  /// Background Color of MUI List tile
  final Color bgColor;

  /// Title Widget of MUI List tile
  final Widget title;

  /// Description Widget of MUI List tile
  final Widget description;

  /// Leading Widget of MUI List tile
  final Widget? leading;

  /// Action Widget of MUI List tile
  final Widget? action;

  /// Function to execute when title is pressed
  final VoidCallback? onTitlePressed;

  /// Function to execute when description is pressed
  final VoidCallback? onDescriptionPressed;

  /// Function to execute when MUI LisTile is pressed
  final VoidCallback? onPressed;

  /// Max Width for MUI ListTile
  final double maxWidth;

  /// Border radius of MUI ListTile
  final double borderRadius;

  @override
  State<MUIPrimaryListTile> createState() => _MUIPrimaryListTileState();
}

class _MUIPrimaryListTileState extends State<MUIPrimaryListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          if (widget.leading != null) widget.leading!,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.title,
                widget.description,
              ],
            ),
          ),
          if (widget.action != null) widget.action!,
        ],
      ),
    );
  }
}
