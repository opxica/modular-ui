import 'package:flutter/material.dart';

class MUIFooterItem {
  final String label;
  final Function()? onTap;

  MUIFooterItem({
    required this.label,
    this.onTap,
  });
}

class MUISimpleFooter extends StatefulWidget {
  /// The Items to display. eg. About Us, License, Contact Us, License
  final List<MUIFooterItem> items;

  /// The name of the company to display.
  final String companyName;

  /// The style for the name of the company.
  final TextStyle companyNameStyle;

  /// The style of the items.
  final TextStyle itemsStyle;

  /// How the items look when hovered.
  final TextStyle hoverStyle;

  const MUISimpleFooter({
    super.key,
    required this.items,
    required this.companyName,
    this.companyNameStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.itemsStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.hoverStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
    ),
  });

  @override
  State<MUISimpleFooter> createState() => _MUISimpleFooterState();
}

class _MUISimpleFooterState extends State<MUISimpleFooter> {
  MouseCursor cursor = SystemMouseCursors.basic;
  int hoverIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Wrap(
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 24,
                  children: [
                    Text(
                      "© ${DateTime.now().year} ${widget.companyName}",
                      style: widget.companyNameStyle,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < widget.items.length; i++)
                          Padding(
                            padding: EdgeInsets.only(left: (i == 0) ? 0 : 16.0),
                            child: GestureDetector(
                              onTap: () {
                                widget.items[i].onTap?.call();
                              },
                              child: MouseRegion(
                                cursor: cursor,
                                onEnter: (_) {
                                  setState(() {
                                    hoverIndex = i;
                                    cursor = SystemMouseCursors.click;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    hoverIndex = -1;
                                    cursor = SystemMouseCursors.basic;
                                  });
                                },
                                child: Text(
                                  widget.items[i].label,
                                  style: i == hoverIndex
                                      ? widget.hoverStyle
                                      : widget.itemsStyle,
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
