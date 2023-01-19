import 'package:ecommerceapp/controller/cart.dart';
import 'package:ecommerceapp/controller/wishList.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class WishListTile extends StatelessWidget {
  WishListTile({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                Product_Viewing_screen(productModel: productModel),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: 0.150 * size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: skyBlueLightK,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 0.12 * size.height,
                  width: 0.12 * size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productModel.productImage),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                sizedBox10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      productModel.productName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹${productModel.productPrice}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            //add to wishlist
                            await addToCart(productModel: productModel);
                            await removeFromWishList(
                                productID: productModel.productName);
                          },
                          child: Container(
                            width: 0.24 * size.width,
                            height: 0.035 * size.height,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                                child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        sizedBox10,
                        //remove
                        InkWell(
                          onTap: () async {
                            await removeFromWishList(
                                productID: productModel.productName);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    decoration:
                                        BoxDecoration(color: kTransparent),
                                    child: Lottie.network(
                                        'https://assets6.lottiefiles.com/packages/lf20_5c8UAz.json',
                                        repeat: false,
                                        animate: true),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 0.24 * size.width,
                            height: 0.035 * size.height,
                            decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: KWhite),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
