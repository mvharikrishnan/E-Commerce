import 'package:flutter/cupertino.dart';

class account_edit_button extends StatelessWidget {
  const account_edit_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 103,
        height: 23,
        child: Center(child: const Text('Edit',style: TextStyle(fontWeight: FontWeight.bold),)),
        decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}