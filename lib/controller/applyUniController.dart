import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/alertBoxes.dart';
import 'package:visatree/model/applyuniversity.dart';

import 'package:visatree/session%20management.dart';
import 'package:visatree/snackbar.dart';

class ApplyUniController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var ApplyUniversityList = [].obs;
  SessionManagement share = SessionManagement();

  List<Applyunilist> _appliedUniversityList = [];
  List<Applyunilist> get appliedUniversityList => _appliedUniversityList;

  getapplyUniversity() async {
    String token = await share.istoken();
    ApplyUniversityList.value = [];
    _appliedUniversityList = [];
    isLoading.value = true;
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse("${ApiUrl.baseurl}applyunilist"),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      print(response.body);
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          ApplyUniversityModel getproject =
              ApplyUniversityModel.fromJson(jsondata);
          ApplyUniversityList.value = getproject.applyunilist;
          _appliedUniversityList.addAll(getproject.applyunilist);
          hideLoadingDialog();
          isLoading.value = false;
          update();
        } else {
          hideLoadingDialog();
          isLoading.value = false;
        }
      } else {
        hideLoadingDialog();
        isLoading.value = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      print("rakesh");
      print(e);
      print("rakesh");
      isLoading.value = false;
      showInSnackBar("Error Occured", color: Colors.red);
      hideLoadingDialog();
    }
    update();
  }

  canceluniversity(String uniid, BuildContext context) async {
    String token = await share.istoken();
    showLoadingDialog();
    try {
      var response = await http.post(
        Uri.parse(
            "${ApiUrl.baseurl}applyunilistdelete/$uniid"),
        headers: {"Authorization": "Bearer $token"},
      );
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // hideLoadingDialog();
        if (jsondata["status"] == true) {
          showInSnackBar(jsondata["message"]);
        } else {
          showInSnackBar(jsondata["message"], color: Colors.red);
        }
        getapplyUniversity();
      } else {
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
      hideLoadingDialog();
    } catch (e) {
      print(e.toString());
      hideLoadingDialog();
    }
  }
}
