// To parse this JSON data, do
//
//     final getProgramModel = getProgramModelFromJson(jsonString);

import 'dart:convert';

GetProgramModel getProgramModelFromJson(String str) => GetProgramModel.fromJson(json.decode(str));

String getProgramModelToJson(GetProgramModel data) => json.encode(data.toJson());

class GetProgramModel {
  List<Program> program;
  bool status;
  String message;

  GetProgramModel({
    required this.program,
    required this.status,
    required this.message,
  });

  factory GetProgramModel.fromJson(Map<String, dynamic> json) => GetProgramModel(
    program: List<Program>.from(json["program"].map((x) => Program.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "program": List<dynamic>.from(program.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Program {
  int id;
  String program;
  DateTime createdAt;
  DateTime updatedAt;

  Program({
    required this.id,
    required this.program,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    id: json["id"],
    program: json["program"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "program": program,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
