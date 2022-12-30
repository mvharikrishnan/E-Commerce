import 'dart:developer';

import 'package:ecommerceapp/controller/orders.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreatorOrderRecivedTile extends StatelessWidget {
  const CreatorOrderRecivedTile({required this.orderModel, super.key});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 108,
            height: 109,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(orderModel.productImage))),
          ),
          sizedBox10,
          sizedBox10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                orderModel.productName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(
                'View Address',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.lightBlue),
              ),
              sizedBoxHeight10,
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      //accept the order
                      await creatorOrderConfirmation(
                        order: OrderModel(
                          cartPrice: orderModel.cartPrice,
                          productDescription: orderModel.productDescription,
                          category: orderModel.category,
                          productMaterial: orderModel.productMaterial,
                          productPrice: orderModel.productPrice,
                          productSize: orderModel.productSize,
                          productMedium: orderModel.productMedium,
                          productImage: orderModel.productImage,
                          productName: orderModel.productName,
                          id: orderModel.id,
                          isDeliverd: true,
                          isCancelled: orderModel.isCancelled,
                          orderQuantity: orderModel.orderQuantity,
                        ),
                      );
                        log("${orderModel.productName} accepted");
                      //show snak bar
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          '${orderModel.productName} Accepted',
                          style: TextStyle(color: KWhite),
                        ),
                        backgroundColor: kGreen,
                      ));
                    },
                    child: orderModel.isDeliverd
                        ? Container(
                            width: 89,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: const Center(
                              child: Text(
                                'Accepted',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),
                          )
                        : Container(
                            width: 89,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: const Center(
                              child: Text(
                                'Accept',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),
                          ),
                  ),
                  sizedBox10,
                  GestureDetector(
                    onTap: () async {
                      await creatorOrderConfirmation(
                        order: OrderModel(
                          cartPrice: orderModel.cartPrice,
                          productDescription: orderModel.productDescription,
                          category: orderModel.category,
                          productMaterial: orderModel.productMaterial,
                          productPrice: orderModel.productPrice,
                          productSize: orderModel.productSize,
                          productMedium: orderModel.productMedium,
                          productImage: orderModel.productImage,
                          productName: orderModel.productName,
                          id: orderModel.id,
                          isDeliverd: orderModel.isDeliverd,
                          isCancelled: true,
                          orderQuantity: orderModel.orderQuantity,
                        ),
                      );

                      log("${orderModel.productName} REJECTED");
                    },
                    child: orderModel.isCancelled?Container(
                      width: 89,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: const Center(
                        child: Text(
                          'Rejected',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                    ):Container(
                      width: 89,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: const Center(
                        child: Text(
                          'Reject',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
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
    );
  }
}
