import 'package:firebase_auth/firebase_auth.dart';

abstract class SecurityUtil {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// if the user signs in,
  ///
  /// Return True
  ///
  /// else False
  static bool get isSignin => _auth.currentUser != null;

  static User? get currentUser => _auth.currentUser;
}
