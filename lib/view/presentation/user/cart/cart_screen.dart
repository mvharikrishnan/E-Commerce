import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/cart/widgets/cart_list_tile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({super.key});

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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 350,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        color: const Color.fromARGB(255, 243, 206, 22)),
                    child: const Center(
                        child: Text(
                      'Proceed to Buy(10 times)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            sizedBoxHeight10,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => const cart_list_tile(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
