import 'package:flutter/material.dart';

/// This is a Select widget implementation of Modular UI
/// It take a list of Map<String,dynamic> as select items
/// This select widget can be easily implemented in with external APIs
class MUISelectFromMapList extends StatefulWidget {
  const MUISelectFromMapList({
    super.key,
    required this.items,
    this.tooltip,
    this.offset = 40,
    this.width = 120,
    this.hintText,
    this.hintStyle,
    this.dropdownBackgroundColor = Colors.black,
    this.borderRadius = 12,
    this.dropdownBorderColor = const Color.fromARGB(255, 90, 90, 90),
    this.textStyle = const TextStyle(color: Colors.white),
    this.itemHeight = 40,
    this.hintIcon,
    required this.onItemSelected,
    required this.mapKey,
  });

  /// List of Map<String,dynamic> to be shown in the MUISelectFromMapList
  final List<Map<String, dynamic>> items;

  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is
  /// used for accessibility.
  final String? tooltip;

  /// This is a vertical offset value which determines the vertical position of the menu.
  final double? offset;

  /// Width of Button that opens the select
  final double? width;

  /// Hintext to be shown in the select
  ///
  /// Default value is null.
  final String? hintText;

  /// Text style for hintText
  final TextStyle? hintStyle;

  /// Textstyle of select items
  final TextStyle? textStyle;

  /// Background color of the select
  final Color? dropdownBackgroundColor;

  /// Border color of the select
  final Color? dropdownBorderColor;

  /// Border radius of select button and menu
  final double? borderRadius;

  /// Item height for select menu items.
  final double? itemHeight;

  /// Icon to be shown in the select
  final Icon? hintIcon;

  /// Function to be called when an item is selected
  final Function(dynamic) onItemSelected;

  /// The value of this key will be shown as the item text
  final String mapKey;

  @override
  State<MUISelectFromMapList> createState() => _MUISelectFromMapListState();
}

class _MUISelectFromMapListState extends State<MUISelectFromMapList> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.hintText != null) {
      setState(() {
        _selectedIndex = -1;
      });
    } else {
      setState(() {
        _selectedIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.dropdownBackgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius!),
        border: Border.all(color: widget.dropdownBorderColor!, width: 1),
      ),
      child: PopupMenuButton<int>(
        color: widget.dropdownBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          side: BorderSide(
            color: widget.dropdownBorderColor!,
          ),
        ),
        tooltip: widget.tooltip,
        offset: Offset(0, widget.offset! + 5),
        onSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.onItemSelected(widget.items[index]);
        },
        itemBuilder: (BuildContext context) {
          return List.generate(
            widget.items.length,
            (index) => PopupMenuItem<int>(
              height: widget.itemHeight!,
              value: index,
              child: Text(
                widget.items[index][widget.mapKey].toString(),
                style: widget.textStyle,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: widget.offset,
          width: widget.width! - 6,
          alignment: Alignment.centerLeft,
          child: _selectedIndex != -1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.items[_selectedIndex][widget.mapKey].toString(),
                      style: widget.textStyle,
                    ),
                    if (widget.hintIcon != null) widget.hintIcon!,
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.hintText!,
                      style: widget.hintStyle,
                    ),
                    if (widget.hintIcon != null) widget.hintIcon!,
                  ],
                ),
        ),
      ),
    );
  }
}
