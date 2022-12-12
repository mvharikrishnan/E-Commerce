class ProductModel {
  String productName;
  final String productDescription;
  final String category;
  final String productMaterial;
  final String productPrice;
  final String productSize;
  final String productMedium;

  ProductModel(
      {required this.productName,
      required this.productDescription,
      required this.category,
      required this.productPrice,
      required this.productMaterial,
      required this.productMedium,
      required this.productSize});

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productDescription': productDescription,
        'productCategory': category,
        'productMaterial': productMaterial,
        'productPrice': productPrice,
        'productSize': productSize,
        'productMedium': productMedium,
      };
}
