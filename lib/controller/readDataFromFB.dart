import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';

Stream<List<ProductModel>> FetchProducts({required String CollectionName}) =>
    FirebaseFirestore.instance.collection(CollectionName).snapshots().map(
        (snapShot) => snapShot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());

Stream<List<categoryModel>> fetchCategory({required String categoryName}) => FirebaseFirestore.instance
    .collection(categoryName)
    .snapshots()
    .map((snapshots) => snapshots.docs
        .map((doc) => categoryModel.fromJson(doc.data()))
        .toList());
