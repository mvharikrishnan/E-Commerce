import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/orderModel/orderModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future newOrder({required OrderModel orderModel}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

  //reference to the document
  final docOrderRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('Orders')
      .doc(orderModel.productName);

  //Instance to the OrderModel with data
  final orderProductInstance = OrderModel(
      cartPrice: orderModel.cartPrice,
      productDescription: orderModel.productDescription,
      category: orderModel.category,
      productMaterial: orderModel.productMaterial,
      productPrice: orderModel.productPrice,
      productSize: orderModel.productSize,
      productMedium: orderModel.productMedium,
      productImage: orderModel.productImage,
      productName: orderModel.productName,
      id: orderModel.id,
      isDeliverd: orderModel.isDeliverd,
      isCancelled: orderModel.isCancelled,
      orderQuantity: orderModel.orderQuantity);

  //converting the instance to Json
  final orderProductJson = orderProductInstance.toJson();

  //adding the Json to Firebase
  docOrderRef.set(orderProductJson);
}
