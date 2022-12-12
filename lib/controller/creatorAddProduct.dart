import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:flutter/material.dart';

Future AddProductToFB({required ProductModel productModel}) async {
  //Reference To to the document
  final docCreator = FirebaseFirestore.instance
      .collection('CreatorsProducts')
      .doc('creatorName');

  //Instance to the document
  final newProduct = ProductModel(
    productName: productModel.productName,
    productDescription: productModel.productDescription,
    category: productModel.category,
    productPrice: productModel.productPrice,
    productMaterial: productModel.productMaterial,
    productMedium: productModel.productMedium,
    productSize: productModel.productSize,
  );

  //converting the Instance to json Format
  final newProductJson = newProduct.toJson();
  log('Before Adding');
  //create the document and write the data to firebase
  await docCreator.set(newProductJson);
  log('After Adding');
  SnackBar(
    content: Text("${productModel.productName} Created"),
    backgroundColor: kGreen,
  );
}
