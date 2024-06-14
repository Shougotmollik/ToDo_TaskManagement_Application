import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/HomeScreen/add_task_screen.dart';
import 'package:todoapp/Screens/widgets/task_item.dart';
import 'package:todoapp/Screens/widgets/task_summery_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummerySection(),
            const SizedBox(height: 8),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const TaskItems();
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        onPressed: _onTapAddTaskButton,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummerySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummeryCard(taskCount: "09", taskTitle: "Canceled"),
          TaskSummeryCard(taskCount: "09", taskTitle: "Completed"),
          TaskSummeryCard(taskCount: "09", taskTitle: "Progress"),
          TaskSummeryCard(taskCount: "09", taskTitle: "New Task"),
        ],
      ),
    );
  }

  void _onTapAddTaskButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddTaskScreen(),
        ));
  }
}
