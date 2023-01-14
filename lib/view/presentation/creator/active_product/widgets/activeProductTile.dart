import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/widget/divider.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class activeProductTile extends StatelessWidget {
  const activeProductTile({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            sizedBoxHeight10,
            Container(
              width: 112,
              height: 126,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productModel.productImage))),
            ),
            sizedBox10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.productName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                sizedBoxHeight10,
                Text(
                  productModel.category,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                sizedBoxHeight10,
                Text(
                  "₹${productModel.productPrice}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        // sizedBoxHeight10,
        // Container(
        //   height: 40,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10), color: Colors.amber),
        //   child: const Center(
        //       child: Text(
        //     'Edit Product',
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //   )),
        // ),
        // sizedBoxHeight10,
        // GestureDetector(
        //   onTap: () {
            //function to delete
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: Text('Alert'),
            //       content: Lottie.network(url),
            //       actions: [
            //         TextButton(
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //           child: Text('OK'),
            //         ),
            //       ],
            //     );
            //   },
            // );
        //   },
        //   child: Container(
        //     height: 40,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: Color(0xFFFC7F0B)),
        //     child: const Center(
        //         child: Text(
        //       'Remove',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //     )),
        //   ),
        // ),
        sizedBoxHeight10,
        DividerEcommerce(),
      ],
    );
  }
}
