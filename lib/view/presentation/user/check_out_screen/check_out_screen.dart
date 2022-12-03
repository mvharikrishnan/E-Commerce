import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

enum payment { razorpay, cod }

class _CheckOutScreenState extends State<CheckOutScreen> {
  payment? paymentmethod = payment.razorpay;
  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    'Select a payment method',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  ListTile(
                    leading: Radio(
                      value: payment,
                      groupValue: paymentmethod,
                      onChanged: (value) {
                        //set state
                      },
                    ),
                    title: Container(
                      height: 50,
                      width: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/drawingImage/razorypay.png'))),
                    ),
                  ),
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  ListTile(
                    leading: Radio(
                      value: payment,
                      groupValue: paymentmethod,
                      onChanged: (value) {
                        //set state
                      },
                    ),
                    title: const Text(
                      'Cash On Delivery',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Spacer(),
              Container(
                height: 58,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: skyBlueLightK),
                child: Center(
                    child: Text(
                  'Proceed',
                  style: TextStyle(fontSize: 20, fontFamily: TradeGothic),
                )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
