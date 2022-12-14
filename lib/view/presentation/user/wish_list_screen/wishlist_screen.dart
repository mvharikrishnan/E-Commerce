import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';

import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/presentation/user/wish_list_screen/widgets/wishListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class WishList_screen extends StatelessWidget {
  const WishList_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
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
                child: StreamBuilder<List<ProductModel>>(
                  stream: fetchWishListProducts(email!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something Went Wrong ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      final wishListProducts = snapshot.data!;
                      return wishListProducts.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 500,
                                    width: 500,
                                    decoration:
                                        BoxDecoration(color: kTransparent),
                                    child: Lottie.network(
                                      'https://assets10.lottiefiles.com/private_files/lf30_oqpbtola.json',
                                      animate: true,
                                    ),
                                  ),
                                  const Text("ADD SOME PRODUCTS")
                                ],
                              ),
                            )
                          : ListView(
                              children:
                                  wishListProducts.map(BuildWidget).toList(),
                            );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget BuildWidget(ProductModel productModel) => WishListTile(
      productModel: productModel,
    );
