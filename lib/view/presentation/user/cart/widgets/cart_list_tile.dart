import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:flutter/material.dart';

class cart_list_tile extends StatelessWidget {
  const cart_list_tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // margin:const EdgeInsets.all(100.0),
          width: 390,
          height: 165,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [skyBlueLightK, darkBlueLightK]),
              color: darkBlueLightK,
              borderRadius: BorderRadius.circular(10)),
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
                child: Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 150,
          child: Container(
            width: 109,
            height: 21,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
                child: Text(
              'Save for later',
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
        const Positioned(
          left: 130,
          top: 100,
          child: Text('Sold by : Aneesh ArtWorks'),
        ),
      ],
    );
  }
}
