import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TempLoginBtn extends StatelessWidget {
  const TempLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        DevOnLog.i('googleUser: $googleUser');

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        DevOnLog.i('googleAuth: $googleAuth');

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        DevOnLog.i('credential: $credential');

        // Once signed in, return the UserCredential
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        DevOnLog.i('userCredential: $userCredential');

        // 현재 유저 정보 가져오기
        User? user = FirebaseAuth.instance.currentUser;
        DevOnLog.i('user: $user');

        // Realtime Database
        DatabaseReference ref = FirebaseDatabase.instance.ref();

        // username만 바꾸기
        await ref.child('users/${user?.uid}').update({
          'nickname': "손형준",
        });

        dynamic snapshot = await ref.child('users/${user?.uid}').get();

        if (snapshot.exists) {
          DevOnLog.i('Data : ${snapshot.value}');
        } else {
          DevOnLog.i('No Data');
        }

        // Sign out
        await FirebaseAuth.instance.signOut();
        DevOnLog.i('signOut');

        // 현재 유저 정보 가져오기
        User? temp = FirebaseAuth.instance.currentUser;
        DevOnLog.i('temp: $temp');
      },
      color: Colors.blue,
      child: const Text('Home Screen', style: FontSystem.KR18M),
    );
  }
}
