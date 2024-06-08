import 'package:flutter/material.dart';
import 'package:todoapp/Screens/AuthScreen/signup_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      home: const SignUpScreen(),
    );
  }
}
