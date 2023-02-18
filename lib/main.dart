import 'package:flutter/material.dart';
import 'package:madhack_trivia/screens/home.dart';

void main() => runApp(MadHack());

class MadHack extends StatelessWidget {
  const MadHack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MadHack Trivia',
      home: HomeScreen(),
    );
  }
}
