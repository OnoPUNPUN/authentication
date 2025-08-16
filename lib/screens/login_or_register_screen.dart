import 'package:authentication/screens/log_in_screen.dart';
import 'package:authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  // initially show login screen
  bool showLoginScreen = true;

  // toggle between two page
  void toggelScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LogInScreen(onTap: toggelScreen);
    } else {
      return RegisterScreen(onTap: toggelScreen);
    }
  }
}
