import 'package:final_project/Screens/countries_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(final_project());
}

class final_project extends StatelessWidget {
  const final_project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Countries(),
    );
  }
}
