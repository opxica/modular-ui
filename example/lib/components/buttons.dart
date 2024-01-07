import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:widgetbook/widgetbook.dart';

Widget button() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUIPrimaryButton(text: "Button 1", onTap: () {}),
      MUILoadingButton(
        text: "Button 2",
        onPressed: () async {},
        loadingStateText: "hehe",
      ),
    ],
  );
}

WidgetbookComponent buttonComponent =
    WidgetbookComponent(name: "Button", useCases: [
  WidgetbookUseCase(
      name: "Primary",
      builder: (context) {
        return Center(
          child: MUIPrimaryButton(
            text: context.knobs
                .string(label: "Button text", initialValue: "Loading"),
            onTap: () async {},
            bgColor: context.knobs
                .color(label: "Background color", initialValue: Colors.black),
            borderRadius: context.knobs.double.input(
              label: "Border radius",
              initialValue: 10,
            ),
            widthFactorUnpressed: context.knobs.double.slider(
                label: "width factor unpressed",
                initialValue: 0.04,
                min: 0.01,
                max: 0.5),
            widthFactorPressed: context.knobs.double.slider(
                label: "width factor pressed",
                initialValue: 0.035,
                min: 0.01,
                max: 0.1),
            heightFactorUnPressed: context.knobs.double.slider(
                label: "height factor unpressed",
                initialValue: 0.03,
                min: 0.01,
                max: 0.5),
            heightFactorPressed: context.knobs.double.slider(
                label: "height factor pressed",
                initialValue: 0.025,
                min: 0.01,
                max: 0.1),
            leadingIcon: context.knobs.boolean(label: "Show leading Icon")
                ? Icons.text_format
                : null,
            actionIcon: context.knobs.boolean(label: "Show action Icon")
                ? Icons.edit
                : null,
            hapticsEnabled: context.knobs.boolean(label: "Haptics enabled"),
            textColor: context.knobs
                .color(label: "Text color", initialValue: Colors.white),
            iconColor: context.knobs
                .color(label: "Icon color", initialValue: Colors.white),
          ),
        );
      }),
  WidgetbookUseCase(
      name: "Loading",
      builder: (context) {
        return Center(
          child: MUILoadingButton(
            text: context.knobs
                .string(label: "Button text", initialValue: "Loading"),
            onPressed: () async {
              await Future.delayed(context.knobs.duration(
                  label: "Test loading duration",
                  initialValue: const Duration(seconds: 3)));
            },
            bgColor: context.knobs
                .color(label: "Background color", initialValue: Colors.black),
            borderRadius: context.knobs.double.input(
              label: "Border radius",
              initialValue: 10,
            ),
            widthFactorUnpressed: context.knobs.double.slider(
                label: "width factor unpressed",
                initialValue: 0.04,
                min: 0.01,
                max: 0.5),
            widthFactorPressed: context.knobs.double.slider(
                label: "width factor pressed",
                initialValue: 0.035,
                min: 0.01,
                max: 0.1),
            heightFactorUnPressed: context.knobs.double.slider(
                label: "height factor unpressed",
                initialValue: 0.03,
                min: 0.01,
                max: 0.5),
            heightFactorPressed: context.knobs.double.slider(
                label: "height factor pressed",
                initialValue: 0.025,
                min: 0.01,
                max: 0.1),
            leadingIcon: context.knobs.boolean(label: "Show leading Icon")
                ? Icons.text_format
                : null,
            actionIcon: context.knobs.boolean(label: "Show action Icon")
                ? Icons.edit
                : null,
            hapticsEnabled: context.knobs.boolean(label: "Haptics enabled"),
            animationDuraton: context.knobs
                .duration(
                    label: "Animation duration",
                    initialValue: Duration(milliseconds: 250))
                .inMilliseconds,
            textColor: context.knobs
                .color(label: "Text color", initialValue: Colors.white),
            iconColor: context.knobs
                .color(label: "Icon color", initialValue: Colors.white),
            loadingStateText: "hehe",
          ),
        );
      }),
  WidgetbookUseCase(
      name: "Gradient",
      builder: (context) {
        return Center(
          child: MUIGradientButton(
            text: context.knobs
                .string(label: "Button text", initialValue: "Gradient"),
            bgGradient: LinearGradient(colors: [
              context.knobs
                  .color(label: "Gradient color 1", initialValue: Colors.black),
              context.knobs
                  .color(label: "Gradient color 2", initialValue: Colors.grey)
            ]),
            borderRadius: context.knobs.double.input(
              label: "Border radius",
              initialValue: 10,
            ),
            widthFactorUnpressed: context.knobs.double.slider(
                label: "width factor unpressed",
                initialValue: 0.04,
                min: 0.01,
                max: 0.5),
            widthFactorPressed: context.knobs.double.slider(
                label: "width factor pressed",
                initialValue: 0.035,
                min: 0.01,
                max: 0.1),
            heightFactorUnPressed: context.knobs.double.slider(
                label: "height factor unpressed",
                initialValue: 0.03,
                min: 0.01,
                max: 0.5),
            heightFactorPressed: context.knobs.double.slider(
                label: "height factor pressed",
                initialValue: 0.03,
                min: 0.01,
                max: 0.1),
            leadingIcon: context.knobs.boolean(label: "Show leading Icon")
                ? Icons.text_format
                : null,
            actionIcon: context.knobs.boolean(label: "Show action Icon")
                ? Icons.edit
                : null,
            hapticsEnabled: context.knobs.boolean(label: "Haptics enabled"),
            animationDuraton: context.knobs
                .duration(
                    label: "Animation duration",
                    initialValue: Duration(milliseconds: 250))
                .inMilliseconds,
            textColor: context.knobs
                .color(label: "Text color", initialValue: Colors.black),
            iconColor: context.knobs
                .color(label: "Icon color", initialValue: Colors.black),
            onTap: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          ),
        );
      }),
  WidgetbookUseCase(
      name: "Outlined",
      builder: (context) {
        return Center(
          child: MUIOutlinedButton(
            text: context.knobs
                .string(label: "Button text", initialValue: "Outlined"),
            borderRadius: context.knobs.double.input(
              label: "Border radius",
              initialValue: 10,
            ),
            widthFactorUnpressed: context.knobs.double.slider(
                label: "width factor unpressed",
                initialValue: 0.04,
                min: 0.01,
                max: 0.5),
            widthFactorPressed: context.knobs.double.slider(
                label: "width factor pressed",
                initialValue: 0.035,
                min: 0.01,
                max: 0.1),
            heightFactorUnPressed: context.knobs.double.slider(
                label: "height factor unpressed",
                initialValue: 0.03,
                min: 0.01,
                max: 0.5),
            heightFactorPressed: context.knobs.double.slider(
                label: "height factor pressed",
                initialValue: 0.03,
                min: 0.01,
                max: 0.1),
            leadingIcon: context.knobs.boolean(label: "Show leading Icon")
                ? Icons.text_format
                : null,
            actionIcon: context.knobs.boolean(label: "Show action Icon")
                ? Icons.edit
                : null,
            hapticsEnabled: context.knobs.boolean(label: "Haptics enabled"),
            animationDuraton: context.knobs
                .duration(
                    label: "Animation duration",
                    initialValue: Duration(milliseconds: 250))
                .inMilliseconds,
            textColor: context.knobs
                .color(label: "Text color", initialValue: Colors.black),
            iconColor: context.knobs
                .color(label: "Icon color", initialValue: Colors.black),
            bgColor: context.knobs.color(
                label: "Background color", initialValue: Colors.transparent),
            onTap: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          ),
        );
      }),
  WidgetbookUseCase(
      name: "Text",
      builder: (context) {
        return Center(
          child: MUITextButton(
            text: context.knobs.string(
                label: "Button text",
                initialValue: "This is an awesome TextButton"),
            leadingIcon: context.knobs.boolean(label: "Show leading Icon")
                ? Icons.text_format
                : null,
            actionIcon: context.knobs.boolean(label: "Show action Icon")
                ? Icons.edit
                : null,
            hapticsEnabled: context.knobs.boolean(label: "Haptics enabled"),
            animationDuraton: context.knobs
                .duration(
                    label: "Animation duration",
                    initialValue: Duration(milliseconds: 250))
                .inMilliseconds,
            textColor: context.knobs
                .color(label: "Text color", initialValue: Colors.black),
            iconColor: context.knobs
                .color(label: "Icon color", initialValue: Colors.black),
            bgColor: context.knobs
                .color(label: "Background color", initialValue: Colors.grey),
            onTap: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          ),
        );
      }),
]);
