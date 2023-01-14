import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';
import 'package:ecommerceapp/view/presentation/creator/active_product/widgets/activeProductTile.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/appBarCreator.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Active_Products_screen extends StatelessWidget {
  const Active_Products_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final user  = FirebaseAuth.instance.currentUser!;

    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBarCreator(context),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Active Products',
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      sizedBoxHeight10,
                      StreamBuilder<List<ProductModel>>(
                        stream: fetchCreatorsProducts(user.email!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('Some Error Occurs'),
                            );
                          }
                          if (snapshot.hasData) {
                            final creatorProducts = snapshot.data!;
          
                            return ListView(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: creatorProducts
                                    .map(BuildCreatorProducts)
                                    .toList());
                          } else {
                            return const Center(
                              child: Text('NO PRODUCTS FOUND PLEASE ADD'),
                            );
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget BuildCreatorProducts(ProductModel productModel) => activeProductTile(
      productModel: productModel,
    );
