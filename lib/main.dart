import 'package:flutter/material.dart';
import 'package:mark_calculator/Calculator.dart';

//Mark Rywell G. Gaje
// IT - 3R1

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Calculator(title: 'Flutter Basic Calculator'),
    );
  }
}


