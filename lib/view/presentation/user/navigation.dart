import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/view/presentation/user/account/screenAccountU.dart';
import 'package:ecommerceapp/view/presentation/user/category_screen/screenCategoryU.dart';
import 'package:ecommerceapp/view/presentation/user/discover/screenDiscoverU.dart';
import 'package:ecommerceapp/view/presentation/user/home/screenHomeU.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationScreenUser extends StatefulWidget {
  const NavigationScreenUser({super.key});

  @override
  State<NavigationScreenUser> createState() => _NavigationScreenUserState();
}

final List<Widget> _screens = <Widget>[
  const ScreenHomeUser(),
  const ScreenCategoryUser(),
  const ScreenDiscoverUser(),
  ScreenAccountUser(),
];
int _currentIndex = 0;

class _NavigationScreenUserState extends State<NavigationScreenUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColorWhite,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: skyBlueLightK,
        fixedColor: darkBlueK,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.saved_search), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
