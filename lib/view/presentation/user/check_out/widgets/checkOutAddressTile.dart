import 'package:ecommerceapp/controller/address.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/editUserAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOutAddressTile extends StatelessWidget {
  final void Function(AddressModel addressModel) dataAddress;
  const CheckOutAddressTile(
      {required this.addressModelFuture, super.key, required this.dataAddress});
  final Future<List<AddressModel>> addressModelFuture;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FutureBuilder(
        future: addressModelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final address = snapshot.data!;
              final addressModel = address.first;
              dataAddress(addressModel);
              return Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3,
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressModel.fullName,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        addressModel.houseName,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        addressModel.streetName,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${addressModel.townName},${addressModel.state},${addressModel.pincode}",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        addressModel.country,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Phone: ${addressModel.phone}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      sizedBoxHeight10,
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              //Edit method
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    EditUserAddress(addressModel: addressModel),
                              ));
                            },
                            child: Container(
                              width: 86,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                            ),
                          ),
                          sizedBox10,
                          InkWell(
                            onTap: () {
                              // deleteAddressFromFB(
                              //     fullName: addressModel.docName);
                            },
                            child: Container(
                              width: 86,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                'Change',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
