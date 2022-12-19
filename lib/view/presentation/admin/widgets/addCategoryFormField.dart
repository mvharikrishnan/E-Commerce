import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategoryFormField extends StatelessWidget {
  const AddCategoryFormField({
    required this.validator,
    required this.labelText,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: KWhite,
        filled: true,
        labelText: labelText,
      ),
    );
  }
}
