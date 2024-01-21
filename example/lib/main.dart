import 'package:example/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFa2d2ff),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
