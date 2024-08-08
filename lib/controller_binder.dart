import 'package:get/get.dart';
import 'package:todoapp/controller/new_task_controller.dart';
import 'package:todoapp/controller/sign_in_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => NewTaskController());
  }
}
