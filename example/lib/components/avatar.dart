import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget avatarComponent() {
  return const _Avatars();
}

class _Avatars extends StatefulWidget {
  const _Avatars({super.key});

  @override
  State<_Avatars> createState() => __AvatarsState();
}

class __AvatarsState extends State<_Avatars> {
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
            imageUrl:
                "https://resizing.flixster.com/53NK516H_a-Skf-avRo-jhIMSQo=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p10376284_b_v13_aa.jpg",
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
            imageUrl:
                "https://resizing.flixster.com/53NK516H_a-Skf-avRo-jhIMSQo=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p10376284_b_v13_aa.jpg",
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
