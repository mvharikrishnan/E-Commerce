import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        detailsWidget(
          RowDetails: 'Material',
          RowTitle: 'Paper',
        ),
        detailsWidget(
          RowDetails: 'Size',
          RowTitle: 'A4',
        ),
        detailsWidget(
          RowDetails: 'Medium',
          RowTitle: 'Graphite',
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
