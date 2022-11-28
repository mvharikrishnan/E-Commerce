import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenHomeUser extends StatelessWidget {
  const ScreenHomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUser(),
      drawer: Drawer(
        backgroundColor: offWhiteK,
      ),
    );
  }
}
