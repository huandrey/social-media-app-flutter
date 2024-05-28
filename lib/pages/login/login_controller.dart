import 'package:flutter/material.dart';

class LoginController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  get emailController => _emailController;
  get passwordController => _passwordController;
  get email => emailController.text;
  get password => passwordController.text;
  get userData =>
      {'email': email, 'password': password, 'username': email.split('@')[0]};

  void setEmail(String value) {
    emailController.text = value;
  }

  void setPassword(String value) => passwordController.text = value;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }
}
