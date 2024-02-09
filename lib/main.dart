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
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.phone))
          ],
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
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepOrange[400],
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                accountName: Text("Shougot Mollik"),
                accountEmail: Text("Shougot@info.abc"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.deepOrangeAccent[100],
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("First Name"),
                    suffixIcon: Icon(Icons.person_off),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
