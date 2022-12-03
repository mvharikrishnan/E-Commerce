import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/presentation/user/home/widget/homeScreenProductTile.dart';
import 'package:ecommerceapp/view/presentation/user/home/widget/slidingBarItemTile.dart';
import 'package:flutter/material.dart';

class ScreenHomeUser extends StatelessWidget {
  const ScreenHomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                offWhiteK,
              ]),
          color: darkBlueLightK,
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        drawer: Drawer(
          backgroundColor: offWhiteK,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SlidingBarItem(),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const SlidingBarItem(),
                separatorBuilder: (context, index) => sizedBox10,
                itemCount: 10,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 185.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/drawingImage/artfestposter2.jpg'),
                        ),
                        // color: Colors.amber,
                      ),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    return const HomeScreenGridTile();
                  },
                ),
              ),
            ),
            // HomeScreenGridTile()
          ],
        ),
      ),
    );
  }
}
