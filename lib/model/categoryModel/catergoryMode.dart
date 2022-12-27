class categoryModel {
  final String categoryName;
  final String categoryImageURL;

  categoryModel({
    required this.categoryName,
    required this.categoryImageURL,
  });

  //to Json
  Map<String, dynamic> toJson() =>
      {'categoryName': categoryName, 'categoryImageURL': categoryImageURL};

  //from Json
  static categoryModel fromJson(Map<String, dynamic> json) => categoryModel(
        categoryName: json['categoryName'],
        categoryImageURL: json['categoryImageURL'],
      );
}
