import 'dart:developer';

import 'package:ecommerceapp/controller/adminAddCategory.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';
import 'package:ecommerceapp/view/presentation/admin/widgets/addCategoryFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController categoryNameController =
        TextEditingController();
    return AlertDialog(
      scrollable: true,
      backgroundColor: darkBlueK,
      contentPadding: EdgeInsets.all(2),
      content: Stack(
        children: <Widget>[
          Positioned(
            right: 5.0,
            top: 5.0,
            child: InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.close,
                  size: 20,
                ),
                backgroundColor: KWhite,
              ),
            ),
          ),
          Container(
            height: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ADD CATEGORY',
                      style: TextStyle(
                          color: KWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                sizedBoxHeight10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: AddCategoryFormField(
                                  controller: categoryNameController,
                                  labelText: ConstantNames.categoryName,
                                  validator: (value) {
                                    //validator
                                    if (value!.isEmpty) {
                                      return ConstantNames.pleaseEnterErrorText;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              sizedBoxHeight10,
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(KWhite)),
                      onPressed: () async {
                        //submit form
                        final newCategory = categoryModel(
                            categoryName: categoryNameController.text.trim());
                        log('Before Adding');
                        await AddCategoryToFB(CategoryModel: newCategory);
                        log('Added done');

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            '${categoryNameController.text} Successfully Added',
                            style: TextStyle(color: KWhite),
                          ),
                          backgroundColor: kGreen,
                        ));
                        Navigator.pop(context);
                      },
                      child: Text(
                        ConstantNames.submit,
                        style: TextStyle(
                          color: darkBlueK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
