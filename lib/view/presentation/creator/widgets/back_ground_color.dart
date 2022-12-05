import 'package:ecommerceapp/core/colors/colors.dart';

import 'package:flutter/material.dart';

BoxDecoration backGroundColor() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 179, 245, 238),
            offWhiteK,
          ]),
      color: darkBlueLightK,
      borderRadius: BorderRadius.circular(10));
}
