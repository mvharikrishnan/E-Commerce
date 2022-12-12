import 'dart:developer';

import 'package:ecommerceapp/core/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future signIn(TextEditingController emailController,
    TextEditingController passwordController) async {
  // showDialog(
  //   context: context,
  //   builder: builder,
  // );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  } on FirebaseAuthException catch (e) {
    log(e.toString());

    Utils.ShowSnackBar(e.message);
  }
}
