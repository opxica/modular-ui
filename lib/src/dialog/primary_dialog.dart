import 'package:flutter/material.dart';

class PrimaryDialog extends StatefulWidget {
  const PrimaryDialog({
    super.key,
    required this.ctaText,
    required this.titleText,
    required this.contentText,
    required this.primaryCta,
    required this.secondaryCta,
    this.buttonBackgroundColor,
    this.buttonRadius,
    this.buttonBorderWidth,
    this.buttonBorderColor,
    this.dialogRadius,
    this.dialogBackgroundColor,
    this.titleStyle,
    this.contentStyle,
    required this.primaryOnTap,
    required this.secondaryonTap,
    this.primaryCtaBackgroundColor,
    this.primaryCtaForegroundColor,
    this.primaryCtaBorderColor,
    this.secondaryCtaBackgroundColor,
    this.secondaryCtaForegroundColor,
    this.secondaryCtaBorderColor,
  });

  final Color? buttonBackgroundColor;

  final double? buttonRadius;

  final double? buttonBorderWidth;

  final Color? buttonBorderColor;

  final String ctaText;

  final String titleText;

  final String contentText;

  final double? dialogRadius;

  final Color? dialogBackgroundColor;

  final TextStyle? titleStyle;

  final TextStyle? contentStyle;

  final String primaryCta;

  final Function()? primaryOnTap;

  final String secondaryCta;

  final Function()? secondaryonTap;

  final Color? primaryCtaBackgroundColor;

  final Color? primaryCtaForegroundColor;

  final Color? primaryCtaBorderColor;

  final Color? secondaryCtaBackgroundColor;

  final Color? secondaryCtaForegroundColor;

  final Color? secondaryCtaBorderColor;

  @override
  State<PrimaryDialog> createState() => _PrimaryDialogState();
}

class _PrimaryDialogState extends State<PrimaryDialog> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.dialogRadius ?? 5)),
          backgroundColor: widget.dialogBackgroundColor ?? Colors.white,
          surfaceTintColor: widget.dialogBackgroundColor ?? Colors.white,
          title: Text(
            widget.titleText,
            style: widget.titleStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
          ),
          content: Text(
            widget.contentText,
            style:
                widget.contentStyle ?? const TextStyle(color: Colors.black54),
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    elevation: 0,
                    backgroundColor:
                        widget.secondaryCtaBackgroundColor ?? Colors.white,
                    foregroundColor:
                        widget.secondaryCtaForegroundColor ?? Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color:
                              widget.secondaryCtaBorderColor ?? Colors.black38),
                      borderRadius: BorderRadius.circular(5),
                    )),
                onPressed: widget.secondaryonTap,
                child: Text(widget.secondaryCta)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    elevation: 0,
                    backgroundColor:
                        widget.primaryCtaForegroundColor ?? Colors.black,
                    foregroundColor:
                        widget.primaryCtaForegroundColor ?? Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: widget.primaryCtaBorderColor ?? Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )),
                onPressed: widget.primaryOnTap,
                child: Text(widget.primaryCta))
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: widget.buttonBackgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.buttonRadius ?? 0),
          border: Border.all(
            width: widget.buttonBorderWidth ?? 1,
            color: widget.buttonBorderColor ?? Colors.black,
          ),
        ),
        child: Text(
          widget.ctaText,
        ),
      ),
    );
  }
}
