// To parse this JSON data, do
//
//     final getSearchUniversity = getSearchUniversityFromJson(jsonString);

import 'dart:convert';

GetSearchUniversity getSearchUniversityFromJson(String str) => GetSearchUniversity.fromJson(json.decode(str));

String getSearchUniversityToJson(GetSearchUniversity data) => json.encode(data.toJson());

class GetSearchUniversity {
  List<GetSearchUniversitydata> data;
  bool status;
  String message;

  GetSearchUniversity({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetSearchUniversity.fromJson(Map<String, dynamic> json) => GetSearchUniversity(
    data: List<GetSearchUniversitydata>.from(json["data"].map((x) => GetSearchUniversitydata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetSearchUniversitydata {
  dynamic id;
  dynamic university;
  dynamic description;
  dynamic countryId;
  dynamic countryName;
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
  dynamic levelName;
  dynamic courseName;
  dynamic programName;
  dynamic isApplied;

  GetSearchUniversitydata({
    required this.id,
    required this.university,
    required this.description,
    required this.countryId,
    required this.countryName,
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
    required this.levelName,
    required this.courseName,
    required this.programName,
    required this.isApplied,
  });

  factory GetSearchUniversitydata.fromJson(Map<String, dynamic> json) => GetSearchUniversitydata(
    id: json["id"],
    university: json["university"],
    description: json["description"],
    countryId: json["country_id"],
    countryName: json["country_name"],
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
    levelName: json["level_name"],
    courseName: json["course_name"],
    programName: json["program_name"],
    isApplied: json["is_applied"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "university": university,
    "description": description,
    "country_id": countryId,
    "country_name": countryName,
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
    "level_name": levelName,
    "course_name": courseName,
    "program_name": programName,
    "is_applied": isApplied,
  };
}
