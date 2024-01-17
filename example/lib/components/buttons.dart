import 'package:example/widgets/custom_snackbar.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MUIPrimaryButton(text: "Button 1", onPressed: () {}),
        const SizedBox(
          height: 10,
        ),
        MUILoadingButton(
          text: "Loading Button",
          onPressed: () async {},
          loadingStateText: "loading...",
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MUIRadioButton(
              checked: radioButton,
              onChanged: (value) {
                radioButton = value;
                setState(() {});
              },
            ),
            const SizedBox(width: 5),
            MUIRadioButton.newYork(
              checked: radioButton,
              onChanged: (value) {
                radioButton = value;
                setState(() {});
              },
            ),
            const SizedBox(width: 5),
            MUIRadioButton(
              size: 50,
              checked: radioButton,
              onChanged: (value) {
                radioButton = value;
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
