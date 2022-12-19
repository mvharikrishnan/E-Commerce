import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/view/presentation/admin/adminCategory/addCategory.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/adminAppBar.dart';
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
              TitleText: ConstantNames.category,
            ),
            preferredSize: const Size(double.infinity, 60)),
        body: SafeArea(
          child: Column(
            children: [Text('Admin Category')],
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
