import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class cart_list_tile extends StatelessWidget {
  const cart_list_tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 390,
          height: 165,
          decoration: BoxDecoration(
              color: skyBlueLightK, borderRadius: BorderRadius.circular(10)),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            width: 109,
            height: 109,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(userDummyImage),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            width: 109,
            height: 21,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
                child: Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        const Positioned(
          top: 15,
          left: 130,
          child: Text(
            'Girl Portrait -A4 (Pencil Portrait)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Positioned(
          top: 50,
          left: 130,
          child: Text(
            "150 /-",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
