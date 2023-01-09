import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';

class SearchProductClass {
  static Future<List<ProductModel>> productSearch(
      {required String searchValue}) async {
    final allProducts = FetchProducts(CollectionName: 'CreatorsProducts');
    List<ProductModel> filteredProducts = [];
    allProducts.listen((event) {
      for (ProductModel product in event) {
        if (product.productName
            .toString()
            .toUpperCase()
            .startsWith(searchValue.toUpperCase())) {
          filteredProducts.add(product);
        }
      }
    });
    return filteredProducts;
  }

  static Future<List<ProductModel>> intialProductList() async {
    final allProducts = await FetchProducts(CollectionName: 'CreatorsProducts');
    List<ProductModel> initalProductList = [];
    allProducts.listen((event) {
      for (ProductModel product in event) {
        initalProductList.add(product);
      }
    });
    return initalProductList;
  }
}
