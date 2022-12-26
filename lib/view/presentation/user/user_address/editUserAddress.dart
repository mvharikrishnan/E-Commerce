import 'package:ecommerceapp/controller/address.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/method/adressMethods.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/widgets/textFormFieldWidget.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditUserAddress extends StatelessWidget {
  const EditUserAddress({required this.addressModel, super.key});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final String currentDocName = addressModel.fullName;
    //formController
    final TextEditingController fullNameController =
        TextEditingController(text: addressModel.fullName);
    final TextEditingController houseController =
        TextEditingController(text: addressModel.houseName);
    final TextEditingController streetController =
        TextEditingController(text: addressModel.streetName);
    final TextEditingController townNameController =
        TextEditingController(text: addressModel.townName);
    final TextEditingController pincodeController =
        TextEditingController(text: addressModel.pincode);
    final TextEditingController stateController =
        TextEditingController(text: addressModel.state);
    final TextEditingController phoneController =
        TextEditingController(text: addressModel.phone);
    final TextEditingController countryController =
        TextEditingController(text: addressModel.country);
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          //edit

                          await edituserAddressToFB(
                              addressModel: AddressModel(
                                fullName: fullNameController.text.trim(),
                                houseName: houseController.text.trim(),
                                streetName: stateController.text.trim(),
                                townName: townNameController.text.trim(),
                                pincode: pincodeController.text.trim(),
                                state: stateController.text.trim(),
                                phone: phoneController.text.trim(),
                                country: countryController.text.trim(),
                              ),
                              docName: currentDocName);
                        },
                        child: Text(
                          'Submit Changes',
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
    ;
  }
}
