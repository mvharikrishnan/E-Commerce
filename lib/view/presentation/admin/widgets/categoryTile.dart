import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryTile extends StatelessWidget {
   CategoryTile({
    required this.CategoryModel,
    super.key});
  final categoryModel CategoryModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        tileColor: darkBlueK,
        title: Text(
         CategoryModel.categoryName,
          style: TextStyle(color: KWhite),
        ),
        trailing: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: kGreen,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: KRed,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
