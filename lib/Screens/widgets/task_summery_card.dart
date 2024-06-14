import 'package:flutter/material.dart';

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
