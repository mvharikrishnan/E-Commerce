import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/methods/addMethods.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/widgets/addProductTextFormField.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/appBarCreator.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:flutter/material.dart';

class Add_Product_Screen extends StatelessWidget {
  const Add_Product_Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
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
                      const AddProductTextFormField(),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Add Product Description'),
                      sizedBoxHeight10,
                      const AddProductTextFormField(),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Product Category'),
                      sizedBoxHeight10,
                      const AddProductTextFormField(),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Prize'),
                      sizedBoxHeight10,
                      const AddProductTextFormField(),
                      AddProductFormTitle(Title: 'Product Material'),
                      sizedBoxHeight10,
                      const AddProductTextFormField(),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Product Size'),
                      sizedBoxHeight10,
                      const AddProductTextFormField(),
                      sizedBoxHeight10,
                      AddProductFormTitle(Title: 'Product Medium'),
                      sizedBoxHeight10,
                      const AddProductTextFormField(),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: darkBlueK,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              'Add Product',
                              style: TextStyle(color: KWhite),
                            )),
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
