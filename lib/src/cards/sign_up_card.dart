import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A sign up card with OAuth support provided by ModularUI
class MUISignUpCard extends StatefulWidget {
  /// Text Editing Controller for email
  final TextEditingController emailController;

  /// Text Editing Controller for password
  final TextEditingController passwordController;

  /// Text Editing Controller for password
  final TextEditingController confirmPasswordController;

  /// Background color of card
  final Color bgColor;

  /// Accent color of card, keep it contrasting with bgColor
  final Color accentColor;

  /// Border color for Card, keep it with shade
  final Color borderColor;

  /// Border Width for Card
  final double borderWidth;

  /// Border Radius for card
  final double borderRadius;

  /// Future Function to be passed on sign up, must be an awaited function
  final Future Function() onSignUpPressed;

  /// Function when first auth button is presssed
  final VoidCallback onFirstAuthButtonPressed;

  /// Function when second auth button is presssed
  final VoidCallback onSecondAuthButtonPressed;

  /// First auth button text
  final String firstAuthButtonText;

  /// Second auth button text
  final String secondAuthButtonText;

  /// Icon for first auth button
  final IconData firstAuthIcon;

  /// Icon for second auth button
  final IconData secondAuthIcon;

  /// Auth Button icon color
  final Color authButtonIconColor;

  /// Auth button text color
  final Color authButtonTextColor;

  /// On Login now clicked
  final VoidCallback onLogInNowPressed;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  const MUISignUpCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUpPressed,
    this.bgColor = Colors.black,
    this.borderColor = Colors.grey,
    this.accentColor = Colors.white,
    this.borderWidth = 1.5,
    this.borderRadius = 12,
    this.authButtonIconColor = Colors.white,
    this.authButtonTextColor = Colors.white,
    this.maxWidth = 430,
    required this.firstAuthButtonText,
    required this.secondAuthButtonText,
    required this.firstAuthIcon,
    required this.secondAuthIcon,
    required this.onFirstAuthButtonPressed,
    required this.onSecondAuthButtonPressed,
    required this.onLogInNowPressed,
  });

  @override
  State<MUISignUpCard> createState() => _MUISignUpCardState();
}

class _MUISignUpCardState extends State<MUISignUpCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border:
            Border.all(color: widget.borderColor, width: widget.borderWidth),
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: TextStyle(
                  color: widget.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenWidth(context) <= widget.maxWidth
                      ? getScreenWidth(context) * 0.08
                      : 32),
            ),
            Text('Enter your email & password to sign up',
                style: TextStyle(
                    color: widget.accentColor, fontWeight: FontWeight.w300)),
            SizedBox(height: getScreenHeight(context) * 0.03),
            Text(' Email',
                style: TextStyle(
                    color: widget.accentColor, fontWeight: FontWeight.bold)),
            SizedBox(height: getScreenHeight(context) * 0.01),
            MUIPrimaryInputField(
              isObscure: false,
              hintText: 'me@example.com',
              hintStyle: TextStyle(color: widget.borderColor),
              enabledBorderColor: widget.accentColor,
              disabledBorderColor: widget.borderColor,
              borderWidth: 1,
              borderRadius: 10,
              textStyle: TextStyle(
                  color: widget.accentColor, fontWeight: FontWeight.w300),
              controller: widget.emailController,
              filledColor: widget.bgColor,
            ),
            SizedBox(height: getScreenHeight(context) * 0.02),
            Text(' Password',
                style: TextStyle(
                    color: widget.accentColor, fontWeight: FontWeight.bold)),
            SizedBox(height: getScreenHeight(context) * 0.01),
            MUIPrimaryInputField(
              isObscure: true,
              hintText: 'password',
              hintStyle: TextStyle(color: widget.borderColor),
              enabledBorderColor: widget.accentColor,
              disabledBorderColor: widget.borderColor,
              borderWidth: 1,
              borderRadius: 10,
              textStyle: TextStyle(
                  color: widget.accentColor, fontWeight: FontWeight.w300),
              controller: widget.passwordController,
              filledColor: widget.bgColor,
            ),
            SizedBox(height: getScreenHeight(context) * 0.02),
            Text(' Confirm Password',
                style: TextStyle(
                    color: widget.accentColor, fontWeight: FontWeight.bold)),
            SizedBox(height: getScreenHeight(context) * 0.01),
            MUIPrimaryInputField(
              isObscure: true,
              hintText: 'confirm password',
              hintStyle: TextStyle(color: widget.borderColor),
              enabledBorderColor: widget.accentColor,
              disabledBorderColor: widget.borderColor,
              borderWidth: 1,
              borderRadius: 10,
              textStyle: TextStyle(
                  color: widget.accentColor, fontWeight: FontWeight.w300),
              controller: widget.confirmPasswordController,
              filledColor: widget.bgColor,
            ),
            SizedBox(height: getScreenHeight(context) * 0.03),
            Center(
              child: MUILoadingBlockLevelButton(
                  text: 'Sign up',
                  bgColor: widget.accentColor,
                  textColor: widget.bgColor,
                  loadingStateTextColor: widget.bgColor,
                  loadingStateText: 'Loading',
                  onPressed: () async {
                    if (widget.passwordController.text ==
                        widget.confirmPasswordController.text) {
                      await widget.onSignUpPressed();
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getScreenWidth(context) <= widget.maxWidth
                        ? getScreenWidth(context) * 0.23
                        : 95,
                    child: Divider(
                      color: widget.accentColor,
                      thickness: 0.35,
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.05),
                  Text(' OR CONTINUE WITH ',
                      style: TextStyle(
                        color: widget.accentColor,
                        fontSize: getScreenWidth(context) <= widget.maxWidth
                            ? getScreenWidth(context) * 0.02
                            : 10,
                        fontWeight: FontWeight.w200,
                      )),
                  SizedBox(
                    width: getScreenWidth(context) <= widget.maxWidth
                        ? getScreenWidth(context) * 0.23
                        : 95,
                    child: Divider(
                      color: widget.accentColor,
                      thickness: 0.35,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 30,
                children: [
                  MUIOutlinedButton(
                    text: widget.firstAuthButtonText,
                    onPressed: () {
                      widget.onFirstAuthButtonPressed();
                    },
                    borderColor: widget.borderColor,
                    leadingIcon: widget.firstAuthIcon,
                    iconColor: widget.authButtonIconColor,
                    borderRadius: 5,
                    borderWidth: 1,
                    textColor: widget.accentColor,
                    maxHorizontalPadding: 50,
                  ),
                  MUIOutlinedButton(
                    text: widget.secondAuthButtonText,
                    onPressed: () {
                      widget.onSecondAuthButtonPressed();
                    },
                    borderColor: widget.borderColor,
                    leadingIcon: widget.secondAuthIcon,
                    iconColor: widget.authButtonIconColor,
                    borderRadius: 5,
                    borderWidth: 1,
                    textColor: widget.accentColor,
                    maxHorizontalPadding: 50,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? ",
                    style: TextStyle(color: widget.accentColor, fontSize: 11)),
                TextButton(
                    onPressed: () {
                      widget.onLogInNowPressed();
                    },
                    child: Text('Login now',
                        style:
                            TextStyle(color: widget.borderColor, fontSize: 11)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
