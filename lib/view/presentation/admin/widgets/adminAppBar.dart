import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({
     this.TitleText,
     required this.isVisible,
    Key? key,
  }) : super(key: key);
  final String? TitleText;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: darkBlueK,
      title: Text(TitleText??ConstantNames.adminPage),
      actions: [
        Visibility(
          visible: isVisible,
          child: IconButton(
              onPressed: () {
                //logout for admin
              },
              icon: const Icon(Icons.logout_outlined)),
        )
      ],
    );
  }
}
