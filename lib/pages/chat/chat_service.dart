import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map(
        (doc) {
          final user = doc.data();
          return user;
        },
      ).toList();
    });
  }

  Future<void> sendMessage(String receiverId, String message) async {
    // get the current user
    final currentUserId = _auth.currentUser!.uid;
    final currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message to be sent to the receiver
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // create a id room between the current user and other
    String chatRoomId = _generateChatRoomId(currentUserId, receiverId);

    // add the new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    String chatRoomId = _generateChatRoomId(userId, otherUserId);

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  String _generateChatRoomId(String userId, String otherUserId) {
    List<String> mergeBetweenIds = [userId, otherUserId];
    mergeBetweenIds.sort();
    String chatRoomId = mergeBetweenIds.join('_');

    return chatRoomId;
  }
}
