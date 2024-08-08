import 'package:flutter/material.dart';
import 'package:todoapp/Screens/widgets/centered_progress_indicator.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/Screens/widgets/task_item.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/model/task_list_wrapper_model.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  bool _progressTaskIndicator = false;
  List<TaskModel> progressTaskList = [];

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
              visible: _progressTaskIndicator == false,
              replacement: const CenteredProgressIndicator(),
              child: ListView.builder(
                itemCount: progressTaskList.length,
                itemBuilder: (context, index) {
                  return TaskItems(
                    taskModel: progressTaskList[index],
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
    _progressTaskIndicator = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
        await NetworkCaller.getRequest(AppUrls.progressTaskUrl);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);

      progressTaskList = taskListWrapperModel.list ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(context, "Get Progress task failed");
      }
    }
    _progressTaskIndicator = false;
    if (mounted) {
      setState(() {});
    }
  }
}
