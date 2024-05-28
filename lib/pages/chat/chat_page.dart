import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';
import 'package:social_media_app/pages/chat/chat_controller.dart';
import 'package:social_media_app/pages/chat/chat_service.dart';
import 'package:social_media_app/pages/chat/components/chat_bubble.dart';
import 'package:social_media_app/pages/chat/components/chat_content.dart';
import 'package:social_media_app/shared/components/my_scaffold.dart';
import 'package:social_media_app/shared/components/my_text_field.dart';

class ChatPage extends StatelessWidget {
  final String receiverId;
  final String receiverEmail;
  final String receiverUsername;

  ChatPage({
    super.key,
    required this.receiverId,
    required this.receiverEmail,
    required this.receiverUsername,
  });

  final ChatController chatController = ChatController();
  final AuthService authService = AuthService();
  final ChatService chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: receiverUsername,
      body: ChatContent(receiverId: receiverId, receiverEmail: receiverEmail),
    );
  }
}
