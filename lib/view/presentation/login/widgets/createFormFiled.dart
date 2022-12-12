import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class createFormField extends StatelessWidget {
  const createFormField({
    this.validate,
    required this.obscureText,
    required this.TexteditingController,
    Key? key,
  }) : super(key: key);
  final bool obscureText;
  final TextEditingController TexteditingController;
  final String? Function(String? text)? validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TexteditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText:obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction ,
      validator: validate,
    );
  }
}
