import 'package:flutter/material.dart';
import 'package:todoapp/Screens/widgets/centered_progress_indicator.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/Screens/widgets/task_item.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/model/task_list_wrapper_model.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool _completedTaskIndicator = false;
  List<TaskModel> completedTaskList = [];

  @override
  void initState() {
    _completedNewTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Expanded(
                child: Visibility(
              visible: _completedTaskIndicator == false,
              replacement: const CenteredProgressIndicator(),
              child: ListView.builder(
                itemCount: completedTaskList.length,
                itemBuilder: (context, index) {
                  return TaskItems(
                    taskModel: completedTaskList[index],
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> _completedNewTasks() async {
    _completedTaskIndicator = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
        await NetworkCaller.getRequest(AppUrls.completedTaskUrl);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);

      completedTaskList = taskListWrapperModel.list ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(context, "Get Completed task failed");
      }
    }
    _completedTaskIndicator = false;
    if (mounted) {
      setState(() {});
    }
  }
}
