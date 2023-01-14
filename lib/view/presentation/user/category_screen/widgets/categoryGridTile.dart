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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        //screen to category viewing list screen
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Category_Viewing_List_Screen(
              CategoryName: CategoryModel.categoryName),
        ));
      },
      child: Container(
        width: 0.166 * size.width,
        height: 0.168 * size.width,
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
              width: 0.25 * size.width,
              height: 0.25 * size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(CategoryModel.categoryImageURL),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
