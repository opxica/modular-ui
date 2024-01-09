import 'package:example/enums/button_variant.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.text,
    required this.buttonVariant,
  });
  final String text;
  final ButtonVariant buttonVariant;

  @override
  Widget build(BuildContext context) {
    // render button based on variant
    return Center(
      child: buttonVariant == ButtonVariant.gradientBlockLevelButton
          ? MUIGradientBlockLevelButton(
              text: text,
              onTap: () {},
            )
          : buttonVariant == ButtonVariant.gradientButton
              ? MUIGradientButton(
                  text: text,
                  onTap: () {},
                )
              : buttonVariant == ButtonVariant.loadingBlockLevelButton
                  ? MUILoadingBlockLevelButton(
                      text: text,
                      onPressed: () async {},
                    )
                  : buttonVariant == ButtonVariant.loadingButton
                      ? MUILoadingButton(
                          text: text,
                          onPressed: () async {},
                        )
                      : buttonVariant == ButtonVariant.primaryBlockLevelButton
                          ? MUIPrimaryBlockButton(
                              text: text,
                              onTap: () {},
                            )
                          : buttonVariant == ButtonVariant.primaryButton
                              ? MUIPrimaryButton(
                                  text: text,
                                  onTap: () {},
                                )
                              : buttonVariant ==
                                      ButtonVariant.textBlockLevelButton
                                  ? MUITextBlockLevelButton(
                                      text: text,
                                      onTap: () {},
                                    )
                                  : MUITextButton(
                                      text: text,
                                      onTap: () {},
                                    ),
    );
  }
}