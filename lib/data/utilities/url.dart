class AppUrls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String registrationUrl = '$_baseUrl/registration';
  static const String loginUrl = '$_baseUrl/login';
  static const String createTaskUrl = '$_baseUrl/createTask';
  static const String newTaskUrl = '$_baseUrl/listTaskByStatus/New';
  static const String completedTaskUrl = '$_baseUrl/listTaskByStatus/Completed';
  static const String canceledTaskUrl = '$_baseUrl/listTaskByStatus/Canceled';
  static const String progressTaskUrl = '$_baseUrl/listTaskByStatus/Progress';
}
