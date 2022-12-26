import 'dart:developer';

import 'package:ecommerceapp/core/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future signIn(String Email, String Password) async {
  try {
    log('Login Succesfull');
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email,
      password: Password,
      // email: 'test@gmail.com',
      // password: 'password'
    );
  } on FirebaseAuthException catch (e) {
    log('Log in Error ${e.toString()}');

    Utils.ShowSnackBar(e.message);
  }
}

Future signUP(String Email, String Password, String UserName,
    BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: CircularProgressIndicator(),
          ));
  log('Sign Up called');
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: Password);
    log('User Signed In');
  } on FirebaseAuthException catch (e) {
    log(e.toString());
  }
}

Future signOut() async {
  await FirebaseAuth.instance.signOut();
}
