import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login/components/login_content.dart';
import 'package:social_media_app/shared/components/my_scaffold.dart';

class LoginPage extends StatelessWidget {
  final Function() onRegister;

  const LoginPage({
    super.key,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: LoginContent(
        onRegister: onRegister,
      ),
    );
  }
}
