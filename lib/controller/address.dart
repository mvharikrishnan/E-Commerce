import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addAddressToFB({required AddressModel addressModel}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

//reference to the document
  final docAddress = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('Address')
      .doc(addressModel.fullName);

  //instance to the address with data
  final userAddress = AddressModel(
      fullName: addressModel.fullName,
      houseName: addressModel.houseName,
      streetName: addressModel.streetName,
      townName: addressModel.townName,
      pincode: addressModel.pincode,
      state: addressModel.state,
      phone: addressModel.phone,
      country: addressModel.country);

  //convert the instance to JSON Format
  final userAddressJSON = userAddress.toJson();

  //add the json to FB
  await docAddress.set(userAddressJSON);
}

Future edituserAddressToFB(
    {required AddressModel addressModel, required String docName}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

  //reference to the document
  final docAddress = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('Address')
      .doc(docName);

  //instance to the edited address
  final userAddress = AddressModel(
      fullName: addressModel.fullName,
      houseName: addressModel.houseName,
      streetName: addressModel.streetName,
      townName: addressModel.townName,
      pincode: addressModel.pincode,
      state: addressModel.state,
      phone: addressModel.phone,
      country: addressModel.country);
  //convert the instance to JSON
  final userAddressJSON = userAddress.toJson();

  //update the userAddress
  await docAddress.update(userAddressJSON);
}
