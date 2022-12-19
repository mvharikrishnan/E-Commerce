import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/admin/adminCategory/adminCategory.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/adminAppBar.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        appBar: const PreferredSize(
          child: AdminAppBar(),
          preferredSize: Size(double.infinity, 60),
        ),
        backgroundColor: kTransparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                sizedBoxHeight10,
                InkWell(
                  onTap: () {
                    //navigation to category
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminCategory(),
                    ));
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: darkBlueK,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        ConstantNames.category,
                        style: textstyleAdmin(),
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight10,
                InkWell(
                  onTap: () {
                    //navigation to Events
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: darkBlueK,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        ConstantNames.events,
                        style: textstyleAdmin(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textstyleAdmin() {
    return TextStyle(
      color: KWhite,
      fontSize: 30,
      fontFamily: TradeGothic,
    );
  }
}
