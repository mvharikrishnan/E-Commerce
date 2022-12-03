import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/cart/cart_screen.dart';
import 'package:ecommerceapp/view/presentation/user/check_out_screen/check_out_screen.dart';
import 'package:ecommerceapp/view/presentation/user/product_screen/widgets/productScreenButton.dart';
import 'package:ecommerceapp/view/presentation/user/product_screen/widgets/productsDetails.dart';
import 'package:ecommerceapp/view/presentation/user/product_screen/widgets/review_widget.dart';

import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                offWhiteK,
              ]),
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
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
                sizedBoxHeight10,
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ProductImage),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹$ProductPrice",
                      style: const TextStyle(
                          fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 35,
                        ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Product Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    sizedBoxHeight10,
                    const Text(
                      'Smiling Girl Portrail on 300 GSM Canvas drawin with Steadler Pencil. Strathmore A4 Paper.',
                      style: TextStyle(fontSize: 17),
                    ),
                    sizedBoxHeight10,
                    const Text(
                      'Creator:Creator Name',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                sizedBoxHeight10,
                sizedBoxHeight10,
                Column(
                  children: [
                    ProductScreenButtons(
                      ctx: context,
                      Onpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Cart_Screen(),
                        ));
                      },
                      ButtonColor: Colors.amber,
                      ButtonText: 'Add to Cart',
                    ),
                    sizedBoxHeight10,
                    ProductScreenButtons(
                      ctx: context,
                      Onpressed: () {
                        //navigation to Buy now screen
                         Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CheckOutScreen(),
                        ));
                      },
                      ButtonColor: const Color.fromARGB(255, 237, 86, 5),
                      ButtonText: 'Buy Now',
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.security),
                    ),
                    const Text('Secure Transaction')
                  ],
                ),
                DividerEcommerce(),
                const ProductsDetails(),
                DividerEcommerce(),
                const Review_Screen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
