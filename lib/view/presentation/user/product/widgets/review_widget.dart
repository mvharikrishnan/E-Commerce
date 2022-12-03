import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Review_Screen extends StatelessWidget {
  const Review_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          'Reviews About Creator',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        sizedBoxHeight10,
        ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage('https://i.imgur.com/JFHjdNr.jpg'),
                          ),
                          Text('5⭐')
                        ],
                      ),
                    ),
                    const Text(
                      'Beautiful colors and concept. Objectively speaking, however, there is an awkward and amateurish quality to the hand and arm, and the bell of the windlbown skirt appears to be an afterthought or an attempt to incorporate a misstroke.',
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => sizedBoxHeight10,
          itemCount: 3,
        ),
      ],
    );
  }
}
