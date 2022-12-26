import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textformFieldWidget extends StatelessWidget {
  const textformFieldWidget({
    required this.controller,
    this.MaxLine,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.maxLength,
    Key? key,
  }) : super(key: key);
  final int? MaxLine;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;

  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          controller: controller,
          maxLines: MaxLine ?? 1,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          validator: validator,
        ),
        sizedBoxHeight10,
      ],
    );
  }
}
