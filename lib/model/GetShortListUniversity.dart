// To parse this JSON data, do
//
//     final shortListedUniversityModel = shortListedUniversityModelFromJson(jsonString);

import 'dart:convert';

ShortListedUniversityModel shortListedUniversityModelFromJson(String str) => ShortListedUniversityModel.fromJson(json.decode(str));

String shortListedUniversityModelToJson(ShortListedUniversityModel data) => json.encode(data.toJson());

class ShortListedUniversityModel {
  List<ShortUniversity> university;
  bool status;
  String message;

  ShortListedUniversityModel({
    required this.university,
    required this.status,
    required this.message,
  });

  factory ShortListedUniversityModel.fromJson(Map<String, dynamic> json) => ShortListedUniversityModel(
    university: List<ShortUniversity>.from(json["university"].map((x) => ShortUniversity.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "university": List<dynamic>.from(university.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class ShortUniversity {
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
  dynamic levelId;
  dynamic programId;
  dynamic courseId;
  dynamic level;
  dynamic program;
  dynamic course;
  dynamic image;
  dynamic isApplied;
  dynamic isShortlist;

  ShortUniversity({
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
    required this.levelId,
    required this.programId,
    required this.courseId,
    required this.level,
    required this.program,
    required this.course,
    required this.image,
    required this.isApplied,
    required this.isShortlist,
  });

  factory ShortUniversity.fromJson(Map<String, dynamic> json) => ShortUniversity(
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
    levelId: json["level_id"],
    programId: json["program_id"],
    courseId: json["course_id"],
    level: json["level"],
    program: json["program"],
    course: json["course"],
    image: json["image"],
    isApplied: json["is_applied"],
    isShortlist: json["is_shortlist"],
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
    "level_id": levelId,
    "program_id": programId,
    "course_id": courseId,
    "level": level,
    "program": program,
    "course": course,
    "image": image,
    "is_applied": isApplied,
    "is_shortlist": isShortlist,
  };
}
