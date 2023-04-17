import 'package:coinomy/login.dart';
import 'package:coinomy/register.dart';
import 'package:flutter/material.dart';

const double FONT_TITLE_SIZE = 20;
const Color LIGHT_COLOR = Color.fromARGB(255, 41, 160, 182);
const Color DARK_COLOR = Color.fromARGB(255, 35, 3, 80);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
