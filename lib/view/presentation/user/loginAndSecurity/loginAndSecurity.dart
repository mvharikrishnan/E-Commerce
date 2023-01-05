import 'package:ecommerceapp/controller/loginController/authentication.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:ecommerceapp/view/presentation/user/account/widget/settingTile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        backgroundColor: kTransparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset('assets/drawingImage/logout.json'),
              //recent logout and email id
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      onPressed: () async {
                        await signOut();
                        Navigator.pop(context);
                      },
                      child: const Center(child: Text('LOGOUT')),
                    ),
                  ),
                  sizedBoxHeight10,
                  Text(user.email!)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
