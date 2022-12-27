import 'package:ecommerceapp/controller/loginController/authentication.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        backgroundColor: kTransparent,
        appBar: appBarUser(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await signOut();
                  Navigator.pop(context);
                },
                child: const Center(child: Text('LOGOUT')),
              ),
              sizedBoxHeight10,
              Text(user.email!)
            ],
          ),
        ),
      ),
    );
  }
}
