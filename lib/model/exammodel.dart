import 'dart:convert';



ExamModel examModelFromJson(String str) => ExamModel.fromJson(json.decode(str));

String examModelToJson(ExamModel data) => json.encode(data.toJson());

class ExamModel {
  List<Examdata> exam;
  bool status;
  String message;

  ExamModel({
    required this.exam,
    required this.status,
    required this.message,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
    exam: List<Examdata>.from(json["Exam"].map((x) => Examdata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "Exam": List<dynamic>.from(exam.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Examdata {
  int id;
  String exam;
  String overview;
  String score;
  String practicePaper;
  String registration;
  String syllabus;
  String dates;
  String testCenter;
  DateTime createdAt;
  DateTime updatedAt;

  Examdata({
    required this.id,
    required this.exam,
    required this.overview,
    required this.score,
    required this.practicePaper,
    required this.registration,
    required this.syllabus,
    required this.dates,
    required this.testCenter,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Examdata.fromJson(Map<String, dynamic> json) => Examdata(
    id: json["id"],
    exam: json["exam"],
    overview: json["overview"],
    score: json["score"],
    practicePaper: json["practice_paper"],
    registration: json["registration"],
    syllabus: json["syllabus"],
    dates: json["dates"],
    testCenter: json["test_center"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "exam": exam,
    "overview": overview,
    "score": score,
    "practice_paper": practicePaper,
    "registration": registration,
    "syllabus": syllabus,
    "dates": dates,
    "test_center": testCenter,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}



