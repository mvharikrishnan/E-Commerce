class ProductModel {
  String productName;
  final String productDescription;
  final String category;
  final String productMaterial;
  final String productPrice;
  final String productSize;
  final String productMedium;
  final String productImage;
  final String creatorEmail;

  ProductModel({
    required this.productName,
    required this.productDescription,
    required this.category,
    required this.productPrice,
    required this.productMaterial,
    required this.productMedium,
    required this.productSize,
    required this.productImage,
    required this.creatorEmail
  });

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productDescription': productDescription,
        'productCategory': category,
        'productMaterial': productMaterial,
        'productPrice': productPrice,
        'productSize': productSize,
        'productMedium': productMedium,
        'productImage': productImage,
        'creatorEmail':creatorEmail
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
        productName: json['productName'],
        productDescription: json['productDescription'],
        category: json['productCategory'],
        productPrice: json['productPrice'],
        productMaterial: json['productMaterial'],
        productMedium: json['productMedium'],
        productSize: json['productSize'],
        productImage: json['productImage'],
        creatorEmail: json['creatorEmail'],
      );
}
