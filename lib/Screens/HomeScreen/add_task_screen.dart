import 'package:flutter/material.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';
import 'package:todoapp/Screens/widgets/centered_progress_indicator.dart';
import 'package:todoapp/Screens/widgets/profile_appbar.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackgroundWidgets(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text("Add New Task",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionTEController,
                  decoration: const InputDecoration(
                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.grey)),
                  maxLines: 8,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter your description";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: _addNewTaskInProgress == false,
                  replacement: const CenteredProgressIndicator(),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addNewTask();
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined)),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestData = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      AppUrls.createTaskUrl,
      body: requestData,
    );

    _addNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      _clearTextField();
      if (mounted) {
        showSnackBarMessage(context, "New Task Created");
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'Task creation failed ! Try Again', true);
      }
    }
  }

  void _clearTextField() {
    _titleTEController.clear();
    _descriptionTEController.clear();
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
