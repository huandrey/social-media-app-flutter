import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String)? validator;
  final String? initialValue;
  final int? maxLength;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.obscureText = false,
    this.initialValue = '',
    this.keyboardType = TextInputType.text,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.errorBorderColor = Colors.red,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.maxLength = 100,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      obscureText: obscureText!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
      ),
    );
  }
}
