// To parse this JSON data, do
//
//     final getDocumentModel = getDocumentModelFromJson(jsonString);

import 'dart:convert';

GetDocumentModel getDocumentModelFromJson(String str) => GetDocumentModel.fromJson(json.decode(str));

String getDocumentModelToJson(GetDocumentModel data) => json.encode(data.toJson());

class GetDocumentModel {
  List<Document> document;
  bool status;
  String message;

  GetDocumentModel({
    required this.document,
    required this.status,
    required this.message,
  });

  factory GetDocumentModel.fromJson(Map<String, dynamic> json) => GetDocumentModel(
    document: List<Document>.from(json["document"].map((x) => Document.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "document": List<dynamic>.from(document.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Document {
  int id;
  int studentId;
  String pdfFileSop;
  String pdfFileLor;
  String pdfFileExam;
  String pdfFileCertification;
  String pdfFileResume;
  String pdfFilePassport;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String pdfFileSopFullPath;
  String pdfFileLorFullPath;
  String pdfFileExamFullPath;
  String pdfFileCertificationFullPath;
  String pdfFileResumeFullPath;
  String pdfFilePassportFullPath;

  Document({
    required this.id,
    required this.studentId,
    required this.pdfFileSop,
    required this.pdfFileLor,
    required this.pdfFileExam,
    required this.pdfFileCertification,
    required this.pdfFileResume,
    required this.pdfFilePassport,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pdfFileSopFullPath,
    required this.pdfFileLorFullPath,
    required this.pdfFileExamFullPath,
    required this.pdfFileCertificationFullPath,
    required this.pdfFileResumeFullPath,
    required this.pdfFilePassportFullPath,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    id: json["id"],
    studentId: json["student_id"],
    pdfFileSop: json["pdf_file_sop"],
    pdfFileLor: json["pdf_file_lor"],
    pdfFileExam: json["pdf_file_exam"],
    pdfFileCertification: json["pdf_file_certification"],
    pdfFileResume: json["pdf_file_resume"],
    pdfFilePassport: json["pdf_file_passport"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pdfFileSopFullPath: json["pdf_file_sop_full_path"],
    pdfFileLorFullPath: json["pdf_file_lor_full_path"],
    pdfFileExamFullPath: json["pdf_file_exam_full_path"],
    pdfFileCertificationFullPath: json["pdf_file_certification_full_path"],
    pdfFileResumeFullPath: json["pdf_file_resume_full_path"],
    pdfFilePassportFullPath: json["pdf_file_passport_full_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_id": studentId,
    "pdf_file_sop": pdfFileSop,
    "pdf_file_lor": pdfFileLor,
    "pdf_file_exam": pdfFileExam,
    "pdf_file_certification": pdfFileCertification,
    "pdf_file_resume": pdfFileResume,
    "pdf_file_passport": pdfFilePassport,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pdf_file_sop_full_path": pdfFileSopFullPath,
    "pdf_file_lor_full_path": pdfFileLorFullPath,
    "pdf_file_exam_full_path": pdfFileExamFullPath,
    "pdf_file_certification_full_path": pdfFileCertificationFullPath,
    "pdf_file_resume_full_path": pdfFileResumeFullPath,
    "pdf_file_passport_full_path": pdfFilePassportFullPath,
  };
}
