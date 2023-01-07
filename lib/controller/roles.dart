import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/roleModels/roleModels.dart';

class customRoles {
  //creator
  static Future AddCreatorEmail({required creatorModel CreatorModel}) async {
    //reference to the document
    final docCreator = FirebaseFirestore.instance
        .collection('creatorEmail')
        .doc(CreatorModel.creatorEmail);

    //instance to the document
    final newCreator = creatorModel(creatorEmail: CreatorModel.creatorEmail);

    //converting the instance
    final creatorJson = newCreator.toJson();
    await docCreator.set(creatorJson);
    log('Succressfully added Creator ${CreatorModel.creatorEmail}');
  }

  //user
  static Future AddUserEmail({required userModel UserModel}) async {
    //reference to the document
    final docUser = FirebaseFirestore.instance
        .collection('UserEmail')
        .doc(UserModel.userEmail);

    //instance to the document
    final newUser = userModel(userEmail: UserModel.userEmail);

    //converting the instance
    final userJson = newUser.toJson();
    await docUser.set(userJson);
    log('Succressfully added Creator ${UserModel.userEmail}');
  }
}

// ///user email collection

// Future<List<userModel>> getUserEmail() async {
//   final userModels = FirebaseFirestore.instance
//       .collection('UserEmail')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => userModel.fromJson(doc.data())).toList());

//   return userModels.first;
// }

// //creator email collection
// Future<List<creatorModel>> getCreatorEmail() async {
//   final creatorModels = FirebaseFirestore.instance
//       .collection('creatorEmail')
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => creatorModel.fromJson(doc.data())).toList());

//   return creatorModels.first;
// }
Future<List<String>> setAllDocumentInsideCreators() async {
  List<String> idList = [];
  var collection = FirebaseFirestore.instance.collection('creatorEmail');
  var querySnapshots = await collection.get();
  for (var snapshot in querySnapshots.docs) {
    var documentID = snapshot.id; // <-- Document ID
    log(documentID);

    idList.add(documentID);
  }
  return idList;
}
Future<List<String>> setAllDocumentInsideUsers() async {
  List<String> idList = [];
  var collection = FirebaseFirestore.instance.collection('UserEmail');
  var querySnapshots = await collection.get();
  for (var snapshot in querySnapshots.docs) {
    var documentID = snapshot.id; // <-- Document ID
    log(documentID);

    idList.add(documentID);
  }
  return idList;
}
