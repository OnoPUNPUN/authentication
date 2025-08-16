import 'package:authentication/widgets/my_button.dart';
import 'package:authentication/widgets/my_textfield.dart';
import 'package:authentication/widgets/squre_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;

  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();

  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _confirmPasswordTEcontroller =
      TextEditingController();

  // sing user in method
  void singUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      if (_passwordTEcontroller.text != _confirmPasswordTEcontroller.text) {
        if (mounted) Navigator.of(context).pop(); // close loader
        if (mounted) showErroMessage("Passwords don't match!");
        return;
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTEcontroller.text.trim(),
        password: _passwordTEcontroller.text,
      );

      if (!mounted) return; // check again after async work
      Navigator.of(context).pop(); // close loader on success
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop(); // close loader on error

      if (e.code == 'invalid-credential') {
        if (mounted) showErroMessage('Incorrect Email or Password');
      } else {
        if (mounted) showErroMessage(e.message ?? 'Something went wrong');
      }
    }
  }

  // wrong email message popup
  void showErroMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text(message));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // logo
                Icon(Icons.lock, size: 100),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  "Let's create an account!!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(height: 25),

                //username textfield
                MyTextfield(
                  controller: _emailTEcontroller,
                  hintText: 'Email',
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

                // confirm password textfield
                MyTextfield(
                  controller: _confirmPasswordTEcontroller,
                  hintText: 'Confirm Passowrd',
                  obscureText: true,
                ),

                // forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.grey[600]),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 25),

                // sing in button
                MyButton(onTap: singUserUp, buttonName: "Sign Up"),

                const SizedBox(height: 25),

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

                const SizedBox(height: 25),

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

                const SizedBox(height: 25),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alread Have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
