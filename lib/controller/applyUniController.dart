import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/alertBoxes.dart';
import 'package:visatreenew/Widgets/snackbar.dart';
import 'package:visatreenew/model/applyuniversity.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/session%20management.dart';

class ApplyUniController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var applyuniversitylist = [].obs;
  SessionManagement share = SessionManagement();
  List<Applyunilist> _appliedUniversityList = [];

  List<Applyunilist> get appliedUniversityList => _appliedUniversityList;

  getapplyUniversity() async {
    String token = await share.istoken();
    applyuniversitylist.value = [];
    _appliedUniversityList = [];
    isLoading.value = true;
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse("${ApiUrl.baseurl}applyunilist"),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          ApplyUniversityModel getproject =
              ApplyUniversityModel.fromJson(jsondata);
          applyuniversitylist.value = getproject.applyunilist;
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
        Uri.parse("${ApiUrl.baseurl}applyunilistdelete/$uniid"),
        headers: {"Authorization": "Bearer $token"},
      );
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
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
      hideLoadingDialog();
    }
  }
}
