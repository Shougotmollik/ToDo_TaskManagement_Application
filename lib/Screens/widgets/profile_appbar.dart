import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/HomeScreen/update_profile_screen.dart';

AppBar profileAppBar(context, [bool fromUpdateProfile = false]) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(),
    ),
    title: GestureDetector(
      onTap: () {
        if (fromUpdateProfile) {
          return;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpdateProfileScreen(),
            ));
      },
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shougot Mollik",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            "email@gmail.com",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.logout_sharp,
            color: Colors.white,
          ))
    ],
  );
}
