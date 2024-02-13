import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget dropdown() {
  return const DropdownView();
}


class DropdownView extends StatefulWidget {
  const DropdownView({super.key});

  @override
  State<DropdownView> createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {
  Map<String, dynamic>? selectedMap;
  String? selectedString;

  List<Map<String, dynamic>> mapItems = [
    {'id': 1, 'display': 'Item 1'},
    {'id': 2, 'display': 'Item 2'},
    {'id': 3, 'display': 'Item 3'},
    {'id': 4, 'display': 'Item 4'},
  ];
  List<String> stringItems = ['Item 1', 'Item 2', 'Item 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MUIPrimaryDropDown(
              onItemSelected: (item) {
                setState(() {
                  selectedString = item;
                });
              },
              borderRadius: 5,
              hintIcon: const Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.white,
                size: 12,
              ),
              items: stringItems,
              hintText: 'Select String',
              hintStyle: TextStyle(color: Colors.grey.shade300),
            ),
             MUIMapDropDown(
              mapKey: 'display',
              onItemSelected: (item) {
                setState(() {
                  selectedMap = item;
                });
              },
              borderRadius: 5,
              hintIcon: const Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.white,
                size: 12,
              ),
              items: mapItems,
              hintText: 'Select Map',
              hintStyle: TextStyle(color: Colors.grey.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
