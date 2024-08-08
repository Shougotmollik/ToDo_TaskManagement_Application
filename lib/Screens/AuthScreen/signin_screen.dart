import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/AuthScreen/email_verification_screen.dart';
import 'package:todoapp/Screens/AuthScreen/signup_screen.dart';
import 'package:todoapp/Screens/HomeScreen/main_bottom_nav_screen.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/data/model/login_model.dart';
import 'package:todoapp/data/model/network_response.dart';

import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';
import 'package:todoapp/utility/app_constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // All controller here
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _signInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      "Get Started With",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailTEController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Something went wrong";
                        }
                        if (AppConstants.emailRegExp.hasMatch(value!) ==
                            false) {
                          return "Invalid Email Address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: _showPassword == false,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _showPassword = !_showPassword;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          icon: Icon(_showPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter Your Password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: _signInProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: _onTapHomeScreenButton,
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: _onTapForgotPasswordButton,
                            child: const Text("Forgot Password?"),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4),
                              text: "Don't have and account?",
                              children: [
                                TextSpan(
                                  text: " Sign Up",
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapSignInButton,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    _signInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestData = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(AppUrls.login, body: requestData);

    _signInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);

      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainBottomNavScreen(),
            ));
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? "Invalid Username/password",
        );
      }
    }
  }

  void _onTapHomeScreenButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
