import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
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
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_circle_right_outlined)),
                  const SizedBox(height: 24),
                  _buildBackToSignInSection(),
                ],
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

  void _onTapSignUpButton() {
    Navigator.pop(context);
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
