// To parse this JSON data, do
//
//     final getProgrambyuniversity = getProgrambyuniversityFromJson(jsonString);

import 'dart:convert';

GetProgrambyuniversity getProgrambyuniversityFromJson(String str) => GetProgrambyuniversity.fromJson(json.decode(str));

String getProgrambyuniversityToJson(GetProgrambyuniversity data) => json.encode(data.toJson());

class GetProgrambyuniversity {
  List<GetProgrambyuniversitydata> data;
  bool status;
  String message;

  GetProgrambyuniversity({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetProgrambyuniversity.fromJson(Map<String, dynamic> json) => GetProgrambyuniversity(
    data: List<GetProgrambyuniversitydata>.from(json["data"].map((x) => GetProgrambyuniversitydata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetProgrambyuniversitydata {
  int id;
  String program;

  GetProgrambyuniversitydata({
    required this.id,
    required this.program,
  });

  factory GetProgrambyuniversitydata.fromJson(Map<String, dynamic> json) => GetProgrambyuniversitydata(
    id: json["id"],
    program: json["program"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "program": program,
  };
}
