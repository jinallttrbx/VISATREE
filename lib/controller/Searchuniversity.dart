
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/Widgets/alertBoxes.dart';
import 'package:visatree/Widgets/snackbar.dart';

import 'package:visatree/model/GetScholarshioModel.dart';
import 'package:visatree/model/GetSearchUniversity.dart';
import 'package:visatree/model/GetShortListUniversity.dart';
import 'package:visatree/model/adminsortlisted.dart';
import 'package:visatree/model/getScholarShipModel.dart';
import 'package:visatree/util/ApiUrl.dart';

import 'package:visatree/util/images.dart';
import 'package:visatree/util/session%20management.dart';



class SearchUnivercityController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var searchuser = [].obs;

  SessionManagement share = SessionManagement();
  getsearchunivercity(Map<String, dynamic> data, ) async {
    String token = await share.istoken();
    searchuser.value = [];
    isLoading.value = true;
    showLoadingDialog();
    print(ApiUrl.searchuni);
    print(data);
    try {
      var response = await http.post(Uri.parse(ApiUrl.searchuni),
          headers: {"Authorization": "Bearer $token",
            "Accept": "Application/json"
          },
          body: data);
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetSearchUniversity getproject =
          GetSearchUniversity.fromJson(jsonDecode(response.body));
          print(response.body);
          for (var i = 0; i < getproject.data!.length; i++) {
            searchuser.value.add(GetSearchUniversitydata(
              id: getproject.data[i].id,
              university: getproject.data[i].university,
              countryName: getproject.data[i].countryName,
              gre: getproject.data[i].gre,
              toefl: getproject.data[i].toefl,
              ielts: getproject.data[i].ielts,
              universityImage: getproject.data[i].universityImage,
              duration: getproject.data[i].duration,
              fees: getproject.data[i].fees,
              universityBanner: getproject.data[i].universityBanner,
              description: getproject.data[i].description,
              countryId: getproject.data[i].countryId,
              rank: getproject.data[i].rank,
              gmat: getproject.data[i].gmat,
              gpa: getproject.data[i].gpa,
              category: getproject.data[i].category,
              createdAt: getproject.data[i].createdAt,
              updatedAt: getproject.data[i].updatedAt,
              isApplied: getproject.data[i].isApplied,
              levelName: getproject.data[i].levelName,
              courseName: getproject.data[i].courseName,
              programName: getproject.data[i].programName,


            ));
          }
          hideLoadingDialog();
          isLoading.value= false;
        } else {
          hideLoadingDialog();
          isLoading.value= false;
        }
      } else {
        hideLoadingDialog();
        showInSnackBar(jsondata["message"],  );
      }
    } catch (e) {
      print(e.toString());
      hideLoadingDialog();
    }
  }

  // getSearchUniversity(String countryid,String levelid,String programid,String courseid,String universityid,) async {
  //   String token = await share.istoken();
  //   searchuser.value = [];
  //   isLoading.value = true;
  //   showLoadingDialog();
  //   try {
  //     var response = await http.post(
  //       Uri.parse(ApiUrl.searchuni),
  //       body: {
  //         "university_id":universityid.toString(),
  //         "country_id":countryid.toString(),
  //         "level_id":levelid.toString(),
  //         "course_id":courseid.toString(),
  //         "program_id":programid.toString(),
  //       },
  //       headers: {"Authorization": "Bearer $token"},
  //     );
  //     statusCode.value = response.statusCode;
  //     print(statusCode);
  //     print(token);
  //     Map<String, dynamic> jsondata = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (jsondata["status"] == true) {
  //   GetSearchUniversity getproject =
  //   GetSearchUniversity.fromJson(jsonDecode(response.body));
  //         print(response.body);
  //         for (var i = 0; i < getproject.data!.length; i++) {
  //   searchuser.value.add(GetSearchUniversitydata(
  //               id: getproject.data[i].id,
  //               university: getproject.data[i].university,
  //               countryName: getproject.data[i].countryName,
  //               gre: getproject.data[i].gre,
  //               toefl: getproject.data[i].toefl,
  //               ielts: getproject.data[i].ielts,
  //               universityImage: getproject.data[i].universityImage,
  //               duration: getproject.data[i].duration,
  //               fees: getproject.data[i].fees,
  //
  //
  //               universityBanner: getproject.data[i].universityBanner,
  //
  //
  //
  //               description: getproject.data[i].description,
  //               countryId: getproject.data[i].countryId,
  //               rank: getproject.data[i].rank,
  //               gmat: getproject.data[i].gmat,
  //               gpa: getproject.data[i].gpa,
  //               category: getproject.data[i].category,
  //               createdAt: getproject.data[i].createdAt,
  //               updatedAt: getproject.data[i].updatedAt,
  //               isApplied: getproject.data[i].isApplied,
  //   levelName: getproject.data[i].levelName,
  //   courseName: getproject.data[i].courseName,
  //   programName: getproject.data[i].programName,
  //
  //
  //           ));
  //         }
  //         hideLoadingDialog();
  //         isLoading.value= false;
  //       } else {
  //         hideLoadingDialog();
  //         isLoading.value= false;
  //       }
  //     } else {
  //       hideLoadingDialog();
  //       isLoading.value = false;
  //       showInSnackBar(jsondata["message"], color: Colors.red);
  //     }
  //   } catch (e) {
  //     showInSnackBar("Error Occured", color: Colors.red);
  //     isLoading.value = false;
  //     hideLoadingDialog();
  //   }
  // }
  // getuniversity(String countryid,String levelid,String programid,String courseid,String universityid,) async {
  //   print(ApiUrl.searchuni);
  //   SessionManagement share = SessionManagement();
  //   String token = await share.istoken();
  //   final response = await http.post(
  //     Uri.parse(ApiUrl.searchuni),body: {
  //     "university_id":universityid.toString(),
  //     "country_id":countryid.toString(),
  //     "level_id":levelid.toString(),
  //     "course_id":courseid.toString(),
  //     "program_id":programid.toString(),
  //   },
  //     headers: {"Authorization": "Bearer $token"},
  //   );
  //   print(response.statusCode);
  //   print("COUNTRY ID $countryid,");
  //   print( "LEVELID $levelid",);
  //   print( "PROGRAM ID $programid",);
  //   print( "COURSEID $courseid",);
  //   print( "UNIVERSITY ID $universityid",);
  //   print(searchini.length);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     GetSearchUniversity vehicalTypeModel =
  //     GetSearchUniversity.fromJson(jsonDecode(response.body));
  //     searchini = vehicalTypeModel.data;
  //     setState(() {});
  //     print(searchini.length);
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }







}
