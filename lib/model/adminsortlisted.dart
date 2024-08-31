// To parse this JSON data, do
//
//     final adminSortlisted = adminSortlistedFromJson(jsonString);

import 'dart:convert';

AdminSortlisted adminSortlistedFromJson(String str) => AdminSortlisted.fromJson(json.decode(str));

String adminSortlistedToJson(AdminSortlisted data) => json.encode(data.toJson());

class AdminSortlisted {
  List<Shortlistdata> shortlist;
  bool status;
  String message;

  AdminSortlisted({
    required this.shortlist,
    required this.status,
    required this.message,
  });

  factory AdminSortlisted.fromJson(Map<String, dynamic> json) => AdminSortlisted(
    shortlist: List<Shortlistdata>.from(json["shortlist"].map((x) => Shortlistdata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "shortlist": List<dynamic>.from(shortlist.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Shortlistdata {
  int id;
  String university;
  String universityImage;
  String universityBanner;
  String country;
  String duration;
  String fees;
  int? toefl;
  int? ielts;
  int gre;
  int levelId;
  int programId;
  int courseId;
  String level;
  String program;
  String course;
  String sortedBy;
  String firstname;
  int studentId;
  String image;

  Shortlistdata({
    required this.id,
    required this.university,
    required this.universityImage,
    required this.universityBanner,
    required this.country,
    required this.duration,
    required this.fees,
    required this.toefl,
    required this.ielts,
    required this.gre,
    required this.levelId,
    required this.programId,
    required this.courseId,
    required this.level,
    required this.program,
    required this.course,
    required this.sortedBy,
    required this.firstname,
    required this.studentId,
    required this.image,
  });

  factory Shortlistdata.fromJson(Map<String, dynamic> json) => Shortlistdata(
    id: json["id"],
    university: json["university"],
    universityImage: json["university_image"],
    universityBanner: json["university_banner"],
    country: json["country"],
    duration: json["duration"],
    fees: json["fees"],
    toefl: json["toefl"],
    ielts: json["ielts"],
    gre: json["gre"],
    levelId: json["level_id"],
    programId: json["program_id"],
    courseId: json["course_id"],
    level: json["level"],
    program: json["program"],
    course: json["course"],
    sortedBy: json["sorted_by"],
    firstname: json["firstname"],
    studentId: json["student_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "university": university,
    "university_image": universityImage,
    "university_banner": universityBanner,
    "country": country,
    "duration": duration,
    "fees": fees,
    "toefl": toefl,
    "ielts": ielts,
    "gre": gre,
    "level_id": levelId,
    "program_id": programId,
    "course_id": courseId,
    "level": level,
    "program": program,
    "course": course,
    "sorted_by": sortedBy,
    "firstname": firstname,
    "student_id": studentId,
    "image": image,
  };
}
