import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

// class GetUserAddress{
// static   List<AddressModel>? UserAddress;
//   static AddressModel  getCurrentAddress(){
//      StreamBuilder<List<AddressModel>>(builder: (context, snapshot) {
//       if(snapshot.hasData){
//         UserAddress = snapshot.data!.toList();
//         return UserAddress;
//       }else{
//         return SizedBox();
//       }
//     },);
//   }
// }

//   AddressModel getUserAddress({required String email})  {
//   Stream<List<AddressModel>> stream = fetchUserAddress(email);
//   AddressModel currentAddress = convertStreamToSingleMap(stream);
//   return currentAddress;
// }


class GetuserAddress{
  static final _email = FirebaseAuth.instance.currentUser!.email;


  static Future<List<AddressModel>> fetchUserAddress()async{
    final _currentAddress =  FirebaseFirestore.instance
        .collection('Users')
        .doc(_email)
        .collection('Address')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList());

            final temp = await _currentAddress.first;
            return temp;

  }


  static  getOneAddress(Future<List<AddressModel>> future)async{
    List<AddressModel> list = await future;

    AddressModel address = list[0];
    return address;
  }
}