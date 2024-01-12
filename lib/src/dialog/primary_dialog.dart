import 'package:flutter/material.dart';

class MUIPrimaryDialog extends StatefulWidget {
  const MUIPrimaryDialog({
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
    required this.primaryOnPressed,
    required this.secondaryOnPressed,
    this.primaryCtaBackgroundColor,
    this.primaryCtaForegroundColor,
    this.primaryCtaBorderColor,
    this.secondaryCtaBackgroundColor,
    this.secondaryCtaForegroundColor,
    this.secondaryCtaBorderColor,
  });

// background color of the initial button that open the dialog
  final Color? buttonBackgroundColor;

// border radius of the initial button that open the dialog
  final double? buttonRadius;

// border width of the initial button that open the dialog
  final double? buttonBorderWidth;

// border color of the initial button that open the dialog
  final Color? buttonBorderColor;

// Text that appears on the initial button that open the dialog
  final String ctaText;

// Title of the dialog box thart appears on the top
  final String titleText;

// The main content of the dialog box
  final String contentText;

// border radius of the dialog box [default: 5]
  final double? dialogRadius;

// color of the dialog box [default: white]
  final Color? dialogBackgroundColor;

// text style of the dialog box [default: size=18, bold, color=black]
  final TextStyle? titleStyle;

// text style of the dialog box [default: color=black54]
  final TextStyle? contentStyle;

// text on the primary button
  final String primaryCta;

// onTap functionality of the primary button
  final Function()? primaryOnPressed;

// text on the secondary button
  final String secondaryCta;

// onTap functionality of the secondary button
  final Function()? secondaryOnPressed;

// background color of the primary button [default: black]
  final Color? primaryCtaBackgroundColor;

// foreground color of the primary button [default: white]
  final Color? primaryCtaForegroundColor;

// border color of the primary button [default: black]
  final Color? primaryCtaBorderColor;

// background color of the secondary button [default: white]
  final Color? secondaryCtaBackgroundColor;

// foreground color of the secondary button [default: black]
  final Color? secondaryCtaForegroundColor;

// border color of the secondary button [default: black54]
  final Color? secondaryCtaBorderColor;

  @override
  State<MUIPrimaryDialog> createState() => _MUIPrimaryDialogState();
}

class _MUIPrimaryDialogState extends State<MUIPrimaryDialog> {
  @override
  Widget build(BuildContext context) {
    // inkwell to have add the onTap functionality to the button
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // change the shape of the dialog box to bordered rect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.dialogRadius ?? 5,
            ),
          ),
          backgroundColor: widget.dialogBackgroundColor ?? Colors.white,
          surfaceTintColor: widget.dialogBackgroundColor ?? Colors.white,

          // title text of the dialog
          title: Text(
            widget.titleText,
            style: widget.titleStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
          ),

          // content text of the dialog
          content: Text(
            widget.contentText,
            style:
                widget.contentStyle ?? const TextStyle(color: Colors.black54),
          ),

          // action buttons of the dialog
          actions: [
            // secondary button
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

              // secondary onTap
              onPressed: widget.secondaryOnPressed,
              // secondary cta text
              child: Text(widget.secondaryCta),
            ),

            // primary button
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

              // primary onTap
              onPressed: widget.primaryOnPressed,
              // primary cta text
              child: Text(widget.primaryCta),
            )
          ],
        ),
      ),

      // button that opens the dialog
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

        // cta text
        child: Text(
          widget.ctaText,
        ),
      ),
    );
  }
}
