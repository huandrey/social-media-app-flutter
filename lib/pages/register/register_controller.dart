import 'package:flutter/material.dart';

class RegisterController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();

  get email => emailController.text;
  get password => passwordController.text;
  get confirmPassword => confirmPasswordController.text;
  get username => usernameController.text;
  get userData => {'email': email, 'password': password, 'username': username};

  void setEmail(String value) => emailController.text = value;
  void setPassword(String value) => passwordController.text = value;
  void setConfirmPassword(String value) =>
      confirmPasswordController.text = value;
  void setUsername(String value) => usernameController.text = value;

  void clear() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    usernameController.clear();
  }

  bool validate() {
    print(usernameController.text);
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        passwordController.text.length >= 6 &&
        passwordController.text == confirmPasswordController.text;
  }
}
