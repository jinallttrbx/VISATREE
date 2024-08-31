// To parse this JSON data, do
//
//     final getCourseModel = getCourseModelFromJson(jsonString);

import 'dart:convert';

GetCourseModel getCourseModelFromJson(String str) => GetCourseModel.fromJson(json.decode(str));

String getCourseModelToJson(GetCourseModel data) => json.encode(data.toJson());

class GetCourseModel {
  List<Cource> cource;
  bool status;
  String message;

  GetCourseModel({
    required this.cource,
    required this.status,
    required this.message,
  });

  factory GetCourseModel.fromJson(Map<String, dynamic> json) => GetCourseModel(
    cource: List<Cource>.from(json["cource"].map((x) => Cource.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "cource": List<dynamic>.from(cource.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Cource {
  int id;
  String course;
  DateTime createdAt;
  DateTime updatedAt;

  Cource({
    required this.id,
    required this.course,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cource.fromJson(Map<String, dynamic> json) => Cource(
    id: json["id"],
    course: json["course"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course": course,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
