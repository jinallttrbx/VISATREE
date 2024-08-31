// To parse this JSON data, do
//
//     final getCourseuniversity = getCourseuniversityFromJson(jsonString);

import 'dart:convert';

GetCourseuniversity getCourseuniversityFromJson(String str) => GetCourseuniversity.fromJson(json.decode(str));

String getCourseuniversityToJson(GetCourseuniversity data) => json.encode(data.toJson());

class GetCourseuniversity {
  List<GetCourseuniversitydata> data;
  bool status;
  String message;

  GetCourseuniversity({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetCourseuniversity.fromJson(Map<String, dynamic> json) => GetCourseuniversity(
    data: List<GetCourseuniversitydata>.from(json["data"].map((x) => GetCourseuniversitydata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetCourseuniversitydata {
  int id;
  String university;

  GetCourseuniversitydata({
    required this.id,
    required this.university,
  });

  factory GetCourseuniversitydata.fromJson(Map<String, dynamic> json) => GetCourseuniversitydata(
    id: json["id"],
    university: json["university"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "university": university,
  };
}
