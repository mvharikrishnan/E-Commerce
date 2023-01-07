import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/eventModel/eventModel.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/widgets/framework.dart';

class EventTIle extends StatelessWidget {
  const EventTIle({required this.ModelEvent, super.key});
  final eventModel ModelEvent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        height: size.width,
        child: Column(
          children: [
            Container(
              height: 0.4 * size.width,
              width: size.width,
              decoration: BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ModelEvent.eventImageURL),
                ),
              ),
            ),
            sizedBoxHeight10,
            Container(
              height: 40,
              width: size.width,
              decoration: BoxDecoration(color: KWhite,borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text(ModelEvent.eventName)),
            ),
          ],
        ),
      ),
    );
  }
}
