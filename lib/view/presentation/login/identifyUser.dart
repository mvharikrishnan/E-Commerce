import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/view/presentation/login/createaccount.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class IdentifyRoleScreen extends StatelessWidget {
  const IdentifyRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> role = ['creator', 'user'];
    return Scaffold(
      backgroundColor: offWhiteK,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tell Me Who You Are..?',
                    style: TextStyle(
                      fontFamily: TradeGothic,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  //creator sign UP\
                  // navigation to create account screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateAccount(role: role[0]),
                  ));
                },
                child: Container(
                  height: size.width * 0.9,
                  width: size.width * 0.7,
                  child: Center(
                    child: Column(
                      children: [
                        Lottie.asset('assets/drawingImage/creatorLottie.json'),
                        Text(
                          'CREATOR',
                          style: TextStyle(
                            fontFamily: TradeGothic,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //user sign up
                  // navigation to create account screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateAccount(role: role[1]),
                  ));
                },
                child: Container(
                  height: size.width * 0.9,
                  width: size.width * 0.7,
                  child: Center(
                    child: Column(
                      children: [
                        Lottie.asset('assets/drawingImage/buyer.json'),
                        Text(
                          'USER',
                          style: TextStyle(
                            fontFamily: TradeGothic,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
