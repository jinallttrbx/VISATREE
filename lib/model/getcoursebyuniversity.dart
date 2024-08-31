// To parse this JSON data, do
//
//     final getCoursebyuniversity = getCoursebyuniversityFromJson(jsonString);

import 'dart:convert';

GetCoursebyuniversity getCoursebyuniversityFromJson(String str) => GetCoursebyuniversity.fromJson(json.decode(str));

String getCoursebyuniversityToJson(GetCoursebyuniversity data) => json.encode(data.toJson());

class GetCoursebyuniversity {
  List<GetCoursebyuniversitydata> data;
  bool status;
  String message;

  GetCoursebyuniversity({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetCoursebyuniversity.fromJson(Map<String, dynamic> json) => GetCoursebyuniversity(
    data: List<GetCoursebyuniversitydata>.from(json["data"].map((x) => GetCoursebyuniversitydata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetCoursebyuniversitydata {
  int id;
  String course;
  String fees;
  String duration;

  GetCoursebyuniversitydata({
    required this.id,
    required this.course,
    required this.fees,
    required this.duration
  });

  factory GetCoursebyuniversitydata.fromJson(Map<String, dynamic> json) => GetCoursebyuniversitydata(
    id: json["id"],
    course: json["course"],
    fees: json['fees'],
      duration: json['duration']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course": course,
    'fees':fees,
    'fees':duration
  };
}
