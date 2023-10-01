// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_appliaction/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key, this.controller});
  final controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // create user input text filed

            TextField(
              controller:controller ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task..."),
            ),

            // Create two button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                  text: "Save",
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                // cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
