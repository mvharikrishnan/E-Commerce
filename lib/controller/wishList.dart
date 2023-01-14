import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addToWishList({required ProductModel productModel}) async {
  final email = FirebaseAuth.instance.currentUser!.email;
  final id = DateTime.now().microsecondsSinceEpoch;
  //reference to the document
  final documentProduct = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('WishList')
      .doc(productModel.productName);

  //Instance of the product model with data
  final newWishListProduct = ProductModel(
    productName: productModel.productName,
    productDescription: productModel.productDescription,
    category: productModel.category,
    productPrice: productModel.productPrice,
    productMaterial: productModel.productMaterial,
    productMedium: productModel.productMedium,
    productSize: productModel.productSize,
    productImage: productModel.productImage,
    creatorEmail: productModel.creatorEmail,
    productID: id.toString(),
  );

  //convert the instance to JSON format
  final newProductWishlistJSON = newWishListProduct.toJson();

  //add the JSON to FireBase
  await documentProduct.set(newProductWishlistJSON);
}

removeFromWishList({required String productID}) {
  //Current User
  final email = FirebaseAuth.instance.currentUser!.email;

  //reference to the document
  final docProduct = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('WishList')
      .doc(productID);

  docProduct.delete();
}
