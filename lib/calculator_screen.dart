import 'dart:core';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  String _currentNumber = '';
  int _firstOperand = 0;
  String _operator = '';
  void _onNumberPressed(String value) {
    setState(() {
      _currentNumber += value;
    });
  }

  void _onOperatorPressed(String value) {
    setState(() {
      _firstOperand = int.parse(_currentNumber);
      _currentNumber = '';
      _operator = value;
    });
  }

  void _onEqualPressed() {
    setState(() {
      int _secondOperand = int.parse(_currentNumber);
      switch (_operator) {
        case '+':
          _output = (_firstOperand + _secondOperand).toString();
          break;
        case '-':
          _output = (_firstOperand - _secondOperand).toString();
          break;
        case '*':
          _output = (_firstOperand * _secondOperand).toString();
          break;
        case '/':
          _output = (_firstOperand / _secondOperand).toString();
          break;
      }
      _currentNumber = _output;
      _operator = '';
    });
  }

  void _onClearPressed() {
    setState(() {
      _output = '';
      _firstOperand = 0;
      _currentNumber = '';
      _operator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNumberButton('7'),
            _buildNumberButton('8'),
            _buildNumberButton('9'),
            _buildOperatorButton('/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNumberButton('4'),
            _buildNumberButton('5'),
            _buildNumberButton('6'),
            _buildOperatorButton('*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNumberButton('1'),
            _buildNumberButton('2'),
            _buildNumberButton('3'),
            _buildOperatorButton('-'),
          ],
        ),
        Row(
          children: <Widget>[
            _buildNumberButton('0'),
            _buildClearButton(),
            _buildEqualButton(),
            _buildOperatorButton('+'),
          ],
        ),
      ]),
    );
  }

  Widget _buildNumberButton(String num) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onNumberPressed(num),
        child: Text(num),
      ),
    );
  }

  Widget _buildOperatorButton(String op) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onOperatorPressed(op),
        child: Text(op),
      ),
    );
  }

  Widget _buildClearButton() {
    return Expanded(
      child: ElevatedButton(
          onPressed: () => _onClearPressed(), child: const Text('CLEAR')),
    );
  }

  Widget _buildEqualButton() {
    return Expanded(
      child: ElevatedButton(
          onPressed: () => _onEqualPressed(), child: const Text('=')),
    );
  }
}
