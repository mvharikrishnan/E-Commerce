import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/roleModels/roleModels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future editUserName(
    {required userModel User,
    required String currentUser,
    required context}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

  //reference to the userDoc
  final docUser =
      FirebaseFirestore.instance.collection(currentUser).doc(User.userEmail);

  //instance to the edited userRole
  final EditedUser =
      userModel(userEmail: User.userEmail, userName: User.userName);

  //converting to json
  final userEditedJson = EditedUser.toJson();
  CircularProgressIndicator();
  await docUser.update(userEditedJson);
  Navigator.pop(context);
}
