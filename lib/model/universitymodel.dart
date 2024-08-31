// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

UniversityModel universityModelFromJson(String str) =>
    UniversityModel.fromJson(json.decode(str));

String universityModelToJson(UniversityModel data) =>
    json.encode(data.toJson());

class UniversityModel {
  List<Universitydata> university;
  bool status;
  String message;

  UniversityModel({
    required this.university,
    required this.status,
    required this.message,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        university: List<Universitydata>.from(
            json["university"].map((x) => Universitydata.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "university": List<dynamic>.from(university.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Universitydata {
  dynamic id;
  dynamic university;
  dynamic description;
  dynamic countryId;
  dynamic country;
  dynamic rank;
  dynamic gre;
  dynamic gmat;
  dynamic toefl;
  dynamic ielts;
  dynamic gpa;
  dynamic category;
  dynamic universityImage;
  dynamic universityBanner;
  dynamic duration;
  dynamic fees;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic image;
  dynamic isApplied;
  dynamic isshort;

  Universitydata({
    required this.id,
    required this.university,
    required this.description,
    required this.countryId,
    required this.country,
    required this.rank,
    required this.gre,
    required this.gmat,
    required this.toefl,
    required this.ielts,
    required this.gpa,
    required this.category,
    required this.universityImage,
    required this.universityBanner,
    required this.duration,
    required this.fees,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.isApplied,
    required this.isshort,
  });

  factory Universitydata.fromJson(Map<String, dynamic> json) => Universitydata(
        id: json["id"],
        university: json["university"],
        description: json["description"],
        countryId: json["country_id"],
        country: json["country_name"],
        rank: json["rank"],
        gre: json["gre"],
        gmat: json["gmat"],
        toefl: json["toefl"],
        ielts: json["ielts"],
        gpa: json["gpa"],
        category: json["category"],
        universityImage: json["university_image"],
        universityBanner: json["university_banner"],
        duration: json["duration"],
        fees: json["fees"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        isApplied: json["is_applied"],
        isshort: json["is_shortlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "university": university,
        "description": description,
        "country_id": countryId,
        "country_name": country,
        "rank": rank,
        "gre": gre,
        "gmat": gmat,
        "toefl": toefl,
        "ielts": ielts,
        "gpa": gpa,
        "category": category,
        "university_image": universityImage,
        "university_banner": universityBanner,
        "duration": duration,
        "fees": fees,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "is_applied": isApplied,
        "is_shortlist":isshort,
      };
}
