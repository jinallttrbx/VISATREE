// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  List<Event> events;
  bool status;
  String message;

  EventModel({
    required this.events,
    required this.status,
    required this.message,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Event {
  int id;
  String title;
  String subTitle;
  String venue;
  DateTime date;
  String time;
  String about;
  String information;
  String eventImage;
  DateTime createdAt;
  DateTime updatedAt;
  bool isApplied;

  Event({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.venue,
    required this.date,
    required this.time,
    required this.about,
    required this.information,
    required this.eventImage,
    required this.createdAt,
    required this.updatedAt,
    required this.isApplied,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    title: json["title"],
    subTitle: json["Sub_Title"],
    venue: json["venue"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    about: json["about"],
    information: json["information"],
    eventImage: json["event_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isApplied: json["is_applied"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "Sub_Title": subTitle,
    "venue": venue,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "about": about,
    "information": information,
    "event_image": eventImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_applied": isApplied,
  };
}
