import 'package:firebase_auth/firebase_auth.dart';

class HomeController {
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
