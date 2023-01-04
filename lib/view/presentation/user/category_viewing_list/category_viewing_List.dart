import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/core/constants/appConstants.dart';
import 'package:ecommerceapp/core/constants/user/constants.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';
import 'package:ecommerceapp/view/presentation/user/category_viewing_list/widgets/category_tile.dart';
import 'package:ecommerceapp/view/presentation/user/widget/appBarUser.dart';
import 'package:flutter/material.dart';

class Category_Viewing_List_Screen extends StatelessWidget {
  const Category_Viewing_List_Screen({
    required this.CategoryName,
    super.key,
  });
  final String CategoryName;
  @override
  Widget build(BuildContext context) {
    List<ProductModel> categoryFilteredProducts = [];
    return Scaffold(
      appBar: appBarUser(context),
      body: Column(
        children: [
          sizedBoxHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CategoryName,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: TradeGothic),
              )
            ],
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<List<ProductModel>>(
                  stream: FetchProducts(CollectionName: 'CreatorsProducts'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Some Error Occurs'),
                      );
                    }
                    if (snapshot.hasData) {
                      final fetchedProducts = snapshot.data!;
                      categoryFilteredProducts = filteringCategoryProducts(
                          fetchedProducts, CategoryName);
                      return ListView(
                        children: categoryFilteredProducts
                            .map(BuildCategoryList)
                            .toList(),
                      );
                    } else {
                      return const Center(
                        child: Text('No Products Found'),
                      );
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}

Widget BuildCategoryList(ProductModel productModel) => category_tile(
      productModel: productModel,
    );

//filtering products
List<ProductModel> filteringCategoryProducts(
    List<ProductModel> productModel, String categoryName) {
  List<ProductModel> result = [];
  for (var product in productModel) {
    if (product.category == categoryName) {
      result.add(product);
    }
  }
  return result;
}
