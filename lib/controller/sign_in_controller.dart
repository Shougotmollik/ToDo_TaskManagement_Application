import 'package:get/get.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/data/model/login_model.dart';
import 'package:todoapp/data/model/network_response.dart';

import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';

class SignInController extends GetxController {
  bool _signInApiInProgress = false;
  String _errorMessage = '';

  bool get signInApiInProgress => _signInApiInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _signInApiInProgress = true;
    update();

    Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(AppUrls.login, body: requestData);
    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Login failed! Try again';
    }

    _signInApiInProgress = false;
    update();

    return isSuccess;
  }
}
