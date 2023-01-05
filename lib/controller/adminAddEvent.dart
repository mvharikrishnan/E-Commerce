import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerceapp/model/eventModel/eventModel.dart';

Future AddEventToFB({required eventModel modelevent}) async {
  //Reference to the document

  final docCategory =
      FirebaseFirestore.instance.collection('Events').doc(modelevent.eventName);

  //Instance to the document

  final newevent = eventModel(
    eventName: modelevent.eventName,
    eventImageURL: modelevent.eventImageURL,
  );

  //Converting the instance to json

  final newCategoryJson = newevent.toJson();
  log('Before Adding categpry');

  //create document and add to Db

  await docCategory.set(newCategoryJson);
  log('Added to DB');
}
