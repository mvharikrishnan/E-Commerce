import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/presentation/user/home_screen/widget/homeScreenProductTile.dart';
import 'package:ecommerceapp/view/presentation/user/home_screen/widget/slidingBarItemTile.dart';
import 'package:flutter/material.dart';

class ScreenHomeUser extends StatelessWidget {
  const ScreenHomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUser(),
      drawer: Drawer(
        backgroundColor: offWhiteK,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SlidingBarItem(),
            CarouselSlider(
              options: CarouselOptions(height: 185.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      // child: Text(
                      //   'text $i',
                      //   style: TextStyle(fontSize: 16.0),
                      // ),
                    );
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Top Artworks',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // GridView.builder(
            //   itemCount: 30 ,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            //   itemBuilder: (context, index) {
            //     return HomeScreenGridTile();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
