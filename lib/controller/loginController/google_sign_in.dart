import 'dart:developer';

import 'package:ecommerceapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUP {
  //Google Sign In
  static final googleSignIn = GoogleSignIn();

  static GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  static Future SignInWithGoogle(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
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
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => mainPage(),
        ),
        (route) => route.isFirst);
  }
}
