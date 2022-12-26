import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/addressModel/addressModel.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/createNewAddress.dart';
import 'package:ecommerceapp/view/presentation/user/user_address/widgets/userAddressTile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:ecommerceapp/view/widget/divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class User_Address_Manage_Screen extends StatelessWidget {
  const User_Address_Manage_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
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
                    onPressed: () {
                      //navigatate to add new Address screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateNewAddressScreen(),
                      ));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            sizedBoxHeight10,
            Expanded(
                child: StreamBuilder<List<AddressModel>>(
              stream: fetchUserAddress(email!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something Went Wrong ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  final userAddress = snapshot.data!;
                  return ListView(
                    children: userAddress.map(BuildUserAddress).toList(),
                  );
                } else {
                  return Center(
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(color: kTransparent),
                      child: Lottie.network(
                        'https://assets10.lottiefiles.com/private_files/lf30_oqpbtola.json',
                        animate: true,
                      ),
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}

Widget BuildUserAddress(AddressModel addressModel) =>
    UserAddressTile(addressModel: addressModel);
