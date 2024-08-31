// To parse this JSON data, do
//
//     final getLevelProgram = getLevelProgramFromJson(jsonString);

import 'dart:convert';

GetLevelProgram getLevelProgramFromJson(String str) => GetLevelProgram.fromJson(json.decode(str));

String getLevelProgramToJson(GetLevelProgram data) => json.encode(data.toJson());

class GetLevelProgram {
  List<GetLevelProgramdata> data;
  bool status;
  String message;

  GetLevelProgram({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetLevelProgram.fromJson(Map<String, dynamic> json) => GetLevelProgram(
    data: List<GetLevelProgramdata>.from(json["data"].map((x) => GetLevelProgramdata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetLevelProgramdata {
  int id;
  String program;

  GetLevelProgramdata({
    required this.id,
    required this.program,
  });

  factory GetLevelProgramdata.fromJson(Map<String, dynamic> json) => GetLevelProgramdata(
    id: json["id"],
    program: json["program"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "program": program,
  };
}
