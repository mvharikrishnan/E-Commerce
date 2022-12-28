import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/cart/widgets/cart_list_tile.dart';
import 'package:ecommerceapp/view/presentation/user/check_out/check_out_screen.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    List<ProductModel> userCartProducts = [];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                offWhiteK,
              ]),
          color: darkBlueLightK,
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: fetchCartProducts(email!),
                    builder: (context, snapshot) {
                      final cartData = snapshot.data!;
                      userCartProducts = cartData;
                      double totalSum = getSugTotal(cartData);
                      if (snapshot.hasData) {
                        return Text(
                          'Subtotal: ₹$totalSum',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CheckOutScreen(usersCartProducts: userCartProducts,Useremail: email),
                      ));
                    },
                    child: Container(
                        width: 350,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            color: const Color.fromARGB(255, 243, 206, 22)),
                        child: StreamBuilder<List<ProductModel>>(
                          stream: fetchCartProducts(email),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final produts = snapshot.data!;

                              final ListCount = produts.length;
                              return Center(
                                child: Text(
                                  'Proceed to Buy($ListCount)',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            } else {
                              return const Center(
                                child: Text('Please Add Products'),
                              );
                            }
                          },
                        )),
                  ),
                ),
              ],
            ),
            sizedBoxHeight10,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<List<ProductModel>>(
                  stream: fetchCartProducts(email),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something Went Wrong ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      final cartProducts = snapshot.data!;
                      return ListView(
                        children: cartProducts.map(BuildCart).toList(),
                      );
                    }
                    return Center(
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            width: 500,
                            // decoration: BoxDecoration(color: darkBlueK),
                            child: Lottie.network(
                                'https://assets3.lottiefiles.com/packages/lf20_qh5z2fdq.json'),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BuildCart(ProductModel productModel) => cart_list_tile(
      productModel: productModel,
    );
getSugTotal(List<ProductModel> cartZ) {
  double total = 0;
  for (ProductModel product in cartZ) {
    total += int.parse(product.productPrice);
  }
  return total;
}
