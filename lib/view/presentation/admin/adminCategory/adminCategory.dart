import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:ecommerceapp/view/presentation/admin/adminCategory/addCategory.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/adminAppBar.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/categoryTile.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminCategory extends StatelessWidget {
  const AdminCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundColor(),
      child: Scaffold(
        backgroundColor: kTransparent,
        appBar: PreferredSize(
            child: AdminAppBar(
              isVisible: false,
              TitleText: ConstantNames.category,
            ),
            preferredSize: const Size(double.infinity, 60)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<List<categoryModel>>(
                  stream: fetchCategory(categoryName: 'ProductCategory'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something Went Wrong ${snapshot.error}');
                    }

                    if (snapshot.hasData) {
                      final categories = snapshot.data!;
                      return ListView(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        children: categories.map(BuildCategory).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Button for adding category
            showPopUpFORM(context);
          },
          backgroundColor: darkBlueK,
          child: const Icon(Icons.add_circle),
        ),
      ),
    );
  }

  showPopUpFORM(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const AddCategory(),
    );
  }
}

Widget BuildCategory(categoryModel CategoryModel) =>
    CategoryTile(CategoryModel: CategoryModel);
