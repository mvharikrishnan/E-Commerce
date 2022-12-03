import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class User_Address_Manage_Screen extends StatelessWidget {
  const User_Address_Manage_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUser(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            sizedBoxHeight10,
            DividerEcommerce(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add New Address',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            sizedBoxHeight10,
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 3,
                  color: Colors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Harikrishnan MV',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      'Marath 944Haripriya',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      'Puthenvelikara P.O',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      'Paravur,Kerala,683594',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      'India',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      'Phone: 9447991094',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxHeight10,
                    Row(
                      children: [
                        Container(
                          width: 86,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            'Edit',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                        ),
                        sizedBox10,
                        Container(
                          width: 86,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            'Remove',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
