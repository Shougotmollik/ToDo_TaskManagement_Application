import 'package:flutter/material.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: const Text("Title Text should be here"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Description about about title are explain here!!"),
            const Text(
              "Date:14/06/24",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text("New"),
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
