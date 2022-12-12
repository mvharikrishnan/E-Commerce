import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:flutter/material.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({required this.productModel, super.key});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        detailsWidget(
          RowDetails: 'Material',
          RowTitle: "${productModel.productMaterial}",
        ),
        detailsWidget(
          RowDetails: 'Size',
          RowTitle: '${productModel.productSize}',
        ),
        detailsWidget(
          RowDetails: 'Medium',
          RowTitle: '${productModel.productMedium}',
        ),
      ],
    );
  }
}

class detailsWidget extends StatelessWidget {
  const detailsWidget({
    required this.RowDetails,
    required this.RowTitle,
    Key? key,
  }) : super(key: key);
  final String RowTitle;
  final String RowDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            RowDetails,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            RowTitle,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
