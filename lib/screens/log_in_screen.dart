import 'package:authentication/widgets/my_button.dart';
import 'package:authentication/widgets/my_textfield.dart';
import 'package:authentication/widgets/squre_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController _usernameTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();

  // sing user in method
  void singUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // logo
              Icon(Icons.lock, size: 100),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                "Welcome back your've been missed",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(height: 25),

              //username textfield
              MyTextfield(
                controller: _usernameTEcontroller,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextfield(
                controller: _passwordTEcontroller,
                hintText: 'Passowrd',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sing in button
              MyButton(onTap: singUserIn),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sing in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SqureTile(imagePath: 'images/logo/google-logo.svg'),

                  const SizedBox(width: 10),

                  //apple button
                  SqureTile(imagePath: 'images/logo/apple-logo.svg'),
                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
