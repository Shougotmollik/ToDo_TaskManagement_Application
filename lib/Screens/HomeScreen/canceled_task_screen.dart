import 'package:flutter/material.dart';
import 'package:todoapp/Screens/widgets/centered_progress_indicator.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/Screens/widgets/task_item.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/model/task_list_wrapper_model.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class CanceledTaskScreen extends StatefulWidget {
  const CanceledTaskScreen({super.key});

  @override
  State<CanceledTaskScreen> createState() => _CanceledTaskScreenState();
}

class _CanceledTaskScreenState extends State<CanceledTaskScreen> {
  bool _canceledTaskIndicator = false;
  List<TaskModel> canceledTaskList = [];

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
              visible: _canceledTaskIndicator == false,
              replacement: const CenteredProgressIndicator(),
              child: ListView.builder(
                itemCount: canceledTaskList.length,
                itemBuilder: (context, index) {
                  return TaskItems(
                    taskModel: canceledTaskList[index],
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
    _canceledTaskIndicator = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
        await NetworkCaller.getRequest(AppUrls.canceledTaskUrl);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);

      canceledTaskList = taskListWrapperModel.list ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(context, "Get Completed task failed");
      }
    }
    _canceledTaskIndicator = false;
    if (mounted) {
      setState(() {});
    }
  }
}
