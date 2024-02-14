import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

class CollapsibleUnit extends StatelessWidget {
  const CollapsibleUnit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MUIPrimaryCard(
      title: 'UI/UX Review Check',
      description:
          'The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Barcelona',
      image: Image.network(
        'https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80',
        fit: BoxFit.cover,
      ),
      buttons: [
        MUIPrimaryButton(
          text: 'Read More',
          onPressed: () {},
        ),
      ],
    );
  }
}
