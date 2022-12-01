import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class category_tile extends StatelessWidget {
  const category_tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                8.0, // horizontal, move right 10
                2.0, // vertical, move down 10
              ),
            )
          ], borderRadius: BorderRadius.circular(10), color: skyBlueLightK),
        ),
        Positioned(
          left: 15,
          top: 15,
          child: Container(
            width: 109,
            height: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(userDummyImage),
              ),
            ),
          ),
        ),
        Positioned(
          left: 140,
          top: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Girl Portrait - A4(Pencil Portrait)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: TradeGothic),
              ),
              sizedBoxHeight10,
              const Text(
                "150/-",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight10,
              const Text('Portrait')
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
              )),
        ),
        Positioned(
          right: 0,
          top: 6,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
              size: 29,
            ),
          ),
        ),
      ],
    );
  }
}
