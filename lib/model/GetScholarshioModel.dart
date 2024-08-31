// To parse this JSON data, do
//
//     final getScholarshipModel = getScholarshipModelFromJson(jsonString);

import 'dart:convert';

GetScholarshipModel getScholarshipModelFromJson(String str) => GetScholarshipModel.fromJson(json.decode(str));

String getScholarshipModelToJson(GetScholarshipModel data) => json.encode(data.toJson());

class GetScholarshipModel {
  List<Scholarshipdata> scholarships;
  bool status;
  String message;

  GetScholarshipModel({
    required this.scholarships,
    required this.status,
    required this.message,
  });

  factory GetScholarshipModel.fromJson(Map<String, dynamic> json) => GetScholarshipModel(
    scholarships: List<Scholarshipdata>.from(json["scholarships"].map((x) => Scholarshipdata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "scholarships": List<dynamic>.from(scholarships.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Scholarshipdata {
  int id;
  String scholarship;
  String overview;
  int countryId;
  int universityId;
  int courseId;
  dynamic applicable;
  String type;
  String max;
  String special;
  int awards;
  DateTime deadline;
  String university;
  int rank;
  int gre;
  int gmat;
  int toefl;
  int ielts;
  int gpa;
  String category;
  String fees;
  String duration;
  String universityImageUrl;
  dynamic universityImage;

  Scholarshipdata({
    required this.id,
    required this.scholarship,
    required this.overview,
    required this.countryId,
    required this.universityId,
    required this.courseId,
    required this.applicable,
    required this.type,
    required this.max,
    required this.special,
    required this.awards,
    required this.deadline,
    required this.university,
    required this.rank,
    required this.gre,
    required this.gmat,
    required this.toefl,
    required this.ielts,
    required this.gpa,
    required this.category,
    required this.fees,
    required this.duration,
    required this.universityImageUrl,
    required this.universityImage,
  });

  factory Scholarshipdata.fromJson(Map<String, dynamic> json) => Scholarshipdata(
    id: json["id"],
    scholarship: json["scholarship"],
    overview: json["overview"],
    countryId: json["country_id"],
    universityId: json["university_id"],
    courseId: json["course_id"],
    applicable: json["applicable"],
    type: json["type"],
    max: json["max"],
    special: json["special"],
    awards: json["awards"],
    deadline: DateTime.parse(json["deadline"]),
    university: json["university"],
    rank: json["rank"],
    gre: json["gre"],
    gmat: json["gmat"],
    toefl: json["toefl"],
    ielts: json["ielts"],
    gpa: json["gpa"],
    category: json["category"],
    fees: json["fees"],
    duration: json["duration"],
    universityImageUrl: json["university_image_url"],
    universityImage: json["university_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "scholarship": scholarship,
    "overview": overview,
    "country_id": countryId,
    "university_id": universityId,
    "course_id": courseId,
    "applicable": applicable,
    "type": type,
    "max": max,
    "special": special,
    "awards": awards,
    "deadline": "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
    "university": university,
    "rank": rank,
    "gre": gre,
    "gmat": gmat,
    "toefl": toefl,
    "ielts": ielts,
    "gpa": gpa,
    "category": category,
    "fees": fees,
    "duration": duration,
    "university_image_url": universityImageUrl,
    "university_image": universityImage,
  };
}
