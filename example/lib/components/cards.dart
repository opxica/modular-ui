import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent cardsComponent =
    WidgetbookComponent(name: "Cards", useCases: [
  WidgetbookUseCase(
    name: "Primary",
    builder: (context) => Center(
      child: MUIPrimaryCard(
          title: context.knobs
              .string(label: "Title", initialValue: "UI/UX Review Check"),
          description: context.knobs.string(
              label: "Description",
              initialValue:
                  'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona'),
          image: Image.network(
            context.knobs.string(
                label: "Image url",
                initialValue:
                    'https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'),
          ),
          bgColor: context.knobs
              .color(label: "Background color", initialValue: Colors.white),
          borderRadius: context.knobs.double.input(
            label: "Card border radius",
            initialValue: 10,
          ),
          imageRadius: context.knobs.double.input(
            label: "Image border radius",
            initialValue: 10,
          ),
          onButtonTap: () {},
          buttonText: context.knobs
              .string(label: "Button text", initialValue: "Read more")),
    ),
  ),
  WidgetbookUseCase(
    name: "Simple",
    builder: (context) => Center(
      child: MUISimpleCard(
          title: context.knobs
              .string(label: "Title", initialValue: "UI/UX Review Check"),
          description: context.knobs.string(
              label: "Description",
              initialValue:
                  'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona'),
          bgColor: context.knobs
              .color(label: "Background color", initialValue: Colors.white),
          borderRadius: context.knobs.double.input(
            label: "Card border radius",
            initialValue: 10,
          ),
          onButtonTap: () {},
          buttonText: context.knobs
              .string(label: "Button text", initialValue: "Read more")),
    ),
  ),
]);

Widget card() {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: MUIPrimaryCard(
          title: 'UI/UX Review Check',
          onButtonTap: () {},
          description:
              'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
          image: Image.network(
              'https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'),
          buttonText: 'Read more',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: MUISimpleCard(
          title: 'UI/UX Review Check',
          onButtonTap: () {},
          description:
              'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
          buttonText: 'Read more',
        ),
      ),
    ],
  );
}
