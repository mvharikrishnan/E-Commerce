import 'package:ecommerceapp/controller/readDataFromFB.dart';
import 'package:ecommerceapp/model/ProductModel/productModel.dart';

class SearchProductClass {
  static Future<List<ProductModel>> productSearch(
      {required String searchValue}) async {
    final allProducts = await FetchProducts(CollectionName: 'CreatorsProducts');
    List<ProductModel> filteredProducts = [];
    final xxxx = allProducts.listen((event) {
      for (ProductModel product in event) {
        if(product.productName.toString().toUpperCase().contains(searchValue.toUpperCase())){
          filteredProducts.add(product);
        }
      }
    });
    return filteredProducts;
  }
}
