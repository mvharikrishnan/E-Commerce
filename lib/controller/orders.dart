import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
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
      orderQuantity: orderModel.orderQuantity,);

  //converting the instance to Json
  final orderProductJson = orderProductInstance.toJson();

  //adding the Json to Firebase
  docOrderRef.set(orderProductJson);
}

removeAfterSuccess({required List<ProductModel> ordeers}) {
  final email = FirebaseAuth.instance.currentUser!.email;

  for (var product in ordeers) {
    final docCart = FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection('Carts')
        .doc(product.productName);

    //Delete Product
    docCart.delete();
  }

  //Creator   order accept
}

Future creatorOrderConfirmation({required OrderModel order}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

  //instance to the document
  final docOrderConfirmation = FirebaseFirestore.instance
    .collection('Users').doc(email).collection('Orders').doc(order.productName);

  //instance to the edited order
  final orderStatus = OrderModel(
      cartPrice: order.cartPrice,
      productDescription: order.productDescription,
      category: order.category,
      productMaterial: order.productMaterial,
      productPrice: order.productPrice,
      productSize: order.productSize,
      productMedium: order.productMedium,
      productImage: order.productImage,
      productName: order.productName,
      id: order.id,
      isDeliverd: order.isDeliverd,
      isCancelled: order.isCancelled,
      orderQuantity: order.orderQuantity,
      );

  //convert the instance to JSON
  final orderStatusJSON = orderStatus.toJson();

  //update the order
  await docOrderConfirmation.update(orderStatusJSON);
}
