import 'dart:developer';

import 'package:ecommerceapp/controller/cart.dart';
import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/controller/wishList.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';

import 'package:ecommerceapp/view/presentation/user/check_out/check_out_screen.dart';
import 'package:ecommerceapp/view/presentation/user/product/widgets/productScreenButton.dart';
import 'package:ecommerceapp/view/presentation/user/product/widgets/productsDetails.dart';

import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Product_Viewing_screen extends StatelessWidget {
  Product_Viewing_screen({required this.productModel, super.key});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    final size = MediaQuery.of(context).size;
    //for shareplus box
    final box = context.findRenderObject() as RenderBox?;
    List<ProductModel> singleProduct = [productModel];
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
                      productModel.productName,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () async {
                        //!share plus
                        log("Share Button pressed");
                      },
                      icon: Icon(
                        Icons.share_outlined,
                        size: 0.1 * size.width,
                      ),
                    ),
                  ],
                ),
                Text(
                  productModel.productMedium,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                sizedBoxHeight10,
                Container(
                  width: double.infinity,
                  height: 0.320 * size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productModel
                          .productImage), //if its null use ProductImage
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${productModel.productPrice}",
                      style: const TextStyle(
                          fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                    // IconButton(
                    //     onPressed: () async {
                    //       await addToWishList(productModel: productModel);
                    //       showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             content: Container(
                    //               decoration:
                    //                   BoxDecoration(color: kTransparent),
                    //               child: Lottie.network(
                    //                   'https://assets10.lottiefiles.com/packages/lf20_f9e9tqcx.json',
                    //                   repeat: false,
                    //                   animate: true),
                    //             ),
                    //           );
                    //         },
                    //       );
                    //     },
                    //     icon: const Icon(
                    //       Icons.favorite,
                    //       color: Colors.red,
                    //       size: 35,
                    //     ))
                    SizedBox(
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
                              bool isFav = ProductNames.where((product) =>
                                      product == productModel.productName)
                                  .isNotEmpty;
                              return isFav
                                  ? IconButton(
                                      onPressed: () {
                                        //add product to wish list
                                        log("Removed From wishlist");
                                        removeFromWishList(
                                            productID:
                                                productModel.productName);
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
                                        addToWishList(
                                            productModel: productModel);
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Product Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    sizedBoxHeight10,
                    Text(
                      productModel.productDescription,
                      style: TextStyle(fontSize: 17),
                    ),
                    sizedBoxHeight10,
                    Text(
                      'Creator: ${productModel.creatorEmail}',
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
                      Onpressed: () async {
                        //add the product to cart
                        await addToCart(productModel: productModel);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(color: kTransparent),
                                child: Lottie.network(
                                    'https://assets5.lottiefiles.com/packages/lf20_yt24wfpb.json',
                                    repeat: false,
                                    animate: true),
                              ),
                            );
                          },
                        );
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
                          builder: (context) => CheckOutScreen(
                              usersCartProducts: singleProduct,
                              Useremail: email),
                        ));
                      },
                      ButtonColor: const Color.fromARGB(255, 237, 86, 5),
                      ButtonText: 'Buy Now',
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.security),
                    Text('Secure Transaction')
                  ],
                ),
                DividerEcommerce(),
                ProductsDetails(productModel: productModel),
                DividerEcommerce(),
                // const Review_Screen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
