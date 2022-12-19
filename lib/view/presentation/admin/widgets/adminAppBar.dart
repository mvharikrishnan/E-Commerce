import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({
     this.TitleText,
    Key? key,
  }) : super(key: key);
  final String? TitleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: darkBlueK,
      title: Text(TitleText??ConstantNames.adminPage),
      actions: [
        IconButton(
            onPressed: () {
              //logout for admin
            },
            icon: const Icon(Icons.logout_outlined))
      ],
    );
  }
}
