import 'package:flutter/material.dart';

class ProductScreenButtons extends StatelessWidget {
  const ProductScreenButtons({
    required this.ButtonColor,
    required this.ButtonText,
    required this.Onpressed,
    required this.ctx,
    Key? key,
  }) : super(key: key);
  final Color ButtonColor;
  final String ButtonText;
  final Function() Onpressed;
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  Onpressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: ButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          ButtonText,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
