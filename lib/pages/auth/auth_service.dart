import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() => _auth.currentUser;

  Future<UserCredential> signIn(Map<String, dynamic> userData) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userData['email']!,
        password: userData['password']!,
      );

      _saveUserOnFirestore(userCredential, userData);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      Map<String, dynamic> userData) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userData['email']!, password: userData['password']!);

      _saveUserOnFirestore(userCredential, userData);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  void _saveUserOnFirestore(
      UserCredential userCredential, Map<String, dynamic> userData) {
    _firestore.collection('Users').doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'email': userCredential.user!.email,
      'username': userData['username']
    });
  }

  void logout() async {
    await _auth.signOut();
  }
}
