import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:ecommerceapp/view/presentation/user/category_viewing_list/category_viewing_List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryGridTile extends StatelessWidget {
  CategoryGridTile({
    required this.CategoryModel,
    Key? key,
  }) : super(key: key);

  final categoryModel CategoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //screen to category viewing list screen
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Category_Viewing_List_Screen(
              CategoryName: CategoryModel.categoryName),
        ));
      },
      child: Container(
        width: 166,
        height: 168,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [skyBlueLightK, skyBlueLightK]),
          borderRadius: BorderRadius.circular(10),
          color: skyBlueLightK,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              CategoryModel.categoryName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 88,
              height: 79,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(userDummyImage),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
