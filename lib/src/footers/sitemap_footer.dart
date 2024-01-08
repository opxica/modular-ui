import 'package:flutter/material.dart';

class MUISitemapCategory {
  final String label;
  final List<MUISitemapItem> items;

  MUISitemapCategory({required this.label, required this.items});
}

enum MUISitemapAlignment {
  left,
  center,
  right,
}

class MUISitemapItem {
  final String label;
  final Function()? onTap;

  MUISitemapItem({required this.label, this.onTap});
}

class MUISitemapFooter extends StatefulWidget {
  /// The Sitemap categories to display with their individual items.
  /// eg. Company, Help Center, Resources, Products
  final List<MUISitemapCategory> categories;

  /// The name of the company to display.
  final String companyName;

  /// The style for the name of the company.
  final TextStyle companyNameStyle;

  /// The style of the items.
  final TextStyle itemsStyle;

  /// How the items look when hovered.
  final TextStyle hoverStyle;

  /// How to headline of the categories looks.
  final TextStyle categoryNameStyle;

  /// How the sitemap categories should be laid out.
  final MUISitemapAlignment alignment;

  const MUISitemapFooter({
    super.key,
    required this.categories,
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
    this.categoryNameStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    ),
    this.alignment = MUISitemapAlignment.left,
  });

  @override
  State<MUISitemapFooter> createState() => _MUISitemapFooterState();
}

class _MUISitemapFooterState extends State<MUISitemapFooter> {
  MouseCursor cursor = SystemMouseCursors.basic;
  int hoverRowIndex = -1;
  int hoverIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Wrap(
                  alignment: (widget.alignment == MUISitemapAlignment.left)
                      ? WrapAlignment.start
                      : (widget.alignment == MUISitemapAlignment.center)
                          ? WrapAlignment.center
                          : WrapAlignment.end,
                  runSpacing: 24,
                  children: [
                    for (int index = 0;
                        index < widget.categories.length;
                        index++)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                widget.categories[index].label,
                                style: widget.categoryNameStyle,
                              ),
                            ),
                            for (int i = 0; i < widget.categories.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: GestureDetector(
                                  onTap: () {
                                    widget.categories[index].items[i].onTap
                                        ?.call();
                                  },
                                  child: MouseRegion(
                                    cursor: cursor,
                                    onEnter: (_) {
                                      setState(() {
                                        hoverIndex = i;
                                        hoverRowIndex = index;
                                        cursor = SystemMouseCursors.click;
                                      });
                                    },
                                    onExit: (_) {
                                      setState(() {
                                        hoverIndex = -1;
                                        hoverRowIndex = -1;
                                        cursor = SystemMouseCursors.basic;
                                      });
                                    },
                                    child: Text(
                                      widget.categories[index].items[i].label,
                                      style: i == hoverIndex &&
                                              hoverRowIndex == index
                                          ? widget.hoverStyle
                                          : widget.itemsStyle,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                  ],
                ),
              );
            }),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "© ${DateTime.now().year} ${widget.companyName}",
                  style: widget.companyNameStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
