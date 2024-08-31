import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/model/GetScholarshioModel.dart';
import 'package:visatree/model/getScholarShipModel.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/snackbar.dart';
import 'package:visatree/util/images.dart';

class ScholarshipController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var ScholarshipList = [].obs;
  SessionManagement share = SessionManagement();
  List<ScholarShipModelData> _scholarDataList = [];
  List<ScholarShipModelData> get scholarDataList => _scholarDataList;
  bool _loading = false;
  bool get loading => _loading;

  getScholarShipData() async {
    String token = await share.istoken();
    ScholarshipList.value = [];
    _scholarDataList = [];
    _loading = true;
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getScholarshipList),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetScholarShipModel scholarShipData =
              GetScholarShipModel.fromJson(jsondata);
          _scholarDataList = scholarShipData.data ?? [];
          _loading = false;
        } else {
          _loading = false;
        }
      } else {
        _loading = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      showInSnackBar("Error Occured", color: Colors.red);
      _loading = false;
    }
    update();
  }

  bool _applying = false;
  bool get applying => _applying;

  appyForScholarShip(String scholarShipId, BuildContext context) async {
    String token = await share.istoken();
    _applying = true;
    try {
      var response = await http.post(Uri.parse(ApiUrl.applyForScholarShip),
          headers: {"Authorization": "Bearer $token"},
          body: {"scholarship_id": scholarShipId});

      final jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Column(
              children: [
                Image.asset(
                  images.appicon,
                  height: 100,
                ),
                Text(
                  '${jsondata['message']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 500,
              right: 20,
              left: 20,
            ),
          ));
        //  Navigator.pop(context);
          _applying = false;
        } else {
          customSnackBar(context, jsondata["message"].toString(),
              color: Colors.red);
          _applying = false;
        }
      } else {
        _applying = false;
        customSnackBar(context, jsondata["message"].toString(),
            color: Colors.red);
      }
    } catch (e) {
      customSnackBar(context, e.toString(), color: Colors.red);
      _applying = false;
    }
    update();
  }

  getScholarship() async {
    String token = await share.istoken();
    ScholarshipList.value = [];
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getscholarship),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetScholarshipModel getproject =
              GetScholarshipModel.fromJson(jsonDecode(response.body));
          for (var i = 0; i < getproject.scholarships!.length; i++) {
            ScholarshipList.value.add(Scholarshipdata(
              id: getproject.scholarships[i].id,
              scholarship: getproject.scholarships[i].scholarship,
              overview: getproject.scholarships[i].overview,
              countryId: getproject.scholarships[i].countryId,
              universityId: getproject.scholarships[i].universityId,
              courseId: getproject.scholarships[i].courseId,
              applicable: getproject.scholarships[i].applicable,
              type: getproject.scholarships[i].type,
              max: getproject.scholarships[i].max,
              special: getproject.scholarships[i].special,
              awards: getproject.scholarships[i].awards,
              deadline: getproject.scholarships[i].deadline,
              university: getproject.scholarships[i].university,
              rank: getproject.scholarships[i].rank,
              gre: getproject.scholarships[i].gre,
              gmat: getproject.scholarships[i].gmat,
              toefl: getproject.scholarships[i].toefl,
              gpa: getproject.scholarships[i].gpa,
              category: getproject.scholarships[i].category,
              fees: getproject.scholarships[i].fees,
              duration: getproject.scholarships[i].duration,
              universityImageUrl: getproject.scholarships[i].universityImageUrl,
              universityImage: getproject.scholarships[i].universityImage,
              ielts: getproject.scholarships[i].ielts,
            ));
          }
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      } else {
        isLoading.value = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      showInSnackBar("Error Occured", color: Colors.red);
      isLoading.value = false;
    }
  }
}
