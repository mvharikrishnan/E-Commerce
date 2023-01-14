import 'package:ecommerceapp/controller/cart.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class cart_list_tile extends StatelessWidget {
  cart_list_tile({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            // margin:const EdgeInsets.all(100.0),
            width: 390,
            height: 165,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [skyBlueLightK, darkBlueLightK]),
                color: darkBlueLightK,
                borderRadius: BorderRadius.circular(10)),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              width: 109,
              height: 109,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productModel.productImage),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                //show alert dialog box
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              deleteFromCart(productModel: productModel);
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.check),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kGreen)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(KRed)),
                          ),
                        ],
                        content: Container(
                          height: 200,
                          width: 200,
                          child: Lottie.network(
                              'https://assets1.lottiefiles.com/packages/lf20_lz5srsyo.json'),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text('DO YOU WANT TO DELETE?')],
                        ));
                  },
                );
              },
              child: Container(
                width: 109,
                height: 21,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child: Text(
                  'Delete',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 150,
            child: Container(
              width: 109,
              height: 21,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                  child: Text(
                'Save for later',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Positioned(
            top: 15,
            left: 130,
            child: Text(
              productModel.productName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: 50,
            left: 130,
            child: Text(
              "₹${productModel.productPrice}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            left: 130,
            top: 100,
            child: Text('Sold by : Aneesh ArtWorks'),
          ),
        ],
      ),
    );
  }
}
