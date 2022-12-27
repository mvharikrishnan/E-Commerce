import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class account_profile extends StatelessWidget {
  const account_profile({
    required this.user,
    Key? key,
  }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(user.photoURL ?? userDummyImage),
        )
      ],
    );
  }
}
