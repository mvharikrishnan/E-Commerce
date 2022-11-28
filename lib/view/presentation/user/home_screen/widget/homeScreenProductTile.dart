import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreenGridTile extends StatelessWidget {
  const HomeScreenGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 123,
          height: 182,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: skyBlueLightK,
          ),
        ),
      ],
    );
  }
}
