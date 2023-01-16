class creatorModel {
  final String creatorEmail;
  final String creatorName;
  creatorModel({
    required this.creatorEmail,
    required this.creatorName,
  });

  //to json
  Map<String, dynamic> toJson() => {
        'creatorEmail': creatorEmail,
        'creatorName': creatorName,
      };

  //fromJons
  static creatorModel fromJson(Map<String, dynamic> json) => creatorModel(
        creatorEmail: json['creatorEmail'],
        creatorName: json['creatorName'],
      );
}

//useModel
class userModel {
  final String userEmail;
  final String userName;
  userModel({
    required this.userEmail,
    required this.userName,
  });

  //to json
  Map<String, dynamic> toJson() => {
        'userEmail': userEmail,
        'userName': userName,
      };

  //fromJons
  static userModel fromJson(Map<String, dynamic> json) => userModel(
        userEmail: json['userEmail'],
        userName: json['userName'],
      );
}
