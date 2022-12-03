import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WishList_screen extends StatelessWidget {
  const WishList_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color.fromARGB(255, 191, 249, 242),
              ]),
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wish List',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: skyBlueLightK,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/drawingImage/drawing2.jpeg'),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            sizedBox10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Girl Portrait -A4 (Pencil Portrait)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '₹150',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 131,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => sizedBoxHeight10,
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
