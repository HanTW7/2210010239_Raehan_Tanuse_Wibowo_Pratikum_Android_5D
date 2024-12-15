import 'package:flutter/material.dart';
import 'studikasus03.dart'; // Ensure the path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'pratikum03',
      home: StudiKasus03(),
    );
  }
}