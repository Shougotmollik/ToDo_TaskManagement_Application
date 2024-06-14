import 'package:flutter/material.dart';
import 'package:todoapp/Screens/widgets/profile_appbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: const Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TaskSummeryCard(taskCount: "09", taskTitle: "Canceled"),
                TaskSummeryCard(taskCount: "09", taskTitle: "Completed"),
                TaskSummeryCard(taskCount: "09", taskTitle: "Progress"),
                TaskSummeryCard(taskCount: "09", taskTitle: "New Task"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TaskSummeryCard extends StatelessWidget {
  const TaskSummeryCard({
    super.key,
    required this.taskCount,
    required this.taskTitle,
  });

  final String taskCount;
  final String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(taskCount, style: Theme.of(context).textTheme.titleLarge),
            Text(taskTitle, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
