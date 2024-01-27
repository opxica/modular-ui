import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget avatar() {
  return const Avatars();
}

class Avatars extends StatefulWidget {
  const Avatars({super.key});

  @override
  State<Avatars> createState() => _AvatarsState();
}

class _AvatarsState extends State<Avatars> {
  @override
  Widget build(BuildContext context) {
    Widget text(String text) {
      return Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text("Avatar with url and default size"),
          const SizedBox(height: 5),
          MUIAvatar(
            imageUrl: "https://github.com/shadcn.png",
            fallbackText: "ABCD",
            onTap: () {},
            textColor: Colors.blue,
          ),
          const SizedBox(height: 15),
          text("Avatar without url with fallback text and default size"),
          const SizedBox(height: 5),
          MUIAvatar(
            imageUrl: "",
            fallbackText: "AC",
            onTap: () {},
            textColor: Colors.green,
          ),
          const SizedBox(height: 15),
          text("Avatar with user defined size"),
          const SizedBox(height: 5),
          MUIAvatar(
            imageUrl: "",
            fallbackText: "AB",
            size: 50,
            onTap: () {},
            textColor: Colors.red,
          ),
          const SizedBox(height: 15),
          text("Avatar with user defined size and url"),
          const SizedBox(height: 5),
          MUIAvatar(
            imageUrl: "https://github.com/shadcn.png",
            fallbackText: "AB",
            size: 50,
            onTap: () {},
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
