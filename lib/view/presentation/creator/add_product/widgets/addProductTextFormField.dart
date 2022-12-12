import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductTextFormField extends StatelessWidget {
  const AddProductTextFormField({
    required this.controller,
    this.MaxLine,
    Key? key,
  }) : super(key: key);
  final int? MaxLine;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: MaxLine ?? 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
