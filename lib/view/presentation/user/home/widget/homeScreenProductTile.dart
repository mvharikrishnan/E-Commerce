import 'dart:developer';

import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/controller/wishList.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/product/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenGridTile extends StatelessWidget {
  const HomeScreenGridTile({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    return GestureDetector(
      onTap: () {
        //navigate to product viwing screen
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Product_Viewing_screen(
            productModel: productModel,
          ),
        ));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: skyBlueLightK,
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productModel.productImage)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          Positioned(
            bottom: 67,
            left: 5,
            child: Text(
              productModel.productName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 50,
            child: Text(
              productModel.category,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 10,
            child: Text(
              "₹${productModel.productPrice}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
    );
  }
}
