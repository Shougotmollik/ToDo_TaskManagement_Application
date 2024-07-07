import 'package:flutter/material.dart';
import 'package:todoapp/data/model/task_model.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text(
              taskModel.createdDate ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(taskModel.status ?? 'New'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                ButtonBar(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit_note)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_forever_rounded))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
