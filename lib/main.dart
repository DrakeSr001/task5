import 'package:flutter/material.dart';
import 'package:task5/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 5',
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
