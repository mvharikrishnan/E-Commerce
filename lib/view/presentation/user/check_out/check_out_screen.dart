import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/view/presentation/user/check_out/widgets/getUserAddress.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/widgets/userAddressTile.dart';
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

enum payment { razorpay, cod }

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<AddressModel> addressModel = getUserAddress(email: "harikrish.hmv@gmail.com");
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
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: UserAddressTile(addressModel: addressModel[0]),
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
