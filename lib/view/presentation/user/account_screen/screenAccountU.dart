import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/account_screen/widget/account_edit_button.dart';
import 'package:ecommerceapp/view/presentation/user/account_screen/widget/account_profile.dart';
import 'package:ecommerceapp/view/presentation/user/account_screen/widget/settingTile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';


class ScreenAccountUser extends StatelessWidget {
  const ScreenAccountUser({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    UserName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  sizedBoxHeight10,
                  const account_profile(),
                  sizedBoxHeight10,
                  const account_edit_button(),
                  sizedBoxHeight10,
                   settingTile(
                    onPressed:() {
                      //navigation to your order
                    },
                    settingTitleName: 'Your Order',
                  ),
                   settingTile(
                    onPressed: () {
                      //navigation to wwish list
                    },
                    settingTitleName: 'Wish List',
                  ),
                   settingTile(
                    onPressed: () {
                      //navigation to manage address
                    },
                    settingTitleName: 'Manage Address',
                  ),
                   settingTile(
                    onPressed: () {
                      //navigation to privacy note
                    },
                    settingTitleName: 'Privacy Note',
                  ),
                   settingTile(
                    onPressed: () {
                      //navigation to login and secutity
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
