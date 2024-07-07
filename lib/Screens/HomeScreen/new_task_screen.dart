import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/HomeScreen/add_task_screen.dart';
import 'package:todoapp/Screens/widgets/centered_progress_indicator.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/Screens/widgets/task_item.dart';
import 'package:todoapp/Screens/widgets/task_summery_card.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/model/task_list_wrapper_model.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskIndicator = false;
  List<TaskModel> newTaskList = [];

  @override
  void initState() {
    super.initState();
    _getNewTasks();
  }

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
                child: Visibility(
              visible: _getNewTaskIndicator == false,
              replacement: const CenteredProgressIndicator(),
              child: ListView.builder(
                itemCount: newTaskList.length,
                itemBuilder: (context, index) {
                  return TaskItems(
                    taskModel: newTaskList[index],
                  );
                },
              ),
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

  Future<void> _getNewTasks() async {
    _getNewTaskIndicator = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response =
        await NetworkCaller.getRequest(AppUrls.newTaskUrl);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);

      newTaskList = taskListWrapperModel.list ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(context, "Get new task failed");
      }
    }
    _getNewTaskIndicator = false;
    if (mounted) {
      setState(() {});
    }
  }
}
