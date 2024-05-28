import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/pages/auth/register_or_login_page.dart';
import 'package:social_media_app/pages/home/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const RegisterOrLoginPage();
            }
          }),
    );
  }
}
