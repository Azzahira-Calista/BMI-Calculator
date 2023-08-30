import 'package:calculate_bmi/CalculateBMI.dart';
import 'package:flutter/material.dart';
import 'calculate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GetX State Management Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Calculate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
