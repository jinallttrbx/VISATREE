// To parse this JSON data, do
//
//     final getLevelbyuniversity = getLevelbyuniversityFromJson(jsonString);

import 'dart:convert';

GetLevelbyuniversity getLevelbyuniversityFromJson(String str) => GetLevelbyuniversity.fromJson(json.decode(str));

String getLevelbyuniversityToJson(GetLevelbyuniversity data) => json.encode(data.toJson());

class GetLevelbyuniversity {
  List<GetLevelbyuniversitydata> data;
  bool status;
  String message;

  GetLevelbyuniversity({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetLevelbyuniversity.fromJson(Map<String, dynamic> json) => GetLevelbyuniversity(
    data: List<GetLevelbyuniversitydata>.from(json["data"].map((x) => GetLevelbyuniversitydata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetLevelbyuniversitydata {
  int id;
  String level;
  DateTime createdAt;
  DateTime updatedAt;

  GetLevelbyuniversitydata({
    required this.id,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetLevelbyuniversitydata.fromJson(Map<String, dynamic> json) => GetLevelbyuniversitydata(
    id: json["id"],
    level: json["level"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "level": level,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
