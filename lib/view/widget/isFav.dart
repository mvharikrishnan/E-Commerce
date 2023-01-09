// import 'package:ecommerceapp/controller/readDataFromFB.dart';
// import 'package:ecommerceapp/model/ProductModel/productModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class isFavorite extends StatelessWidget {
//   const isFavorite({
//     Key? key,
//     required this.email,
//     required this.productModel,
//   }) : super(key: key);

//   final String? email;
//   final ProductModel productModel;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 10,
//       bottom: 5,
//       child: StreamBuilder<List<ProductModel>>(
//           stream: fetchWishListProducts(email!),
//           //streamBUilder for wishlist collection
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text("🚫");
//             }
//             if (snapshot.hasData) {
//               final wishListProducts = snapshot.data!;
//               List<String> ProductNames = [];
//               for (ProductModel product in wishListProducts) {
//                 ProductNames.add(product.productName);
//               }
//               bool isFav = ProductNames.where(
//                       (product) => product == productModel.productName)
//                   .isEmpty;
//               return isFav
//                   ? IconButton(
//                       onPressed: () {
//                         //add product to wish list
//                       },
//                       icon: const Icon(
//                         Icons.favorite,
//                         size: 30,
//                         color: Colors.red,
//                       ),
//                     )
//                   : IconButton(
//                       onPressed: () {
//                         //add product to wish list
//                       },
//                       icon: const Icon(
//                         Icons.favorite_border_sharp,
//                         size: 30,
//                         color: Colors.red,
//                       ),
//                     );
//             } else {
//               return Text("⁉️");
//             }
//           }),
//     );
//   }
// }
