import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/AuthScreen/pin_verification_screen.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

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
                "Your Email Address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                "A 6 digit verification pin will send to your email address",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onTapGetPinButton,
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(height: 32),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Have Account?",
                    style: const TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: " Sign in",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignInButton,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _onTapGetPinButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PinVerificationScreen(),
        ));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
