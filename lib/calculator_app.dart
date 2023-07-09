import 'package:flutter/material.dart';
import 'calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'CACULATOR', home: CalculatorScreen());
  }
}
