import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';
import 'package:todoapp/Screens/widgets/profile_appbar.dart';
import 'package:todoapp/controller/auth_controller.dart';
import 'package:todoapp/utility/app_constants.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    final userData = AuthController.userData!;
    _emailTEController.text = userData.email ?? '';
    _firstNameTEController.text = userData.firstName ?? '';
    _lastNameTEController.text = userData.lastName ?? '';
    _mobileTEController.text = userData.mobile ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context, true),
      body: BackgroundWidgets(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _globalKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                // Text("Update Profile",
                //     style: Theme.of(context).textTheme.titleLarge),
                // const SizedBox(height: 16),
                GestureDetector(
                  onTap: _profileImagePick,
                  child: _buildImagePicker(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  enabled: false,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "First Name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Last Name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _mobileTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your mobile number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Mobile",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your password';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_circle_right_outlined)),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildImagePicker() {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
            ),
            backgroundColor: Colors.grey,
          ),
          Positioned(
            bottom: -10,
            left: 48,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_a_photo_outlined,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _profileImagePick() async {}

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
