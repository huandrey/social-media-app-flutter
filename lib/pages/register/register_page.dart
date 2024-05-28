import 'package:flutter/material.dart';
import 'package:social_media_app/pages/register/components/register_content.dart';

class RegisterPage extends StatelessWidget {
  final Function() onLogin;
  const RegisterPage({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: RegisterContent(
        onLogin: onLogin,
      ),
    );
  }
}
