import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';

class OrderModel {
  final double cartPrice;
  final String productDescription;
  final String category;
  final String productMaterial;
  final String productPrice;
  final String productSize;
  final String productMedium;
  final String productImage;
  final String productName;
  final String id;
  final bool isDeliverd;
  final bool isCancelled;
  final int orderQuantity;
  final String userEmail;
  final String creatorEmail;

  OrderModel({
    required this.cartPrice,
    required this.productDescription,
    required this.category,
    required this.productMaterial,
    required this.productPrice,
    required this.productSize,
    required this.productMedium,
    required this.productImage,
    required this.productName,
    required this.id,
    required this.isDeliverd,
    required this.isCancelled,
    required this.orderQuantity,
    required this.userEmail,
    required this.creatorEmail,
  });

  //to JSON
  Map<String, dynamic> toJson() => {
        'cartPrice': cartPrice,
        'productDescription': productDescription,
        'category': category,
        'productMaterial': productMaterial,
        'productPrice': productPrice,
        'productSize': productSize,
        'productMedium': productMedium,
        'productImage': productImage,
        'productName': productName,
        'id': id,
        'isDeliverd': isDeliverd,
        'isCancelled': isCancelled,
        'orderQuantity': orderQuantity,
        'userEmail': userEmail,
        'creatorEmail': creatorEmail,
      };

  //fromJSON
  static OrderModel fromJSON(Map<String, dynamic> json) => OrderModel(
        cartPrice: json['cartPrice'],
        productDescription: json['productDescription'],
        category: json['category'],
        productMaterial: json['productMaterial'],
        productPrice: json['productPrice'],
        productSize: json['productSize'],
        productMedium: json['productMedium'],
        productImage: json['productImage'],
        productName: json['productName'],
        id: json['id'],
        isDeliverd: json['isDeliverd'],
        isCancelled: json['isCancelled'],
        orderQuantity: json['orderQuantity'],
        userEmail: json['userEmail'],
        creatorEmail: json['creatorEmail'],
      );
}
