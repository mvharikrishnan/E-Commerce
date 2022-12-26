import 'package:ecommerceapp/controller/cart.dart';
import 'package:ecommerceapp/controller/wishList.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/cart/cart_screen.dart';
import 'package:ecommerceapp/view/presentation/user/check_out/check_out_screen.dart';
import 'package:ecommerceapp/view/presentation/user/product/widgets/productScreenButton.dart';
import 'package:ecommerceapp/view/presentation/user/product/widgets/productsDetails.dart';
import 'package:ecommerceapp/view/presentation/user/product/widgets/review_widget.dart';

import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Product_Viewing_screen extends StatelessWidget {
  const Product_Viewing_screen(
      {required this.productModel, required this.ProductImage, super.key});
  final String ProductImage;
  final ProductModel productModel;
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
                      productModel.productName,
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
                  height: 320,
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
                    IconButton(
                        onPressed: () async {
                          await addToWishList(productModel: productModel);
                          showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(color: kTransparent),
                                child: Lottie.network(
                                    'https://assets10.lottiefiles.com/packages/lf20_f9e9tqcx.json',
                                    repeat: false,
                                    animate: true),
                              ),
                            );
                          },
                        );
                        },
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
                    Text(
                      productModel.productDescription,
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
                ProductsDetails(productModel: productModel),
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
