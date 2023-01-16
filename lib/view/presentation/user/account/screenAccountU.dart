import 'dart:developer';

import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/account/widget/account_edit_button.dart';
import 'package:ecommerceapp/view/presentation/user/account/widget/account_profile.dart';
import 'package:ecommerceapp/view/presentation/user/account/widget/settingTile.dart';
import 'package:ecommerceapp/view/presentation/user/loginAndSecurity/loginAndSecurity.dart';
import 'package:ecommerceapp/view/presentation/user/order/order_screen.dart';
import 'package:ecommerceapp/view/presentation/user/privacyNote/privacyNote.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/user_address.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/presentation/user/wish_list_screen/wishlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenAccountUser extends StatelessWidget {
  const ScreenAccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                offWhiteK,
              ]),
          color: darkBlueLightK,
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Hello, ',
                    style: TextStyle(fontSize: 24),
                  ),
                  FutureBuilder(
                      future: fetchUserEmails(email: _user.email!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          log(snapshot.error.toString());
                          return const Text("Error");
                        }
                        if (snapshot.hasData) {
                          final data = snapshot.data!;
                          return Text(
                            _user.displayName ?? data.userName,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          );
                        } else {
                          return const Text(
                            'User',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          );
                        }
                      }),
                ],
              ),
              Column(
                children: [
                  sizedBoxHeight10,
                  account_profile(user: _user),
                  sizedBoxHeight10,
                  const account_edit_button(),
                  sizedBoxHeight10,
                  settingTile(
                    onPressed: () {
                      //navigation to your order
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Order_Screen(),
                      ));
                    },
                    settingTitleName: 'Your Order',
                  ),
                  settingTile(
                    onPressed: () {
                      //navigation to wwish list
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WishList_screen(),
                      ));
                    },
                    settingTitleName: 'Wish List',
                  ),
                  settingTile(
                    onPressed: () {
                      //navigation to manage address
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const User_Address_Manage_Screen(),
                      ));
                    },
                    settingTitleName: 'Manage Address',
                  ),
                  settingTile(
                    onPressed: () {
                      //navigation to privacy note
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PrivacyNoteScreen(),
                      ));
                    },
                    settingTitleName: 'Privacy Note',
                  ),
                  settingTile(
                    onPressed: () {
                      //navigation to login and secutity
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginAndSecurity(),
                      ));
                    },
                    settingTitleName: 'Login And Security',
                  ),
                ],
              ),
              Column(
                children: const [Text('Made with ❤️ by Harikrishnan Mv')],
              )
            ],
          ),
        ),
      ),
    );
  }
}
