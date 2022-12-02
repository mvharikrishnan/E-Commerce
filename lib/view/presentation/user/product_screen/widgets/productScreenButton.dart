import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreenButtons extends StatelessWidget {
  const ProductScreenButtons({
    required this.ButtonColor,
    required this.ButtonText,
    Key? key,
  }) : super(key: key);
  final Color ButtonColor;
  final String ButtonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: ButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Center(
          child: Text(
        ButtonText,
        style:const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      )),
    );
  }
}
