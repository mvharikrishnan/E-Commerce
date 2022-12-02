import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Product_Viewing_screen extends StatelessWidget {
  const Product_Viewing_screen(
      {required this.ProductImage,
      required this.ProductName,
      required this.ProductPrice,
      super.key});
  final String ProductName;
  final String ProductPrice;
  final String ProductImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUser(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ProductName,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Text(
              'Pencil Portrait on 250 GSM Paper',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
