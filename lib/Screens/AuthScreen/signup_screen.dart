import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';
import 'package:todoapp/Screens/widgets/snack_bar_message.dart';
import 'package:todoapp/data/model/network_response.dart';
import 'package:todoapp/data/network_caller/network_caller.dart';
import 'package:todoapp/data/utilities/url.dart';
import 'package:todoapp/utility/app_constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _registrationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      "Join With Us",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter Email Address";
                        }
                        if (AppConstants.emailRegExp.hasMatch(value!) ==
                            false) {
                          return "Enter valid Email Address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNameTEController,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your first name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameTEController,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your last name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Mobile",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your mobile number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: _showPassword == false,
                      controller: _passwordTEController,
                      decoration: InputDecoration(
                        hintText: "Password",
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
                          return "Enter your password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: _registrationInProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                          onPressed: _onTapRegistration,
                          child: const Icon(Icons.arrow_circle_right_outlined)),
                    ),
                    const SizedBox(height: 24),
                    _buildBackToSignInSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _buildBackToSignInSection() {
    return Center(
      child: RichText(
        text: TextSpan(
            text: "Have account?",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
            children: [
              TextSpan(
                text: " Sign in",
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
                recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
              )
            ]),
      ),
    );
  }

  Future<void> _registerUser() async {
    _registrationInProgress = true;

    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> registerInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": ""
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      AppUrls.registrationUrl,
      body: registerInput,
    );
    _registrationInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _clearTextFieldController();
      if (mounted) {
        showSnackBarMessage(context, "Registration Success");
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Registration failed! try again.',
        );
      }
    }
  }

  void _clearTextFieldController() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  void _onTapSignUpButton() {
    Navigator.pop(context);
  }

  void _onTapRegistration() {
    if (_formKey.currentState!.validate()) {
      _registerUser();
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
