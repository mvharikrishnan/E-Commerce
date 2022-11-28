import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/material.dart';

AppBar appBarUser() {
  return AppBar(
    backgroundColor: skyBlueLightK,
    elevation: 0,
    iconTheme: IconThemeData(color: darkBlueK),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: darkBlueK,
          size: 35,
        ),
      ),
      sizedBox10,
      CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(userDummyImage),
      ),
      sizedBox10,
    ],
  );
}
