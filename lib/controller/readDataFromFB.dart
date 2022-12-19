import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Products Session
Stream<List<ProductModel>> FetchProducts({required String CollectionName}) =>
    FirebaseFirestore.instance.collection(CollectionName).snapshots().map(
        (snapShot) => snapShot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());

//Category Session
Stream<List<categoryModel>> fetchCategory({required String categoryName}) =>
    FirebaseFirestore.instance.collection(categoryName).snapshots().map(
        (snapshots) => snapshots.docs
            .map((doc) => categoryModel.fromJson(doc.data()))
            .toList());

//Cart Session

Stream<List<ProductModel>> fetchCartProducts(String userEmail) => FirebaseFirestore.instance
    .collection('Users')
    .doc(userEmail)
    .collection('Carts')
    .snapshots()
    .map((snapshots) => snapshots.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList());
