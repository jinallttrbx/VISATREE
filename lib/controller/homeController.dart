import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/snackbar.dart';

import 'package:visatreenew/model/countrymodel.dart';
import 'package:visatreenew/model/getCourseModel.dart';
import 'package:visatreenew/model/getProgramModel.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/session%20management.dart';

class allExtraexpemcesController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var LevelList = [].obs;
  var CountryLevelList = [].obs;
  var LevelProgramList = [].obs;
  var ProgramList = [].obs;
  var CourseList = [].obs;
  var CountryList = [].obs;
  SessionManagement share = SessionManagement();





  List<Program> _programList = [];
  List<Program> get programList => _programList;

  getProgram() async {
    String token = await share.istoken();
    ProgramList.value = [];
    isLoading.value = true;
    _programList = [];
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getprogram),
        headers: {"Authorization": "Bearer $token "},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetProgramModel getproject =
              GetProgramModel.fromJson(jsonDecode(response.body));
          _programList.addAll(getproject.program);
          for (var i = 0; i < getproject.program!.length; i++) {
            ProgramList.value.add(Program(
              id: getproject.program[i].id,
              program: getproject.program[i].program,
              createdAt: getproject.program[i].createdAt,
              updatedAt: getproject.program[i].updatedAt,
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
    update();
  }

  List<Cource> _courseList = [];
  List<Cource> get courseList => _courseList;

  getCourse() async {
    String token = await share.istoken();
    _courseList = [];
    CourseList.value = [];
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getcourse),
        headers: {"Authorization": "Bearer $token "},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetCourseModel getproject =
              GetCourseModel.fromJson(jsonDecode(response.body));
          _courseList.addAll(getproject.cource);
          for (var i = 0; i < getproject.cource.length; i++) {
            CourseList.value.add(Cource(
              id: getproject.cource[i].id,
              course: getproject.cource[i].course,
              createdAt: getproject.cource[i].createdAt,
              updatedAt: getproject.cource[i].updatedAt,
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
    update();
  }

  getCountry() async {
    String token = await share.istoken();
    CountryList.value = [];
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(ApiUrl.getcountry),
        headers: {"Authorization": "Bearer $token "},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetCountryModel getproject =
              GetCountryModel.fromJson(jsonDecode(response.body));
          for (var i = 0; i < getproject.country!.length; i++) {
            CountryList.value.add(Country(
              id: getproject.country[i].id,
              country: getproject.country[i].country,
              createdAt: getproject.country[i].createdAt,
              updatedAt: getproject.country[i].updatedAt,
              flag: getproject.country[i].flag,
              countryImage: getproject.country[i].countryImage,
              discription: getproject.country[i].discription,
              image: getproject.country[i].image,
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

  // getCountryLevel(String countryid) async {
  //   showLoadingDialog();
  //   print("${ApiUrl.getcountrylevel}${countryid}");
  //   String token = await share.istoken();
  //   CountryLevelList.value = [];
  //   isLoading.value = true;
  //   try {
  //     var response = await http.get(
  //       Uri.parse("${ApiUrl.getcountrylevel}${countryid}"),
  //     );
  //     statusCode.value = response.statusCode;
  //     print(statusCode);
  //     Map<String, dynamic> jsondata = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (jsondata["status"] == true) {
  //         GetCountryLevel getproject =
  //             GetCountryLevel.fromJson(jsonDecode(response.body));
  //         print(getproject.data.length);
  //         for (var i = 0; i < getproject.data!.length; i++) {
  //           CountryLevelList.value.add(GetCountryLeveldata(
  //             id: getproject.data[i].id,
  //             level: getproject.data[i].level,
  //             createdAt: getproject.data[i].createdAt,
  //             updatedAt: getproject.data[i].updatedAt,
  //           ));
  //         }
  //         hideLoadingDialog();
  //         isLoading.value = false;
  //       } else {
  //         hideLoadingDialog();
  //         isLoading.value = false;
  //       }
  //     } else {
  //       hideLoadingDialog();
  //       isLoading.value = false;
  //       showInSnackBar(jsondata["message"], color: Colors.red);
  //     }
  //   } catch (e) {
  //     showInSnackBar("Error Occured", color: Colors.red);
  //     isLoading.value = false;
  //   }
  // }
}
