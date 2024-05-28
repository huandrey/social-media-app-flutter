import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';
import 'package:social_media_app/pages/chat/chat_service.dart';
import 'package:social_media_app/pages/chat/components/chat_bubble.dart';
import 'package:social_media_app/shared/components/my_text_field.dart';

class ChatContent extends StatefulWidget {
  final String receiverId;
  final String receiverEmail;

  const ChatContent({
    super.key,
    required this.receiverId,
    required this.receiverEmail,
  });

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  final AuthService authService = AuthService();
  final ChatService chatService = ChatService();
  final TextEditingController chatController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => scrollDown(),
      );
    });

    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: _buildMessageList()),
      _buildInputMessage(),
    ]);
  }

  _sendMessage() async {
    if (chatController.text.trim().isNotEmpty) {
      chatService.sendMessage(widget.receiverId, chatController.text);
      chatController.clear();
    }

    scrollDown();
  }

  Widget _buildMessageList() {
    String senderId = authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatService.getMessages(widget.receiverId, senderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading..');
          } else {
            return ListView(
              controller: _scrollController,
              children: snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc))
                  .toList(),
            );
          }
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == authService.getCurrentUser()!.uid;
    var alignmentMessage =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignmentMessage,
      child: ChatBubble(
        message: data['message'],
        timestamp: data['timestamp'],
        isCurrentUser: isCurrentUser,
      ),
    );
  }

  Widget _buildInputMessage() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              focusNode: focusNode,
              hintText: 'Digite algo',
              controller: chatController,
              onChanged: (value) => chatController.text = value,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    chatController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
