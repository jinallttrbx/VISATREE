// To parse this JSON data, do
//
//     final getDocumentListModel = getDocumentListModelFromJson(jsonString);

import 'dart:convert';

GetDocumentListModel getDocumentListModelFromJson(String str) => GetDocumentListModel.fromJson(json.decode(str));

String getDocumentListModelToJson(GetDocumentListModel data) => json.encode(data.toJson());

class GetDocumentListModel {
  bool status;
  List<Document> documents;
  String message;

  GetDocumentListModel({
    required this.status,
    required this.documents,
    required this.message,
  });

  factory GetDocumentListModel.fromJson(Map<String, dynamic> json) => GetDocumentListModel(
    status: json["status"],
    documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
    "message": message,
  };
}

class Document {
  dynamic type;
  dynamic uploaded;
  dynamic url;

  Document({
    required this.type,
    required this.uploaded,
    required this.url,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    type: json["type"],
    uploaded: json["uploaded"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "uploaded": uploaded,
    "url": url,
  };
}
