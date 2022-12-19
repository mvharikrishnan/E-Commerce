import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:ecommerceapp/view/presentation/user/category_screen/widgets/categoryGridTile.dart';
import 'package:ecommerceapp/view/presentation/user/category_viewing_list/category_viewing_List.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';

class ScreenCategoryUser extends StatelessWidget {
  const ScreenCategoryUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                offWhiteK,
              ]),
          color: darkBlueLightK,
          borderRadius: BorderRadius.circular(10)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarUser(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<List<categoryModel>>(
                  stream: fetchCategory(categoryName: 'ProductCategory'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something Went Wrong ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      final categories = snapshot.data!;
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        children: categories.map(BuildCategoryonUser).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget BuildCategoryonUser(categoryModel CategoryModel) =>
    CategoryGridTile(CategoryModel: CategoryModel);
