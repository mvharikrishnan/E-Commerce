import 'dart:developer';

import 'package:ecommerceapp/controller/creatorAddProduct.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/methods/addMethods.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/widgets/addProductTextFormField.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/appBarCreator.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:flutter/material.dart';

class Add_Product_Screen extends StatelessWidget {
  const Add_Product_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productDescriptionController =
        TextEditingController();
    final TextEditingController productCategoryController =
        TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    final TextEditingController productMaterialController =
        TextEditingController();
    final TextEditingController productSizeController = TextEditingController();
    final TextEditingController productMediumController =
        TextEditingController();
    return Container(
      decoration: backGroundColor(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                appBarCreator(context),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Products',
                        style: HeadingTextStyle(),
                      ),
                      sizedBoxHeight10,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 227,
                                width: 221,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 192, 191, 191)),
                                child: iconImageAdd(),
                              ),
                              sizedBox10,
                              Column(
                                children: [
                                  Container(
                                    height: 104,
                                    width: 115,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 192, 191, 191)),
                                    child: iconImageAdd(),
                                  ),
                                  sizedBoxHeight10,
                                  Container(
                                    height: 104,
                                    width: 115,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 192, 191, 191)),
                                    child: iconImageAdd(),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Add Product Name'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        controller: productNameController,
                      ),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Add Product Description'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        MaxLine: 5,
                        controller: productDescriptionController,
                      ),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Product Category'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        controller: productCategoryController,
                      ),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Prize'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        controller: productPriceController,
                      ),
                      AddProductFormTitle(Title: 'Product Material'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        controller: productMaterialController,
                      ),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Product Size'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        controller: productSizeController,
                      ),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Product Medium'),
                      sizedBoxHeight10,
                      AddProductTextFormField(
                        controller: productMediumController,
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //add product to firebase function here
                              final newProduct = ProductModel(
                                productName: productNameController.text.trim(),
                                productDescription:
                                    productDescriptionController.text.trim(),
                                category: productCategoryController.text.trim(),
                                productPrice:
                                    productPriceController.text.trim(),
                                productMaterial:
                                    productMaterialController.text.trim(),
                                productMedium:
                                    productMediumController.text.trim(),
                                productSize: productSizeController.text.trim(),
                              );
                              log('Before Method');
                              AddProductToFB(productModel: newProduct);
                              log('After Method');
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: darkBlueK,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                '  Add Product  ',
                                style: TextStyle(color: KWhite),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
