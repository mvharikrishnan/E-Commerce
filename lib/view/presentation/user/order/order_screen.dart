import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';
import 'package:ecommerceapp/view/presentation/user/order/widget/orderProductTile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Order_Screen extends StatelessWidget {
  const Order_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                sizedBoxHeight10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Orders',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        StreamBuilder(
                          stream: fetchUserOrder(email!),
                          builder: (context, snapshot) {
                            List<OrderModel>currentOrders = [];
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }
                            if (snapshot.hasData) {
                              final orderProducts = snapshot.data!;
                              for(OrderModel currentOrder in orderProducts){
                                if(currentOrder.isDeliverd == false){
                                  currentOrders.add(currentOrder);
                                }
                              }
                              return ListView(
                                shrinkWrap: true,
                                children:
                                    currentOrders.map(BuildOrder).toList(),
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ],
                    ),
                    sizedBoxHeight10,
                    DividerEcommerce(),
                    const Text(
                      'Recent Orders',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        StreamBuilder(
                          stream: fetchUserOrder(email),
                          builder: (context, snapshot) {
                            List<OrderModel> recentOrdes = [];
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }
                            if (recentOrdes.isEmpty) {
                              return const Center(
                                  child: Text('You have no recent orders'));
                            }
                            if (snapshot.hasData) {
                              final orderProducts = snapshot.data!;
                              for(OrderModel recent in orderProducts){
                                if(recent.isDeliverd == true){
                                  recentOrdes.add(recent);
                                }
                              }
                              return ListView(
                                shrinkWrap: true,
                                children:
                                    recentOrdes.map(BuildOrder).toList(),
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ],
                    ),
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

Widget BuildOrder(OrderModel orderModel) =>
    OrderProductTile(orderModel: orderModel);
