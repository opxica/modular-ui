import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget tabsComponent() {
  ValueNotifier<int> tabIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> transparentTabIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> underlinedTabIndexNotifier = ValueNotifier(0);
  ValueNotifier<int> verticalTabIndexNotifier = ValueNotifier(0);
  return Container(
    color: const Color.fromARGB(255, 248, 250, 252),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Default"),
        ValueListenableBuilder(
            valueListenable: tabIndexNotifier,
            builder: (context, tabIndex, child) {
              return MUITabs(
                tabIndex: tabIndex,
                onChanged: (index) {
                  tabIndexNotifier.value = index;
                },
                tabs: [
                  MUITab(label: "HTML"),
                  MUITab(label: "React"),
                  MUITab(label: "Vue"),
                  MUITab(label: "Angular"),
                  MUITab(label: "Svelte"),
                ],
              );
            }),
        const SizedBox(
          height: 30,
        ),
        const Text("Transparent"),
        ValueListenableBuilder(
            valueListenable: transparentTabIndexNotifier,
            builder: (context, tIndex, child) {
              return MUITabs.transparent(
                tabIndex: tIndex,
                onChanged: (index) {
                  transparentTabIndexNotifier.value = index;
                },
                tabs: [
                  MUITab(label: "HTML"),
                  MUITab(label: "React"),
                  MUITab(label: "Vue"),
                  MUITab(label: "Angular"),
                  MUITab(label: "Svelte"),
                ],
              );
            }),
        const SizedBox(
          height: 30,
        ),
        const Text("Underlined"),
        ValueListenableBuilder(
            valueListenable: underlinedTabIndexNotifier,
            builder: (context, tIndex, child) {
              return MUITabs.underlined(
                tabIndex: tIndex,
                onChanged: (index) {
                  underlinedTabIndexNotifier.value = index;
                },
                tabs: [
                  MUITab(label: "HTML"),
                  MUITab(label: "React"),
                  MUITab(label: "Vue"),
                  MUITab(label: "Angular"),
                  MUITab(label: "Svelte"),
                ],
              );
            }),
        const SizedBox(
          height: 30,
        ),
        const Text("Vertical"),
        ValueListenableBuilder(
            valueListenable: verticalTabIndexNotifier,
            builder: (context, tabIndex, child) {
              return MUITabs(
                axis: Axis.vertical,
                tabIndex: tabIndex,
                onChanged: (index) {
                  verticalTabIndexNotifier.value = index;
                },
                underline: false,
                tabs: [
                  MUITab(label: "HTML"),
                  MUITab(label: "React"),
                  MUITab(label: "Vue"),
                  MUITab(label: "Angular"),
                  MUITab(label: "Svelte"),
                ],
              );
            }),
      ],
    ),
  );
}
