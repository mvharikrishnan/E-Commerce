import 'dart:developer';

import 'package:ecommerceapp/controller/orders.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';

import 'package:ecommerceapp/view/presentation/user/check_out/widgets/checkOutAddressTile.dart';
import 'package:ecommerceapp/view/presentation/user/check_out/widgets/getUserAddress.dart';

import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
  //instance of racer pay
  Razorpay razorpay = Razorpay();

  double? cartPrice;
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });

    cartPrice = getCartTotal(widget.usersCartProducts);
    super.initState();
  }

  //check Out options
  var options = {
    'key': 'rzp_test_mkzSidhb6RgmDG',
    'amount': 500,
    'name': 'Harikrishnan Mv Corp.',
    'description': 'Demo',
    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    'external': {
      'wallets': ['paytm']
    }
  };

  //Handlers for razoypay
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    for (var order in widget.usersCartProducts) {
      newOrder(
          orderModel: OrderModel(
        cartPrice: cartPrice!,
        userEmail: widget.Useremail,
        creatorEmail: order.creatorEmail,
        productDescription: order.productDescription,
        category: order.category,
        productMaterial: order.productMaterial,
        productPrice: order.productPrice,
        productSize: order.productSize,
        productMedium: order.productMedium,
        productImage: order.productImage,
        productName: order.productName,
        id: order.productName,
        isDeliverd: false,
        isCancelled: false,
        orderQuantity: widget.usersCartProducts.length,
      ));
    }
    Navigator.of(context).pop();
    removeAfterSuccess(ordeers: widget.usersCartProducts);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.toString()),
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log(response.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kGreen,
        content: Text('Successfully Orderd'),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    log(response.toString());
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.toString())));
  }

  //to clear the event lisenrs
  @override
  void dispose() {
    razorpay.clear(); // Removes all listeners
    super.dispose();
  }

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
                    log(widget.usersCartProducts.length.toString());
                  });

                  //checkwhat is selected
                  if (paymentmethod == null) {
                    return null;
                  } else {
                    if (paymentmethod == 'cod') {
                      //!deviverd by cod
                    } else {
                      //!go to razor pay screen
                      razorpay.open(options);
                    }
                  }
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

getCartTotal(List<ProductModel> cartZ) {
  double total = 0;
  for (ProductModel product in cartZ) {
    total += double.parse(product.productPrice);
  }
  return total;
}
