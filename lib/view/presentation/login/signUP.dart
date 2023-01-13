import 'dart:ui';

import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:ecommerceapp/view/presentation/login/identifyUser.dart';
import 'package:ecommerceapp/view/presentation/login/login.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhiteK,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 400,
                child: Lottie.network(LottieLoginPage),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'ARTIFY',
                style: TextStyle(
                  fontFamily: TradeGothic,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => IdentifyRoleScreen(),
                  ));
                },
                child: Container(
                  width: 335,
                  height: 56,
                  decoration: BoxDecoration(
                      color: darkBlueK,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(color: KWhite),
                    ),
                  ),
                ),
              ),
              sizedBoxHeight10,
              sizedBoxHeight10,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
                child: Container(
                  width: 335,
                  height: 56,
                  decoration: BoxDecoration(
                      color: offWhiteK,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                      )),
                  child: Center(
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(color: kBlack),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
