import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';

Stream<List<ProductModel>> FetchProducts({required String CollectionName}) =>
    FirebaseFirestore.instance.collection('CreatorsProducts').snapshots().map(
        (snapShot) => snapShot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList());
