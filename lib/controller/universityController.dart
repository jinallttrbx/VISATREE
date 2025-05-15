import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/alertBoxes.dart';
import 'package:visatreenew/Widgets/snackbar.dart';

import 'package:visatreenew/model/GetShortListUniversity.dart';
import 'package:visatreenew/model/adminsortlisted.dart';
import 'package:visatreenew/model/universitymodel.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/session%20management.dart';


class UniversityController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var UniversityList = [].obs;
  var AdminUniversityList = [].obs;
  var shorlistedUniversityList = [].obs;
  SessionManagement share = SessionManagement();
  List<Universitydata> _universityModel = [];
  List<Universitydata> get universityModel => _universityModel;

  bool _loading = false;
  bool get loading => _loading;

  getUniversity({String? countryId}) async {
    String token = await share.istoken();
    UniversityList.value = [];
    _universityModel = [];
    isLoading.value = true;
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getuniversity +
            (countryId != null ? "?country_id=$countryId" : '')),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;

      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          UniversityModel getproject =
              UniversityModel.fromJson(jsonDecode(response.body));
          UniversityList.value = getproject.university;
          _universityModel = getproject.university;

          isLoading.value = false;
          hideLoadingDialog();

        } else {
          isLoading.value = false;
          hideLoadingDialog();
        }
      } else {
        isLoading.value = false;
        hideLoadingDialog();
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      showInSnackBar("Error Occured", color: Colors.red);
      isLoading.value = false;
      hideLoadingDialog();
    }
    update();
  }

  getShorlistedUniversity() async {
    print("${ApiUrl.baseurl}getuniversity_by_shortlist");
    String token = await share.istoken();
    shorlistedUniversityList.value = [];
    isLoading.value = true;
    showLoadingDialog();

    try {
      var response = await http.get(
        Uri.parse(
            '${ApiUrl.baseurl}getuniversity_by_shortlist'),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      print(response.body);
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);

        if (jsondata["status"] == true) {
          print(jsondata['status']);
          ShortListedUniversityModel getproject =
          ShortListedUniversityModel.fromJson(jsonDecode(response.body));
          shorlistedUniversityList.value = getproject.university;
          hideLoadingDialog();
          isLoading.value = false;
          hideLoadingDialog();
        } else {
          isLoading.value = false;
          hideLoadingDialog();
        }
      } else {
        isLoading.value = false;
        hideLoadingDialog();
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      print(e);
      showInSnackBar("Error Occured", color: Colors.red);
      isLoading.value = false;
      hideLoadingDialog();
    }
    update();
  }

  getadminUniversity() async {
    print(ApiUrl.adminsort);

    String token = await share.istoken();
    AdminUniversityList.value = [];
    isLoading.value = true;
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.adminsort),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      print(statusCode);
      print(token);
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          AdminSortlisted getproject =
              AdminSortlisted.fromJson(jsonDecode(response.body));
          print(response.body);
          for (var i = 0; i < getproject.shortlist!.length; i++) {
            AdminUniversityList.value.add(Shortlistdata(
              id: getproject.shortlist[i].id,
              university: getproject.shortlist[i].university,
              country: getproject.shortlist[i].country,
              gre: getproject.shortlist[i].gre,
              toefl: getproject.shortlist[i].toefl,
              ielts: getproject.shortlist[i].ielts,
              universityImage: getproject.shortlist[i].universityImage,
              duration: getproject.shortlist[i].duration,
              fees: getproject.shortlist[i].fees,
              level: getproject.shortlist[i].level,
              program: getproject.shortlist[i].program,
              course: getproject.shortlist[i].course,
              universityBanner: getproject.shortlist[i].universityBanner,
              image: getproject.shortlist[i].image??"",
                levelId: getproject.shortlist[i].levelId,
                programId: getproject.shortlist[i].programId,
                courseId: getproject.shortlist[i].courseId,
              sortedBy: getproject.shortlist[i].sortedBy,
              firstname: getproject.shortlist[i].firstname,
              studentId: getproject.shortlist[i].studentId,

            ));
          }
          isLoading.value = false;
          hideLoadingDialog();
        } else {
          isLoading.value = false;
          hideLoadingDialog();
        }
      } else {
        isLoading.value = false;
        hideLoadingDialog();
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      showInSnackBar("Error Occured", color: Colors.red);
      isLoading.value = false;
      hideLoadingDialog();
    }
  }

  applyuniversity(String uniid, String levelid, String programid,
      String courseid, BuildContext context) async {
    showLoadingDialog();
    print("User Applied university");

    String token = await share.istoken();
    String id = await share.isuserid();
    String name = await share.isfirstname();
    print("Student ID $id");
    print("Student name $name");

    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.baseurl}universitystore"),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "student_id": id,
          "university_id": uniid,
          "level_id": levelid,
          "program_id": programid,
          "course_id": courseid,
          "applicant_name": name,
        },
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data['status']);
        print(data['message']);
        if (data["status"] == true) {
          print("successfully applied university ");
          print('' + data['message']);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('' + data['message']!),
            duration: const Duration(seconds: 2),
          ));
          hideLoadingDialog();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('' + data['message']!),
            duration: const Duration(seconds: 2),
          ));
          hideLoadingDialog();
        }
      }
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }

  sortlisteduniversity(String uniid, String levelid, String programid,
      String courseid, BuildContext context) async {
    showLoadingDialog();
    print("User Shortlisted university");
    String token = await share.istoken();
    String id = await share.isuserid();
    String name = await share.isfirstname();
    print("Student ID $id");

    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.baseurl}shortliststore"),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "student_id": id,
          "university_id": uniid,
          "level_id": levelid,
          "program_id": programid,
          "course_id": courseid,
          "applicant_name": name,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["status"] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('' + data['message']!),
            duration: const Duration(seconds: 2),
          ));
          hideLoadingDialog();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('' + data['message']!),
            duration: const Duration(seconds: 2),
          ));
          hideLoadingDialog();
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
