import 'package:example/widgets/collapsible_unit.dart';
import 'package:example/widgets/custom_snackbar.dart';
import 'package:example/widgets/shadow.dart';
import 'package:example/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget button() {
  return const ButtonsView();
}

class ButtonsView extends StatefulWidget {
  const ButtonsView({
    super.key,
  });

  @override
  State<ButtonsView> createState() => _ButtonsViewState();
}

class _ButtonsViewState extends State<ButtonsView> {
  bool radioButton = false;
  bool isCollapsible = false;

  void onButtonPressed(String button) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: CustomSnackbar(
        title: 'Pressed!',
        message: 'You just pressed $button!',
        color: Theme.of(context).primaryColor,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// Primary Button
          text("Primary Button"),
          const SizedBox(height: 6),
          MUIPrimaryButton(
            text: "Primary Button",
            onPressed: () => onButtonPressed("Primary Button"),
            boxShadows: mUILightSmallShadow,
          ),
          const SizedBox(height: 16.0),

          /// Primary Button with Icon
          text("Primary Button with Icon"),
          const SizedBox(height: 6),
          MUIPrimaryButton(
            text: "Primary Button",
            onPressed: () => onButtonPressed("Primary Button"),
            leadingIcon: Icons.add,
            boxShadows: mUILightSmallShadow,
          ),

          const SizedBox(height: 16.0),

          /// Outlined Button
          text("Outline Button"),
          const SizedBox(height: 6),
          MUIOutlinedButton(
            text: "Outline Button",
            onPressed: () => onButtonPressed("Outline Button"),
          ),
          const SizedBox(height: 16.0),

          /// Loading Button
          text("Loading Button"),
          const SizedBox(height: 6),
          MUILoadingButton(
            text: "Loading Button",
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 2));
              onButtonPressed("Loading Button");
            },
            boxShadows: mUILightSmallShadow,
            loadingStateText: "loading...",
          ),
          const SizedBox(height: 16.0),

          /// Gradient Button
          text("Gradient Button"),
          const SizedBox(height: 6),
          MUIGradientButton(
            text: "Gradient Button",
            onPressed: () => onButtonPressed("Gradient Button"),
            bgGradient: const LinearGradient(
              colors: [Color(0xFF4b6cb7), Color(0xFF182848)],
            ),
            boxShadows: mUILightSmallShadow,
          ),
          const SizedBox(height: 16.0),

          /// Text Button
          text("Text Button"),
          const SizedBox(height: 6),
          MUITextButton(
            text: "Text Button",
            onPressed: () => onButtonPressed("Text Button"),
          ),
          const SizedBox(height: 16.0),

          /// Secondary Button
          text("Secondary Button"),
          const SizedBox(height: 6),
          MUISecondaryButton(
            text: "Secondary Button",
            onPressed: () => onButtonPressed("Secondary Button"),
            boxShadows: mUILightSmallShadow,
          ),
          const SizedBox(height: 16.0),

          /// Secondary Outlined Button
          text("Secondary Outlined Button"),
          const SizedBox(height: 6),
          MUISecondaryOutlinedButton(
            bgColor: Colors.white,
            text: "Secondary Outlined Button",
            onPressed: () => onButtonPressed("Secondary Outline Button"),
          ),
          const SizedBox(height: 16.0),

          // Collapsible Button
          text("Secondary Outlined Button"),
          const SizedBox(height: 6),
          MUISecondaryOutlinedButton(
            bgColor: Colors.white,
            text: "Secondary Outlined Button",
            onPressed: () => onButtonPressed("Secondary Outline Button"),
          ),
          const SizedBox(height: 16.0),

          text("Collapsible Button"),
          const SizedBox(height: 6),
          MUICollapsibleButton(
            actionIcon:
                isCollapsible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            collapsibleChild: const CollapsibleUnit(),
            text: 'Collapsible Button',
            onPressed: () {
              isCollapsible = !isCollapsible;
            },
          ),
          const SizedBox(height: 16.0),

          /// Primary Block Button
          text("Primary Block Button"),
          const SizedBox(height: 6),
          MUIPrimaryBlockButton(
            text: "Primary Block Button",
            onPressed: () => onButtonPressed("Primary Block Button"),
            boxShadows: mUILightSmallShadow,
          ),
          const SizedBox(height: 16.0),

          /// Outline Block Button
          text("Outline Block Button"),
          const SizedBox(height: 6),
          MUIOutlinedBlockButton(
            text: "Outline Block Button",
            onPressed: () => onButtonPressed("Outline Block Button"),
          ),
          const SizedBox(height: 16.0),

          /// Loading Block Button
          text("Loading Block Button"),
          const SizedBox(height: 6),
          MUILoadingBlockButton(
            text: "Loading Block Button",
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 2));
              onButtonPressed("Loading Block Button");
            },
            boxShadows: mUILightSmallShadow,
            loadingStateText: "loading...",
          ),
          const SizedBox(height: 16.0),

          /// Gradient Block Button
          text("Gradient Block Button"),
          const SizedBox(height: 6),
          MUIGradientBlockButton(
            text: "Gradient Block Button",
            onPressed: () => onButtonPressed("Gradient Block Button"),
            bgGradient: const LinearGradient(
              colors: [Color(0xFF4b6cb7), Color(0xFF182848)],
            ),
            boxShadows: mUILightSmallShadow,
          ),
          const SizedBox(height: 16.0),

          /// Text Block Button
          text("Text Block Button"),
          const SizedBox(height: 6),
          MUITextBlockButton(
            text: "Text Block Button",
            onPressed: () => onButtonPressed("Text Block Button"),
          ),
          const SizedBox(height: 16.0),

          /// Secondary Block Button
          text("Secondary Block Button"),
          const SizedBox(height: 6),
          MUISecondaryBlockButton(
            text: "Secondary Block Button",
            onPressed: () => onButtonPressed("Secondary Block Button"),
            boxShadows: mUILightSmallShadow,
          ),
          const SizedBox(height: 16.0),

          /// Secondary Outlined Block Button
          text("Secondary Outlined Block Button"),
          const SizedBox(height: 6),
          MUISecondaryOutlinedBlockButton(
            text: "Secondary Outlined Block Button",
            onPressed: () => onButtonPressed("Secondary Outlined Block Button"),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  /// Radio Buttons
                  text("Radio Buttons"),
                  const SizedBox(height: 6),
                  MUIRadioButton(
                    checked: radioButton,
                    size: 50,
                    onChanged: (value) {
                      radioButton = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
              Column(
                children: [
                  /// Radio Buttons new york
                  text("Radio Buttons new york"),
                  const SizedBox(height: 6),
                  MUIRadioButton.newYork(
                    checked: radioButton,
                    size: 50,
                    onChanged: (value) {
                      radioButton = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              )
            ],
          ),

          // const SizedBox(height: 5),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     MUIRadioButton(
          //       checked: radioButton,
          //       onChanged: (value) {
          //         radioButton = value;
          //         setState(() {});
          //       },
          //     ),
          //     const SizedBox(width: 5),
          //     MUIRadioButton.newYork(
          //       checked: radioButton,
          //       onChanged: (value) {
          //         radioButton = value;
          //         setState(() {});
          //       },
          //     ),
          //     const SizedBox(width: 5),
          //     MUIRadioButton(
          //       size: 50,
          //       checked: radioButton,
          //       onChanged: (value) {
          //         radioButton = value;
          //         setState(() {});
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
