class AddressModel {
  final String fullName;
  final String houseName;
  final String streetName;
  final String townName;
  final String pincode;
  final String state;
  final String phone;
  final String country;

  AddressModel({
    required this.fullName,
    required this.houseName,
    required this.streetName,
    required this.townName,
    required this.pincode,
    required this.state,
    required this.phone,
    required this.country,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'houseName': houseName,
        'streetName': streetName,
        'townName': townName,
        'pincode': pincode,
        'state': state,
        'phone': phone,
        'country': country,
      };

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
      fullName: json['fullName'],
      houseName: json['houseName'],
      streetName: json['streetName'],
      townName: json['townName'],
      pincode: json['pincode'],
      state: json['state'],
      phone: json['phone'],
      country: json['country']);
}
