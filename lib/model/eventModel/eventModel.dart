class eventModel {
  final String eventName;
  final String eventImageURL;

  eventModel({
    required this.eventName,
    required this.eventImageURL,
  });

  //to Json
  Map<String, dynamic> toJson() =>
      {'eventName': eventName, 'eventImageURL': eventImageURL};

  //from Json
  static eventModel fromJson(Map<String, dynamic> json) => eventModel(
        eventName: json['eventName'],
        eventImageURL: json['eventImageURL'],
      );
}
