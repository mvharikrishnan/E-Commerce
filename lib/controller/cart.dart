import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Email ID of Current User

Future addToCart({required ProductModel productModel}) async {
  final email = FirebaseAuth.instance.currentUser!.email;
//refernce to the document
  final documentProduct = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('Carts')
      .doc(productModel.productName);

  //Instance of the ProductMOdel with data
  final newProductToCart = ProductModel(
    productName: productModel.productName,
    productDescription: productModel.productDescription,
    category: productModel.category,
    productPrice: productModel.productPrice,
    productMaterial: productModel.productMaterial,
    productMedium: productModel.productMedium,
    productSize: productModel.productSize,
    productImage: productModel.productImage,
    creatorEmail: productModel.creatorEmail
  );

  //convert the instance to JSON format
  final newProductToCartJSON = newProductToCart.toJson();

  //add the the json to firebase
  await documentProduct.set(newProductToCartJSON);
}

deleteFromCart({required String ProductID}) {
  final email = FirebaseAuth.instance.currentUser!.email;
  //reference to the document
  final docCart = FirebaseFirestore.instance
      .collection('Users')
      .doc(email)
      .collection('Carts')
      .doc(ProductID);

  //Delete Product
  docCart.delete();
}
