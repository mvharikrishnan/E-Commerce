import 'dart:developer';

import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';

import 'package:ecommerceapp/view/presentation/user/check_out/widgets/checkOutAddressTile.dart';
import 'package:ecommerceapp/view/presentation/user/check_out/widgets/getUserAddress.dart';

import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({
    required this.Useremail,
    required this.usersCartProducts,
    super.key,
  });
  final List<ProductModel> usersCartProducts;
  final String Useremail;
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

String? paymentmethod;

class _CheckOutScreenState extends State<CheckOutScreen> {
  AddressModel? currentAddress;
  onData(AddressModel addressModel) {
    log(addressModel.fullName);
    currentAddress = addressModel;
  }

  final addressModel = GetuserAddress.fetchUserAddress();

  AddressModel selectedAddress = AddressModel(
      fullName: 'fullName',
      houseName: 'houseName',
      streetName: 'streetName',
      townName: 'townName',
      pincode: 'pincode',
      state: 'state',
      phone: 'phone',
      country: 'country',
      docName: 'docName');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                KWhite,
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
                  Container(
                    height: 240,
                    width: double.infinity,
                    child: CheckOutAddressTile(
                        addressModelFuture: addressModel, dataAddress: onData),
                  ),
                  sizedBoxHeight10,
                  sizedBoxHeight10,
                  ListTile(
                    leading: Radio(
                      value: 'Razorpay',
                      groupValue: paymentmethod,
                      onChanged: (value) {
                        //set state
                      setState(() {
                          paymentmethod = value.toString();
                      });
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
                      value: 'cod',
                      groupValue: paymentmethod,
                      onChanged: (value) {
                        //set state
                       setState(() {
                          paymentmethod = value.toString();
                       });
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
              InkWell(
                onTap: () {
                  setState(() {
                    selectedAddress = currentAddress!;
                    log(paymentmethod.toString());
                  });

                  //checkwhat is selected
                },
                child: Container(
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
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
