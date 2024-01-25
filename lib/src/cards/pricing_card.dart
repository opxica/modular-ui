import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

enum MUIPricingDuration { dayily, monthly, yearly }

enum MUIPricingCurrency { dollar, euro, pound, yen, rupee }

class MUIPricingCardItems {
  const MUIPricingCardItems({
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final String title;
}

// Widget MUIPricingCardItemListTile(Widget icon, String title) {
//   return Row(
//     children: [
//       icon,
//       const SizedBox(width: 8),
//       Text(title),
//     ],
//   );
// }

class MUIPricingCard extends StatefulWidget {
  const MUIPricingCard({
    super.key,
    required this.title,
    required this.duration,
    required this.currency,
    required this.amount,
    required this.onPressed,
    this.buttonText = "Buy Now",
    this.maxWidth = 430,
    this.items = const [],
    this.borderRadius = 16,
    this.bgColor = Colors.black,
    this.titleStyle = const TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  });

  /// Name of the person
  final String title;

  /// TextStyle of the title
  final TextStyle titleStyle;

  /// Duration of the pricing
  final MUIPricingDuration duration;

  /// Currency type of the pricing
  final MUIPricingCurrency currency;

  /// Amount of the pricing
  final double amount;

  /// Border radius of the card
  final double borderRadius;

  /// List of items to be displayed in the card
  final List<MUIPricingCardItems> items;

  /// Background color of the card
  final Color bgColor;

  /// button text
  final String buttonText;

  /// button onpressed
  final VoidCallback? onPressed;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  @override
  State<MUIPricingCard> createState() => _MUIPricingCardState();
}

class _MUIPricingCardState extends State<MUIPricingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      padding: EdgeInsets.all(widget.borderRadius),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: widget.titleStyle,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.currency == MUIPricingCurrency.dollar
                          ? "\$"
                          : widget.currency == MUIPricingCurrency.euro
                              ? "€"
                              : widget.currency == MUIPricingCurrency.pound
                                  ? "£"
                                  : widget.currency == MUIPricingCurrency.yen
                                      ? "¥"
                                      : "₹",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    widget.amount.toString(),
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.duration == MUIPricingDuration.dayily
                        ? "/day"
                        : widget.duration == MUIPricingDuration.monthly
                            ? " /mo"
                            : "/yr",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              for (var item in widget.items)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      item.icon,
                      const SizedBox(width: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              MUIPrimaryBlockButton(
                text: "Buy Now",
                onPressed: () {},
                bgColor: Colors.white,
                textColor: widget.bgColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
