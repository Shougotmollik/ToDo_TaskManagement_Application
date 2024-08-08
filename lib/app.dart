import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Config/theme.dart';
import 'package:todoapp/Screens/SplashScreen/splash_screen.dart';
import 'package:todoapp/controller_binder.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: MyApp.navigatorKey,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
