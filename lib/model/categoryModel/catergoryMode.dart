class categoryModel {
  final String categoryName;

  categoryModel({
    required this.categoryName,
  });

  //to Json
  Map<String, dynamic> toJson() => {
        'categoryName': categoryName,
      };

  //from Json
  static categoryModel fromJson(Map<String, dynamic> json) => categoryModel(
        categoryName: json['categoryName'],
      );
}
