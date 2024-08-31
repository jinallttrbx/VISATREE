// To parse this JSON data, do
//
//     final getCountryLevel = getCountryLevelFromJson(jsonString);

import 'dart:convert';

GetCountryLevel getCountryLevelFromJson(String str) => GetCountryLevel.fromJson(json.decode(str));

String getCountryLevelToJson(GetCountryLevel data) => json.encode(data.toJson());

class GetCountryLevel {
  List<GetCountryLeveldata> data;
  bool status;
  String message;

  GetCountryLevel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetCountryLevel.fromJson(Map<String, dynamic> json) => GetCountryLevel(
    data: List<GetCountryLeveldata>.from(json["data"].map((x) => GetCountryLeveldata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetCountryLeveldata {
  int id;
  String level;
  DateTime createdAt;
  DateTime updatedAt;

  GetCountryLeveldata({
    required this.id,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetCountryLeveldata.fromJson(Map<String, dynamic> json) => GetCountryLeveldata(
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
