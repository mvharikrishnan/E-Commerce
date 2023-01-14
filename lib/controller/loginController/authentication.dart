import 'dart:developer';

import 'package:ecommerceapp/controller/roles.dart';
import 'package:ecommerceapp/core/utils/utils.dart';
import 'package:ecommerceapp/model/roleModels/roleModels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future signIn(String Email, String Password, BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
  try {
    log('Login Succesfull');
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email,
      password: Password,
    );
  } on FirebaseAuthException catch (e) {
    log('Log in Error ${e.toString()}');

    Utils.ShowSnackBar(e.message);
  }
}

Future signUP(
    String Email, String Password, BuildContext context, String role) async {
  showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
  log('Sign Up called');
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: Password);

    log('$role Signed In');
  } on FirebaseAuthException catch (e) {
    log(e.toString());
  }

  if (role == "creator") {
    final creatorModel creator = creatorModel(creatorEmail: Email);
    customRoles.AddCreatorEmail(CreatorModel: creator);
  } else if (role == "user") {
    final userModel user = userModel(userEmail: Email);
    customRoles.AddUserEmail(UserModel: user);
  }
}

Future signOut() async {
  final googleSignIn = GoogleSignIn();

  //authentication for signout in firebase
  FirebaseAuth _auth = FirebaseAuth.instance;

  //check if the user is signed in?
  if (_auth.currentUser != null) {
    //the signed in user account
    User user = _auth.currentUser!;

    //check the providerID to determine how the user signed in
    if (user.providerData[0].providerId == 'google.com') {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
    } else {
      await FirebaseAuth.instance.signOut();
    }
  }
}
