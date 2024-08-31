
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/controller/loginController.dart';
import 'package:visatree/globalvalues.dart';
import 'package:visatree/model/exammodel.dart';
import 'package:visatree/model/universitymodel.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/snackbar.dart';


class ExamController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var ExamList = [].obs;
  SessionManagement share=SessionManagement();



  getExam() async {


    String token= await share.istoken();
    ExamList.value = [];
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getexam),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          ExamModel getproject = ExamModel.fromJson(
              jsonDecode(response.body));
          for (var i = 0; i < getproject.exam!.length; i++) {
            ExamList.value.add(Examdata(
              id: getproject.exam[i].id,
              exam: getproject.exam[i].exam,
              overview: getproject.exam[i].overview,
              score: getproject.exam[i].score,
              practicePaper: getproject.exam[i].practicePaper,
              registration: getproject.exam[i].registration,
              syllabus: getproject.exam[i].syllabus,
              dates: getproject.exam[i].dates,
              testCenter: getproject.exam[i].testCenter,
              createdAt:getproject.exam[i].createdAt,
              updatedAt: getproject.exam[i].updatedAt,




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