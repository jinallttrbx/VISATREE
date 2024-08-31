// To parse this JSON data, do
//
//     final getLevelByCountryModel = getLevelByCountryModelFromJson(jsonString);

import 'dart:convert';

GetLevelByCountryModel getLevelByCountryModelFromJson(String str) => GetLevelByCountryModel.fromJson(json.decode(str));

String getLevelByCountryModelToJson(GetLevelByCountryModel data) => json.encode(data.toJson());

class GetLevelByCountryModel {
  List<GetLevelByCountryModeldata> data;
  bool status;
  String message;

  GetLevelByCountryModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory GetLevelByCountryModel.fromJson(Map<String, dynamic> json) => GetLevelByCountryModel(
    data: List<GetLevelByCountryModeldata>.from(json["data"].map((x) => GetLevelByCountryModeldata.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class GetLevelByCountryModeldata {
  int id;
  String level;
  DateTime createdAt;
  DateTime updatedAt;

  GetLevelByCountryModeldata({
    required this.id,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetLevelByCountryModeldata.fromJson(Map<String, dynamic> json) => GetLevelByCountryModeldata(
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
