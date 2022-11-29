import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/view/presentation/user/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: TradeGothic),
      home: NavigationScreenUser(),
    );
  }
}
