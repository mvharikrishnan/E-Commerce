import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:flutter/material.dart';

class account_profile extends StatelessWidget {
  const account_profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(userDummyImage),
        )
      ],
    );
  }
}