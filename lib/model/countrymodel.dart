// To parse this JSON data, do
//
//     final getCountryModel = getCountryModelFromJson(jsonString);

import 'dart:convert';

GetCountryModel getCountryModelFromJson(String str) => GetCountryModel.fromJson(json.decode(str));

String getCountryModelToJson(GetCountryModel data) => json.encode(data.toJson());

class GetCountryModel {
  List<Country> country;
  bool status;
  String message;

  GetCountryModel({
    required this.country,
    required this.status,
    required this.message,
  });

  factory GetCountryModel.fromJson(Map<String, dynamic> json) => GetCountryModel(
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Country {
  dynamic id;
  dynamic country;
  dynamic flag;
  dynamic countryImage;
  dynamic discription;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic image;

  Country({
    required this.id,
    required this.country,
    required this.flag,
    required this.countryImage,
    required this.discription,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    country: json["country"],
    flag: json["flag"],
    countryImage: json["country_image"],
    discription: json["discription"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "flag": flag,
    "country_image": countryImage,
    "discription": discription,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
  };
}
