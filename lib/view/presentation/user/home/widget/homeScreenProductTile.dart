import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenGridTile extends StatelessWidget {
  const HomeScreenGridTile({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigate to product viwing screen
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Product_Viewing_screen(
            ProductImage: productModel.productImage,
            productModel: productModel,
          ),
        ));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: skyBlueLightK,
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productModel.productImage)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          Positioned(
            bottom: 67,
            left: 5,
            child: Text(
              productModel.productName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 50,
            child: Text(
              productModel.category,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 10,
            child: Text(
              "₹${productModel.productPrice}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 5,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
