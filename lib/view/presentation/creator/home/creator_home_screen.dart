import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/creator/active_product/active_products_screen.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/add_productScreen.dart';
import 'package:ecommerceapp/view/presentation/creator/orders_received/order_recived_screen.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/appBarCreator.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Creator_Home_screen extends StatelessWidget {
  const Creator_Home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: appBarCreator(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBarCreator(context),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Comming Events',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sizedBoxHeight10,
                    CarouselSlider(
                      options: CarouselOptions(height: 185.0),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                    sizedBoxHeight10,
                    sizedBoxHeight10,
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Active_Products_screen(),
                        ));
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(238, 44, 89, 109)),
                        child: const Center(
                          child: ListTile(
                            leading: FaIcon(
                              Icons.ac_unit_sharp,
                              color: Colors.white,
                              size: 50,
                            ),
                            title: Text(
                              'Active Products',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxHeight10,
                    GestureDetector(
                      onTap: () {
                        //navigation to order recivied screen
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Order_recived_screen(email: email!),
                        ));
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(238, 44, 89, 109)),
                        child: const Center(
                          child: ListTile(
                            leading: FaIcon(
                              Icons.align_vertical_bottom_sharp,
                              color: Colors.white,
                              size: 50,
                            ),
                            title: Text(
                              'Order Recived',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    //add product navigation
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Add_Product_Screen(),
                    ));
                  },
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(238, 44, 89, 109),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Add Product',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.library_add_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container drawerMethod({required String title}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          width: 3,
          color: Colors.grey,
        ),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
