import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';
import 'package:ecommerceapp/view/presentation/creator/orders_received/widgets/creatorOrderRecivedTile.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/appBarCreator.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:flutter/material.dart';


class Order_recived_screen extends StatelessWidget {
   Order_recived_screen({
    required this.email,
    super.key});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: backGroundColor(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  appBarCreator(context),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxHeight10,
                        const Text(
                          'Order Received',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        sizedBoxHeight10,
                        StreamBuilder(
                            stream: fetchUserOrderOnCreator(email),
                            builder: (context, snapshot) {
                              
                              if (snapshot.hasError) {
                                return const Text('Something went wrong');
                              }
                              if (snapshot.hasData) {
                                final orderProducts = snapshot.data!;
                                
                                return ListView(
                                  shrinkWrap: true,
                                  children:
                                      orderProducts.map(BuildOrder).toList(),
                                );
                              }
                              return SizedBox();
                            },
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


Widget BuildOrder(OrderModel orderModel) =>
    CreatorOrderRecivedTile(orderModel: orderModel);