import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Text formFieldTitle(String Title) {
  return Text(
    Title,
    style:
        TextStyle(color: darkBlueK, fontSize: 20, fontWeight: FontWeight.w500),
  );
}


