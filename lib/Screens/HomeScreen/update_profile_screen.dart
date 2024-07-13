import 'package:flutter/material.dart';
import 'package:todoapp/Config/colors.dart';
import 'package:todoapp/Screens/widgets/background_widgets.dart';
import 'package:todoapp/Screens/widgets/profile_appbar.dart';
import 'package:todoapp/controller/auth_controller.dart';

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

  @override
  void initState() {
    final userData = AuthController.userData!;
    _emailTEController.text = userData.email ?? '';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // Text("Update Profile",
              //     style: Theme.of(context).textTheme.titleLarge),
              // const SizedBox(height: 16),
              _buildImagePicker(),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _firstNameTEController,
                decoration: const InputDecoration(
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _mobileTEController,
                decoration: const InputDecoration(
                    hintText: "Mobile",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordTEController,
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
