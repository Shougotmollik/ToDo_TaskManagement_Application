// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_appliaction/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
