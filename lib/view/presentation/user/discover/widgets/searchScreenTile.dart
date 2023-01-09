import 'dart:developer';

import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/controller/wishList.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchScreenTile extends StatelessWidget {
  const searchScreenTile({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: const [],
                borderRadius: BorderRadius.circular(10),
                color: skyBlueLightK),
          ),
          Positioned(
            left: 15,
            top: 15,
            child: Container(
              width: 109,
              height: 109,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
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
                Text(productModel.category)
              ],
            ),
          ),
          // Positioned(
          //   bottom: 5,
          //   right: 10,
          //   child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.favorite_rounded,
          //         color: Colors.red,
          //       )),
          // ),
          Positioned(
            right: 10,
            top: 10,
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
    );
  }
}
