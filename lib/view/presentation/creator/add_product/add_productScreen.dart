import 'dart:developer';
import 'dart:io';

import 'package:ecommerceapp/controller/creatorAddProduct.dart';
import 'package:ecommerceapp/controller/fireBase_api.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/methods/addMethods.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/widgets/addCategoryDropDown.dart';
import 'package:ecommerceapp/view/presentation/creator/add_product/widgets/addProductTextFormField.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/appBarCreator.dart';
import 'package:ecommerceapp/view/presentation/creator/widgets/back_ground_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Add_Product_Screen extends StatefulWidget {
  const Add_Product_Screen({super.key});

  @override
  State<Add_Product_Screen> createState() => _Add_Product_ScreenState();
}

class _Add_Product_ScreenState extends State<Add_Product_Screen> {
  File? ImageFile1;
  // File? ImageFile2;
  // File? ImageFile3;
  String? category;

  void _callbackFuntion(String data) {
    category = data;
    log("log from callback $category");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productDescriptionController =
        TextEditingController();

    final TextEditingController productPriceController =
        TextEditingController();
    final TextEditingController productMaterialController =
        TextEditingController();
    final TextEditingController productSizeController = TextEditingController();
    final TextEditingController productMediumController =
        TextEditingController();
    final user = FirebaseAuth.instance.currentUser!;
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
                              GestureDetector(
                                onTap: () => selectFile(),
                                child: Container(
                                  height: 227,
                                  width: 221,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 192, 191, 191),
                                    image: (ImageFile1 != null)
                                        ? DecorationImage(
                                            image: FileImage(
                                                File(ImageFile1!.path)))
                                        : null,
                                  ),
                                  child: iconImageAdd(),
                                ),
                              ),
                              sizedBox10,
                              // Column(
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {},
                              //       child: Container(
                              //         height: 104,
                              //         width: 115,
                              //         decoration: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(10),
                              //             color: Color.fromARGB(
                              //                 255, 192, 191, 191)),
                              //         child: iconImageAdd(),
                              //       ),
                              //     ),
                              //     sizedBoxHeight10,
                              //     Container(
                              //       height: 104,
                              //       width: 115,
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(10),
                              //           color:
                              //               Color.fromARGB(255, 192, 191, 191)),
                              //       child: iconImageAdd(),
                              //     ),
                              //   ],
                              // )
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
                      AddCategoryDropDownTile(callback: _callbackFuntion),
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
                            onTap: () async {
                              //add product to firebase function here
                              log(category.toString());
                              final String FinalImageURL = await uploadFile();
                              log('Download Image URl : $FinalImageURL');
                              final newProduct = ProductModel(
                                productName: productNameController.text.trim(),
                                productDescription:
                                    productDescriptionController.text.trim(),
                                category: category ?? 'Others',
                                productPrice:
                                    productPriceController.text.trim(),
                                productMaterial:
                                    productMaterialController.text.trim(),
                                productMedium:
                                    productMediumController.text.trim(),
                                productSize: productSizeController.text.trim(),
                                productImage: FinalImageURL.toString(),
                                creatorEmail: user.email!,
                              );
                              log('Before Method');

                              await AddProductToFB(
                                productModel: newProduct,
                              );
                              log('After Method');

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  '${productNameController.text} Successfully Added',
                                  style: TextStyle(color: KWhite),
                                ),
                                backgroundColor: kGreen,
                              ));
                              Navigator.pop(context);
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

  //files adding
  Future selectFile() async {
    log('Select method called');
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      ImageFile1 = File(path);
    });
    log(ImageFile1!.path);
  }

  //For uploading flie
  Future uploadFile() async {
    log('uploadFile method called');
    if (ImageFile1 == null) return;
    final fileName = ImageFile1!.path;

    final destination = 'files/$fileName';

    final ImageURL = await FireBaseApi.uploadFile(destination, ImageFile1!);
    log('Download Link of image: $ImageURL');
    return ImageURL;
  }
}
