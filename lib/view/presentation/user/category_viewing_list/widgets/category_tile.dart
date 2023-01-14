import 'dart:developer';

import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/controller/wishList.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/product/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class category_tile extends StatelessWidget {
  const category_tile({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Product_Viewing_screen(
              productModel: productModel,
            ),
          ));
        },
        child: Stack(
          children: [
            Container(
              height: 0.160 * size.height,
              width: double.infinity,
              decoration:  BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0, // has the effect of softening the shadow
                  spreadRadius: 1.0, // has the effect of extending the shadow
                  offset: Offset(
                    8.0, // horizontal, move right 10
                    2.0, // vertical, move down 10
                  ),
                )
              ], borderRadius: BorderRadius.circular(10), color: skyBlueLightK),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: Container(
                width: 0.260 * size.width,
                height: 0.260 * size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(productModel.productImage),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 140,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productModel.productName,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: TradeGothic),
                  ),
                  sizedBoxHeight10,
                  Text(
                    "₹${productModel.productPrice}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight10,
                  Text(productModel.productMaterial)
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 5,
              child: StreamBuilder<List<ProductModel>>(
                  stream: fetchWishListProducts(email!),
                  //streamBUilder for wishlist collection
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("🚫");
                    }
                    if (snapshot.hasData) {
                      final wishListProducts = snapshot.data!;
                      List<String> ProductNames = [];
                      for (ProductModel product in wishListProducts) {
                        ProductNames.add(product.productName);
                      }
                      bool isFav = ProductNames.where(
                              (product) => product == productModel.productName)
                          .isNotEmpty;
                      return isFav
                          ? IconButton(
                              onPressed: () {
                                //add product to wish list
                                log("Removed From wishlist");
                                removeFromWishList(
                                    productID: productModel.productName);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.red,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                //add product to wish list
                                log("Added to wishlist");
                                addToWishList(productModel: productModel);
                              },
                              icon: const Icon(
                                Icons.favorite_border_sharp,
                                size: 30,
                                color: Colors.red,
                              ),
                            );
                    } else {
                      return Text("⁉️");
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
