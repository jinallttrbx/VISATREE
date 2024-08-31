// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  bool status;
  Student student;
  String message;

  GetProfileModel({
    required this.status,
    required this.student,
    required this.message,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        status: json["status"],
        student: Student.fromJson(json["student"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "student": student.toJson(),
        "message": message,
      };
}

class Student {
  int id;
  String firstname;
  String lastname;
  String email;
  dynamic phone;
  dynamic age;
  dynamic gender;
  dynamic referral;
  dynamic studentProfile;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  int activeStatus;
  int darkMode;
  dynamic messengerColor;

  Student({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.age,
    required this.gender,
    required this.referral,
    required this.studentProfile,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.activeStatus,
    required this.darkMode,
    required this.messengerColor,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        referral: json["referral"],
        studentProfile: json["student_profile"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        activeStatus: json["active_status"],
        darkMode: json["dark_mode"],
        messengerColor: json["messenger_color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "age": age,
        "gender": gender,
        "referral": referral,
        "student_profile": studentProfile,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "active_status": activeStatus,
        "dark_mode": darkMode,
        "messenger_color": messengerColor,
      };
}
