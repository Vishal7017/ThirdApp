import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int? operand1;
  int? operand2;
  int? result;
  int totalAttempts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz with Random Numbers'),
        backgroundColor: Colors.lightBlue[600],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.lightBlue[100]!, Colors.lightBlue[600]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Expression: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    operand1 == null ? '____' : '$operand1',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '+',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    operand2 == null ? '____' : '$operand2',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Solution: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    result == null ? '?' : '$result',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Rounds: $totalAttempts',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onPressed: () {
                      setState(() {
                        operand1 = Random().nextInt(100);
                        operand2 = Random().nextInt(100);
                        result = null;
                        totalAttempts++;
                      });
                    },
                    child: Text(
                      totalAttempts == 0 ? 'Play' : 'Play Again',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: Colors.green[600],
                  ),
                  SizedBox(width: 10),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onPressed: operand1 == null || operand2 == null
                        ? null
                        : () {
                            setState(() {
                              result = operand1! + operand2!;
                            });
                          },
                    child: const Text(
                      'Solve',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: Colors.green[600],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
