import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent inputFieldsComponent =
    WidgetbookComponent(name: "Input Fields", useCases: [
  WidgetbookUseCase(
    name: "Primary",
    builder: (context) {
      return Center(
        child: MUIPrimaryInputField(
          hintText: context.knobs.string(label: "Hint text"),
          controller: TextEditingController(),
          filledColor: context.knobs
              .color(label: "Filled Color", initialValue: Colors.white),
          widthFactor: context.knobs.double.slider(
              label: "Width factor", initialValue: 0.95, min: 0.1, max: 1.5),
        ),
      );
    },
  )
]);
