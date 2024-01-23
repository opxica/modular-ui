import 'package:flutter/material.dart';

class MUIPrimaryDialog {
  const MUIPrimaryDialog({
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

// Title of the dialog box that appears on the top
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

  Future<dynamic> showDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // change the shape of the dialog box to bordered rect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            dialogRadius ?? 5,
          ),
        ),
        backgroundColor: dialogBackgroundColor ?? Colors.white,
        surfaceTintColor: dialogBackgroundColor ?? Colors.white,

        // title text of the dialog
        title: Text(
          titleText,
          style: titleStyle ??
              const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ),

        // content text of the dialog
        content: Text(
          contentText,
          style: contentStyle ?? const TextStyle(color: Colors.black54),
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
              backgroundColor: secondaryCtaBackgroundColor ?? Colors.white,
              foregroundColor: secondaryCtaForegroundColor ?? Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: secondaryCtaBorderColor ?? Colors.black38,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            // secondary onTap
            onPressed: secondaryOnPressed,
            // secondary cta text
            child: Text(secondaryCta),
          ),

          // primary button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              elevation: 0,
              backgroundColor: primaryCtaForegroundColor ?? Colors.black,
              foregroundColor: primaryCtaForegroundColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: primaryCtaBorderColor ?? Colors.black,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            // primary onTap
            onPressed: primaryOnPressed,
            // primary cta text
            child: Text(primaryCta),
          )
        ],
      ),
    );
  }
}
