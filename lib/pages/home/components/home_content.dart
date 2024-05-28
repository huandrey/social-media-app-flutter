import 'package:flutter/material.dart';
import 'package:social_media_app/pages/auth/auth_service.dart';
import 'package:social_media_app/pages/chat/chat_page.dart';
import 'package:social_media_app/pages/chat/chat_service.dart';
import 'package:social_media_app/pages/home/components/user_tile.dart';

class HomeContent extends StatelessWidget {
  HomeContent({
    super.key,
  });

  final AuthService authService = AuthService();
  final ChatService chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return _buildUserList();
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: chatService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print(snapshot);
            return const Center(child: Text('Loading...'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: snapshot.data!
                    .map<Widget>(
                        (userData) => _buildUserListItem(context, userData))
                    .toList(),
              ),
            );
          }
        });
  }

  Widget _buildUserListItem(
      BuildContext context, Map<String, dynamic> userData) {
    if (userData['email'] != authService.getCurrentUser()!.email) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: UserTile(
            name: userData['username'] ?? '-',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: userData['email'],
                    receiverUsername: userData['username'] ?? '',
                    receiverId: userData['uid'],
                  ),
                ),
              );
            }),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
