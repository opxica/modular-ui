import 'package:example/enums/card_variant.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';
class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.title,
    required this.description,
    required this.imgURL,
    required this.buttonText,
    required this.cardVariant,
  });
  final String title;
  final String description;
  final String imgURL;
  final String buttonText;
  final CardVariant cardVariant;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: cardVariant == CardVariant.primaryCard
            ? MUIPrimaryCard(
                title: title,
                onButtonTap: () {},
                description: description,
                image: Image.network(imgURL),
                buttonText: buttonText,
              )
            : cardVariant == CardVariant.signInCard
                ? const Text("Under Development...")
                : cardVariant == CardVariant.simpleCard
                    ? MUISimpleCard(
                        title: title,
                        onButtonTap: () {},
                        description: description,
                        buttonText: buttonText,
                      )
                    : const SizedBox.shrink(),
      ),
    );
  }
}



// TODO: Not Removed due to dependecy of home.dart
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
