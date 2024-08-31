// To parse this JSON data, do
//
//     final getProgramCourse = getProgramCourseFromJson(jsonString);

import 'dart:convert';

GetProgramCourse getProgramCourseFromJson(String str) => GetProgramCourse.fromJson(json.decode(str));

String getProgramCourseToJson(GetProgramCourse data) => json.encode(data.toJson());

class GetProgramCourse {
  List<Course> data;
  bool status;
  String message;

  GetProgramCourse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetProgramCourse.fromJson(Map<String, dynamic> json) => GetProgramCourse(
    data: List<Course>.from(json["data"].map((x) => Course.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Course {
  int id;
  String course;

  Course({
    required this.id,
    required this.course,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    course: json["course"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course": course,
  };
}
