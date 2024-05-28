import 'package:flutter/material.dart';

class ChatController {
  final TextEditingController messageController = TextEditingController();

  get message => messageController.text;
  // eu sei, esse get não faz o menor sentido rs

  void setMessage(String message) => messageController.text = message;

  void dispose() {
    messageController.clear();
  }
}
