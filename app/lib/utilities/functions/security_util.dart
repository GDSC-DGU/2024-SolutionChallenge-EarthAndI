import 'package:firebase_auth/firebase_auth.dart';

abstract class SecurityUtil {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static bool isPreviousSignInUser() {
    return _auth.currentUser != null;
  }

  static User? get currentUser {
    return _auth.currentUser;
  }
}
