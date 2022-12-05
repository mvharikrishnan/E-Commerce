import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/creator/home/creator_home_screen.dart';
import 'package:ecommerceapp/view/presentation/user/cart/cart_screen.dart';
import 'package:flutter/material.dart';

AppBar appBarUser(BuildContext context) {
  return AppBar(
    backgroundColor: skyBlueLightK,
    elevation: 0,
    iconTheme: IconThemeData(color: darkBlueK),
    actions: [
      IconButton(
        onPressed: () {
          //navigation of user to cart
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Cart_Screen(),
          ));
        },
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: darkBlueK,
          size: 35,
        ),
      ),
      sizedBox10,
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Creator_Home_screen(),
          ));
        },
        child: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(userDummyImage),
        ),
      ),
      sizedBox10,
    ],
  );
}
