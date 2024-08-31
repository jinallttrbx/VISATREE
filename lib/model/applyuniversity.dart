// To parse this JSON data, do
//
//     final applyUniversityModel = applyUniversityModelFromJson(jsonString);

import 'dart:convert';

ApplyUniversityModel applyUniversityModelFromJson(String str) =>
    ApplyUniversityModel.fromJson(json.decode(str));

String applyUniversityModelToJson(ApplyUniversityModel data) =>
    json.encode(data.toJson());

class ApplyUniversityModel {
  List<Applyunilist> applyunilist;
  bool status;
  String message;

  ApplyUniversityModel({
    required this.applyunilist,
    required this.status,
    required this.message,
  });

  factory ApplyUniversityModel.fromJson(Map<String, dynamic> json) =>
      ApplyUniversityModel(
        applyunilist: List<Applyunilist>.from(
            json["applyunilist"].map((x) => Applyunilist.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "applyunilist": List<dynamic>.from(applyunilist.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Applyunilist {
  int id;
  dynamic userId;
  dynamic studentId;
  dynamic applicantName;
  dynamic applicantEmail;
  dynamic applicantPhone;
  dynamic applicantAge;
  dynamic universityId;
  dynamic levelId;
  dynamic programId;
  dynamic courseId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic universityName;
  dynamic universityBanner;
  dynamic levelName;
  dynamic programName;
  dynamic courseName;
  String? countryName;

  Applyunilist({
    required this.id,
    required this.userId,
    required this.studentId,
    required this.applicantName,
    required this.applicantEmail,
    required this.applicantPhone,
    required this.applicantAge,
    required this.universityId,
    required this.levelId,
    required this.programId,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
    required this.universityName,
    required this.universityBanner,
    required this.levelName,
    required this.programName,
    required this.courseName,
    this.countryName,
  });

  factory Applyunilist.fromJson(Map<String, dynamic> json) => Applyunilist(
    id: json["id"],
    userId: json["user_id"],
    studentId: json["student_id"],
    applicantName: json["applicant_name"],
    applicantEmail: json["applicant_email"],
    applicantPhone: json["applicant_phone"],
    applicantAge: json["applicant_age"],
    universityId: json["university_id"],
    levelId: json["level_id"],
    programId: json["program_id"],
    courseId: json["course_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    universityName: json["university_name"],
    universityBanner: json["university_banner"],
    levelName: json["level_name"],
    programName: json["program_name"],
    courseName: json["course_name"],
    countryName: json['country_name'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "student_id": studentId,
    "applicant_name": applicantName,
    "applicant_email": applicantEmail,
    "applicant_phone": applicantPhone,
    "applicant_age": applicantAge,
    "university_id": universityId,
    "level_id": levelId,
    "program_id": programId,
    "course_id": courseId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "university_name": universityName,
    "university_banner": universityBanner,
    "level_name": levelName,
    "program_name": programName,
    "course_name": courseName,
    "country_name": countryName,
  };
}
