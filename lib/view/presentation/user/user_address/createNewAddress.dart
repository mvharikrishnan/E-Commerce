import 'dart:developer';

import 'package:ecommerceapp/controller/address.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/method/adressMethods.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/widgets/textFormFieldWidget.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CreateNewAddressScreen extends StatelessWidget {
  const CreateNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    //formController
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController houseController = TextEditingController();
    final TextEditingController streetController = TextEditingController();
    final TextEditingController townNameController = TextEditingController();
    final TextEditingController pincodeController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
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
        backgroundColor: kTransparent,
        appBar: appBarUser(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ConstantNames.AddNewAddress,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: TradeGothic),
                    )
                  ],
                ),
                sizedBoxHeight10,
                sizedBoxHeight10,
                sizedBoxHeight10,
                AddressFormTitle(Title: 'Full Name'),
                textformFieldWidget(
                  controller: fullNameController,
                  validator: (value) => value != null && value.length < 4
                      ? 'Enter Valid Name'
                      : null,
                ),
                AddressFormTitle(Title: 'House no.'),
                textformFieldWidget(
                  controller: houseController,
                  validator: (value) => value != null && value.length < 5
                      ? 'Enter house name'
                      : null,
                ),
                AddressFormTitle(Title: 'Street Name'),
                textformFieldWidget(
                  controller: streetController,
                  validator: (value) => value != null && value.length < 5
                      ? 'Enter valid House name'
                      : null,
                ),
                AddressFormTitle(Title: 'Town Name'),
                textformFieldWidget(
                  controller: townNameController,
                  validator: (value) => value != null && value.length < 3
                      ? 'Enter valid town name'
                      : null,
                ),
                AddressFormTitle(Title: 'Pin Code'),
                textformFieldWidget(
                  keyboardType: TextInputType.number,
                  controller: pincodeController,
                  hintText: '6 digits [0-9] PIN code',
                  maxLength: 6,
                  validator: (value) => value != null && value.length > 6
                      ? 'Enter valid Pincode'
                      : null,
                ),
                AddressFormTitle(Title: 'State'),
                textformFieldWidget(controller: stateController),
                AddressFormTitle(Title: 'Phone No'),
                textformFieldWidget(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  hintText: '10 digits mobile number without prefixes',
                  maxLength: 10,
                  validator: (value) => value != null && value.length < 10
                      ? 'Enter valid Phone Number'
                      : null,
                ),
                AddressFormTitle(Title: 'Country'),
                textformFieldWidget(controller: countryController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber)),
                        onPressed: () async {
                          //add address
                          await addAddressToFB(
                            addressModel: AddressModel(
                              fullName: fullNameController.text.trim(),
                              houseName: houseController.text.trim(),
                              streetName: stateController.text.trim(),
                              townName: townNameController.text.trim(),
                              pincode: pincodeController.text.trim(),
                              state: stateController.text.trim(),
                              phone: phoneController.text.trim(),
                              country: countryController.text.trim(),
                              docName: fullNameController.text.trim(),
                            ),
                          );

                          Navigator.pop(context);
                          //snakbar
                          showTopSnackBar(
                              OverlayState(),
                              CustomSnackBar.success(
                                  message: 'Successfully Added your Address'));
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: kBlack, fontSize: 20),
                        ))
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
