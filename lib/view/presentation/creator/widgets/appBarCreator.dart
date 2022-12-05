import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/material.dart';

 appBarCreator(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(CreatrDummyImage),
          ),
          sizedBox10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Art and Craft',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Bussiness',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )
            ],
          ),
        ],
      ),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.wrap_text_rounded,
            size: 30,
          ))
    ],
  );
}
