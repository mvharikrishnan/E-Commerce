import 'package:ecommerceapp/controller/loginController/authentication.dart';

import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

appBarCreator(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser!;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(CreatrDummyImage),
          ),
          sizedBox10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'Art and Craft',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.email!,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )
            ],
          ),
        ],
      ),
      IconButton(
          onPressed: () {
            signOut();
          },
          icon: const Icon(
            Icons.logout,
            size: 30,
          ))
    ],
  );
}
