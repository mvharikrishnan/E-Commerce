import 'dart:developer';

import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/colors/colors.dart';
import 'package:ecommerceapp/model/categoryModel/catergoryMode.dart';

import 'package:flutter/material.dart';

class AddCategoryDropDownTile extends StatelessWidget {
  const AddCategoryDropDownTile({required this.callback, super.key});
  final void Function(String) callback;
  @override
  Widget build(BuildContext context) {
    String? selectedItem;
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(),
      child: StreamBuilder<List<categoryModel>>(
        stream: fetchCategory(categoryName: 'ProductCategory'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Somthing Went Wrong'),
            );
          }
          if (snapshot.hasData) {
            final categoryItems = snapshot.data!;

            if (categoryItems.isEmpty) {
              return const Center(
                child: Text('List is empty'),
              );
            }
            return StatefulBuilder(builder: (context, setState) {
              return DropdownButton<String>(
                value: selectedItem,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(15),
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue!;
                    callback(selectedItem!);
                    log(selectedItem.toString());
                  });
                },
                hint: Text(
                  'Select Item',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isExpanded: true,
                items: categoryItems.map((value) {
                  return DropdownMenuItem<String>(
                    value: value.categoryName,
                    child: Text(value.categoryName),
                  );
                }).toList(),
              );
            });
          } else {
            return const Center(
              child: Text('Please add cateogory'),
            );
          }
        },
      ),
    );
  }
}
