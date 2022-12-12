import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static ShowSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(text, style: TextStyle(color: KWhite)));

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
