import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/user/category_viewing_list/widgets/category_tile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';

class Category_Viewing_List_Screen extends StatelessWidget {
  const Category_Viewing_List_Screen({
    required this.CategoryName,
    super.key,
  });
  final String CategoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUser(context),
      body: Column(
        children: [
          sizedBoxHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CategoryName,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: TradeGothic),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => const category_tile(),
                separatorBuilder: (context, index) => sizedBoxHeight10,
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
