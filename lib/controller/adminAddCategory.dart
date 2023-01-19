import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';

Future AddCategoryToFB({required categoryModel CategoryModel}) async {
  //Reference to the document

  final docCategory = FirebaseFirestore.instance
      .collection('ProductCategory')
      .doc(CategoryModel.categoryName);

  //Instance to the document

  final newCategory = categoryModel(
    categoryName: CategoryModel.categoryName,
    categoryImageURL: CategoryModel.categoryImageURL,
  );

  //Converting the instance to json

  final newCategoryJson = newCategory.toJson();
  log('Before Adding categpry');

  //create document and add to Db

  await docCategory.set(newCategoryJson);
  log('Added to DB');
}

Future EditEvent({required categoryModel model})async{
//Reference to the document

  final docCategory = FirebaseFirestore.instance
      .collection('ProductCategory')
      .doc(model.categoryName);

  //Instance to the document

  final newCategory = categoryModel(
    categoryName: model.categoryName,
    categoryImageURL: model.categoryImageURL,
  );

  //Converting the instance to json

  final newCategoryJson = newCategory.toJson();
  log('Before Adding categpry');
  await docCategory.update(newCategoryJson);
}