import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/AuthScreen/signin_screen.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120),
                Text(
                  "Set Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  "Minimum length password 8 character with Letter and number combination",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirmPasswordTEController,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Confirm"),
                ),
                const SizedBox(height: 36),
                _buildBackToSignInSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackToSignInSection() {
    return Center(
      child: RichText(
        text: TextSpan(
            text: "Have Account? ",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
            children: [
              TextSpan(
                  text: "Sign in",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = _onTapSignInButton),
            ]),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
