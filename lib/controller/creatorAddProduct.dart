import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:flutter/material.dart';

Future AddProductToFB({
  required ProductModel productModel,
}) async {
  //Reference To to the document
  final docCreator = FirebaseFirestore.instance
      .collection('CreatorsProducts')
      .doc(productModel.productName);

  final addOnCreator = FirebaseFirestore.instance
      .collection('creatorEmail')
      .doc(productModel.creatorEmail)
      .collection("creatorProducts")
      .doc(productModel.productName);

  //Instance to the document
  final newProduct = ProductModel(
    productName: productModel.productName,
    productDescription: productModel.productDescription,
    category: productModel.category,
    productPrice: productModel.productPrice,
    productMaterial: productModel.productMaterial,
    productMedium: productModel.productMedium,
    productSize: productModel.productSize,
    productImage: productModel.productImage,
    creatorEmail: productModel.creatorEmail,
  );

  //converting the Instance to json Format
  final newProductJson = newProduct.toJson();
  log('Before Adding');
  //create the document and write the data to firebase
  await docCreator.set(newProductJson);
  await addOnCreator.set(newProductJson);
  log('After Adding');
  // SnackBar(
  //   content: Text("${productModel.productName} Created"),
  //   backgroundColor: kGreen,
  // );
}

removeProductFromFireBase({required ProductModel productModel}) async {
  //reference to the document
  final docCreator = FirebaseFirestore.instance
      .collection('CreatorsProducts')
      .doc(productModel.productName);

  //delete data from firebase
  await docCreator.delete();
  log('After Adding');
}
