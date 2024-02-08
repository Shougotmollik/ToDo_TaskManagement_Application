import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Bar"),
          backgroundColor: Colors.deepOrange,
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.deepOrangeAccent,
          height: 70,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.comment_bank), label: "Comment"),
            NavigationDestination(
                icon: Icon(Icons.portable_wifi_off), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Home"),
          ],
        ),
      ),
    );
  }
}
