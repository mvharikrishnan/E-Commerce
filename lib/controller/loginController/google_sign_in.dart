
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUP {
  //Google Sign In
  static final googleSignIn = GoogleSignIn();

  static GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  static Future SignInWithGoogle() async {
    log('Google Sign In called');
    final googleUser = await googleSignIn.signIn();

    //exception
    if (googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    log('Google Sign in finished');
  }
}
