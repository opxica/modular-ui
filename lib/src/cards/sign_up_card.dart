import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:modular_ui/src/utils/dimensions.dart';

/// A sign up card with OAuth support provided by ModularUI
class MUISignUpCard extends StatefulWidget {
  const MUISignUpCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUpPressed,
    required this.onLogInNowPressed,
    this.bgColor = Colors.black,
    this.borderColor = Colors.grey,
    this.accentColor = Colors.white,
    this.borderWidth = 1.5,
    this.borderRadius = 12,
    this.maxWidth = 430,
    this.boxShadows = const [
      BoxShadow(
        color: Color.fromARGB(255, 37, 37, 37),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
    this.authButtons = const [],
  });

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

  /// On Login now clicked
  final VoidCallback onLogInNowPressed;

  /// max width of the card, width of the card can not exceed this value
  /// If the screen width is less than this value then the widget will be responsive to the screen size
  /// Else if screen width is greater than this maxWidth then the widget width will be equal to maxWidth
  final double maxWidth;

  /// List of Flutter Widgets or ModularUI Widgets which can be used as auth buttons.
  /// You can provide buttons to this list.
  final List<Widget>? authButtons;

  /// Boxshadow for card
  final List<BoxShadow>? boxShadows;

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
        boxShadow: widget.boxShadows,
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
              child: MUILoadingBlockButton(
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
            if (widget.authButtons!.isNotEmpty)
              Container(
                margin: EdgeInsets.all(getScreenWidth(context) * 0.02),
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
            Row(
              mainAxisAlignment: (widget.authButtons!.length == 1)
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceEvenly,
              children: widget.authButtons!,
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
