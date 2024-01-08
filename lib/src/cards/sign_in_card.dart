import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A sign in card with OAuth support provided by ModularUI
class MUISignInCard extends StatefulWidget {
  /// Text Editing Controller for email
  final TextEditingController emailController;

  /// Text Editing Controller for password
  final TextEditingController passwordController;

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

  /// Future Function to be passed on sign in, must be an awaited function
  final Future Function() onSigninPressed;

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

  /// On register now clicked
  final VoidCallback onRegisterNow;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  /// Overall height of this widget, It has a fixed value by default
  /// You can provide a dynamic height to this widget or leave it as it is.
  final double widgetHeight;
  const MUISignInCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onSigninPressed,
    this.bgColor = Colors.black,
    this.borderColor = Colors.grey,
    this.accentColor = Colors.white,
    this.borderWidth = 1.5,
    this.borderRadius = 12,
    this.authButtonIconColor = Colors.white,
    this.authButtonTextColor = Colors.white,
    this.maxWidth = 430,
    this.widgetHeight = 550,
    required this.firstAuthButtonText,
    required this.secondAuthButtonText,
    required this.firstAuthIcon,
    required this.secondAuthIcon,
    required this.onFirstAuthButtonPressed,
    required this.onSecondAuthButtonPressed,
    required this.onRegisterNow,
  });

  @override
  State<MUISignInCard> createState() => _MUISignInCardState();
}

class _MUISignInCardState extends State<MUISignInCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      width: getScreenWidth(context) <= widget.maxWidth
          ? getScreenWidth(context) * 0.88
          : widget.maxWidth,
      height: widget.widgetHeight,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border:
            Border.all(color: widget.borderColor, width: widget.borderWidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in',
            style: TextStyle(
                color: widget.accentColor,
                fontWeight: FontWeight.bold,
                fontSize: getScreenWidth(context) <= widget.maxWidth
                    ? getScreenWidth(context) * 0.08
                    : 32),
          ),
          Text('Enter your email & password to sign in',
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
          SizedBox(height: getScreenHeight(context) * 0.03),
          Center(
            child: MUILoadingBlockLevelButton(
                text: 'Sign in',
                bgColor: widget.accentColor,
                textColor: widget.bgColor,
                loadingStateTextColor: widget.bgColor,
                loadingStateText: 'Loading',
                onPressed: () async {
                  await widget.onSigninPressed();
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getScreenWidth(context) * 0.23,
                  child: Divider(
                    color: widget.accentColor,
                    thickness: 0.35,
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.05),
                Text('OR CONTINUE WITH',
                    style: TextStyle(
                      color: widget.accentColor,
                      fontSize: getScreenWidth(context) * 0.02,
                      fontWeight: FontWeight.w200,
                    )),
                SizedBox(
                  width: getScreenWidth(context) * 0.23,
                  child: Divider(
                    color: widget.accentColor,
                    thickness: 0.35,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MUIOutlinedButton(
                borderColor: widget.borderColor,
                leadingIcon: widget.firstAuthIcon,
                iconColor: widget.authButtonIconColor,
                widthFactorUnpressed: 0.07,
                widthFactorPressed: 0.06,
                borderRadius: 5,
                borderWidth: 1,
                text: widget.firstAuthButtonText,
                textColor: widget.accentColor,
                onTap: () {
                  widget.onFirstAuthButtonPressed();
                },
              ),
              MUIOutlinedButton(
                borderColor: widget.borderColor,
                leadingIcon: widget.secondAuthIcon,
                iconColor: widget.authButtonIconColor,
                widthFactorUnpressed: 0.07,
                widthFactorPressed: 0.06,
                borderRadius: 5,
                borderWidth: 1,
                text: widget.secondAuthButtonText,
                textColor: widget.accentColor,
                onTap: () {
                  widget.onSecondAuthButtonPressed();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account ? ",
                  style: TextStyle(color: widget.accentColor)),
              TextButton(
                  onPressed: () {
                    widget.onRegisterNow();
                  },
                  child: Text('Register now',
                      style: TextStyle(color: widget.borderColor)))
            ],
          )
        ],
      ),
    );
  }
}
