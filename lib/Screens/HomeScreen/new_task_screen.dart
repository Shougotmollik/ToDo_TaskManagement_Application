import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/HomeScreen/add_task_screen.dart';
import 'package:todoapp/Screens/widgets/centered_progress_indicator.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/Screens/widgets/task_item.dart';
import 'package:todoapp/Screens/widgets/task_summery_card.dart';
import 'package:todoapp/controller/new_task_controller.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/model/task_count_by_status_wrapper_model.dart';
import 'package:todoapp/data/model/task_count_by_staus_model.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getTaskCountByStatusInProgress = false;
  List<TaskCountByStatusModel> taskCountByStatusList = [];

  @override
  void initState() {
    super.initState();
    _initialCall();
  }

  void _initialCall() {
    _getTaskCountByStatus();
    Get.find<NewTaskController>().getNewTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummarySection(),
            const SizedBox(height: 8),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _initialCall();
                },
                child:
                    GetBuilder<NewTaskController>(builder: (newTaskController) {
                  return Visibility(
                    visible: newTaskController.getNewTasksInProgress == false,
                    replacement: const CenteredProgressIndicator(),
                    child: ListView.builder(
                      itemCount: newTaskController.newTaskList.length,
                      itemBuilder: (context, index) {
                        return TaskItem(
                          taskModel: newTaskController.newTaskList[index],
                          onUpdateTask: _initialCall,
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Visibility(
      visible: _getTaskCountByStatusInProgress == false,
      replacement: const SizedBox(
        height: 100,
        child: CenteredProgressIndicator(),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: taskCountByStatusList.map((e) {
            return TaskSummaryCard(
              title: (e.sId ?? 'Unknown').toUpperCase(),
              count: e.sum.toString(),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountByStatusInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(AppUrls.taskStatusCount);
    if (response.isSuccess) {
      TaskCountByStatusWrapperModel taskCountByStatusWrapperModel =
          TaskCountByStatusWrapperModel.fromJson(response.responseData);
      taskCountByStatusList =
          taskCountByStatusWrapperModel.taskCountByStatusList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Get task count by status failed! Try again',
        );
      }
    }
    _getTaskCountByStatusInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
