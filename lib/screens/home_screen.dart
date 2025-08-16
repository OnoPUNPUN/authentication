import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sing user out
  void singUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: singUserOut, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Text(
          'LOGGED IN AS: ${user.email!}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
