import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/cupertino.dart';

class SlidingBarItem extends StatelessWidget {
  const SlidingBarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/drawingImage/drawing1.jpeg')),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ],
            );
          },
          separatorBuilder: (context, index) => sizedBox10,
        ),
      ),
    );
  }
}
