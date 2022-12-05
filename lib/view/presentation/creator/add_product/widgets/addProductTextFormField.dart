import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductTextFormField extends StatelessWidget {
  const AddProductTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
