class creatorModel {
  final String creatorEmail;
  creatorModel({
    required this.creatorEmail,
  });

  //to json
  Map<String, dynamic> toJson() => {'creatorEmail': creatorEmail};

  //fromJons
  static creatorModel fromJson(Map<String, dynamic> json) =>
      creatorModel(creatorEmail: json['creatorEmail']);
}

//useModel
class userModel {
  final String userEmail;
  userModel({
    required this.userEmail,
  });

  //to json
  Map<String, dynamic> toJson() => {'userEmail': userEmail};

  //fromJons
  static userModel fromJson(Map<String, dynamic> json) =>
      userModel(userEmail: json['userEmail']);
}
