import 'package:ecommerceapp/core/constants/user/constants.dart';

import 'package:flutter/material.dart';

class settingTile extends StatelessWidget {
  const settingTile({
    required this.onPressed,
    required this.settingTitleName,
    Key? key,
  }) : super(key: key);
  final String settingTitleName;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 380,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: const Color(0xFF9A9797)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            Text(
              settingTitleName,
              style: const TextStyle(fontSize: 20),
            ),
            sizedBox10,
            IconButton(
                onPressed: () => onPressed,
                //Navigator to the page in new s
                icon: const Icon(
                  Icons.navigate_next,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
