import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/HomeScreen/canceled_task_screen.dart';
import 'package:todoapp/Screens/HomeScreen/completed_task_screen.dart';
import 'package:todoapp/Screens/HomeScreen/new_task_screen.dart';
import 'package:todoapp/Screens/HomeScreen/progress_task_screen.dart';
import 'package:todoapp/Screens/widgets/profile_appbar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CanceledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_calendar_rounded), label: "New Task"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_done_outlined), label: "Completed"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_presentation), label: "Canceled"),
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: "Progress"),
        ],
      ),
    );
  }
}
