import 'package:todoapp/data/model/task_model.dart';

class TaskListWrapperModel {
  String? status;
  List<TaskModel>? list;

  TaskListWrapperModel({this.status, this.list});

  TaskListWrapperModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      list = <TaskModel>[];
      json['data'].forEach((v) {
        // data!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (list != null) {
      data['data'] = list!.map((v) => v.toJson()).toString();
    }
    return data;
  }
}
