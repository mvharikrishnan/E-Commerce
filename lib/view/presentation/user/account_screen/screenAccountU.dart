import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/account_screen/widget/account_edit_button.dart';
import 'package:ecommerceapp/view/presentation/user/account_screen/widget/account_profile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenAccountUser extends StatelessWidget {
  const ScreenAccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUser(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            sizedBoxHeight10,
            const account_profile(),
            sizedBoxHeight10,
            const account_edit_button()
          ],
        ),
      ),
    );
  }
}
