import 'package:example/components/buttons.dart';
import 'package:example/components/cards.dart';
import 'package:example/components/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/next.dart' as next;
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        buttonComponent,
        cardsComponent,
        inputFieldsComponent,
      ],
      addons: [
        next.MaterialThemeAddon({
          'Light': ThemeData.light(),
          'Dark': ThemeData.dark(),
        }),
      ],
    );
  }
}
