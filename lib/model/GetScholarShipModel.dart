class GetScholarShipModel {
  List<ScholarShipModelData>? data;
  bool? status;
  String? message;

  GetScholarShipModel({this.data, this.status, this.message});

  GetScholarShipModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ScholarShipModelData>[];
      json['data'].forEach((v) {
        data!.add(ScholarShipModelData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ScholarShipModelData {
  int? id;
  String? scholarship;
  String? overview;
  int? countryId;
  int? universityId;
  int? courseId;
  String? applicable;
  String? type;
  String? provider;
  String? max;
  String? special;
  int? awards;
  String? deadline;
  String? createdAt;
  String? updatedAt;
  String? countryName;
  String? universityName;
  String? courseName;
  bool? isApplied;

  ScholarShipModelData({
    this.id,
    this.scholarship,
    this.overview,
    this.countryId,
    this.universityId,
    this.courseId,
    this.applicable,
    this.type,
    this.provider,
    this.max,
    this.special,
    this.awards,
    this.deadline,
    this.createdAt,
    this.updatedAt,
    this.countryName,
    this.universityName,
    this.courseName,
    this.isApplied,
  });

  ScholarShipModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scholarship = json['scholarship'];
    overview = json['overview'];
    countryId = json['country_id'];
    universityId = json['university_id'];
    courseId = json['course_id'];
    applicable = json['applicable'];
    type = json['type'];
    provider = json['provider'];
    max = json['max'];
    special = json['special'];
    awards = json['awards'];
    deadline = json['deadline'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryName = json['country_name'];
    universityName = json['university_name'];
    courseName = json['course_name'];
    isApplied = json['is_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['scholarship'] = scholarship;
    data['overview'] = overview;
    data['country_id'] = countryId;
    data['university_id'] = universityId;
    data['course_id'] = courseId;
    data['applicable'] = applicable;
    data['type'] = type;
    data['provider'] = provider;
    data['max'] = max;
    data['special'] = special;
    data['awards'] = awards;
    data['deadline'] = deadline;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country_name'] = countryName;
    data['university_name'] = universityName;
    data['course_name'] = courseName;
    data['is_applied'] = isApplied;
    return data;
  }
}
