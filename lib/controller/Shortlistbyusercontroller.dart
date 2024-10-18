// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:visatree/alertBoxes.dart';
// import 'package:visatree/model/GetShortListUniversity.dart';
// import 'package:visatree/model/getdocument.dart';
// import 'package:visatree/session%20management.dart';
// import 'package:visatree/snackbar.dart';
//
// class ShortByuserController extends GetxController {
//   var isLoading = false.obs;
//   var statusCode = 200.obs;
//   var DocumentList = [].obs;
//   SessionManagement share = SessionManagement();
//
//    ShortListedUniversityModel? shortlistuniversity;
//   ShortListedUniversityModel get document => shortlistuniversity!;
//
//
//
//   getShortUniversity() async {
//     String token = await share.istoken();
//     DocumentList.value = [];
//     // _document = null;
//     showLoadingDialog();
//     try {
//       var response = await http.get(
//         Uri.parse('https://newvisatree.lttrbxtech.com/api/getuniversity_by_shortlist'),
//         headers: {"Authorization": "Bearer $token"},
//       );
//       statusCode.value = response.statusCode;
//       print(response.statusCode);
//       print(response.body);
//       final jsondata = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         if (jsondata["status"] == true) {
//           final data = ShortListedUniversityModel.fromJson(jsondata);
//           shortlistuniversity = data;
//
//           print(jsondata);
//           update();
//           hideLoadingDialog();
//         } else {
//           hideLoadingDialog();
//         }
//       } else {
//         hideLoadingDialog();
//         showInSnackBar(jsondata["message"], color: Colors.red);
//       }
//     } catch (e) {
//       print(e);
//       showInSnackBar("Error Occured", color: Colors.red);
//       hideLoadingDialog();
//     }
//     update();
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:visatree/Widgets/alertBoxes.dart';
import 'package:visatree/Widgets/snackbar.dart';

import 'package:visatree/model/GetScholarshioModel.dart';
import 'package:visatree/model/GetShortListUniversity.dart';
import 'package:visatree/model/adminsortlisted.dart';
import 'package:visatree/model/getScholarShipModel.dart';

import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/images.dart';
import 'package:visatree/util/session%20management.dart';

class ShortByuserController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var shortbyuser = [].obs;
  var shortbyadmin = [].obs;
  SessionManagement share = SessionManagement();



  getShortUniversity() async {
    String token = await share.istoken();
    shortbyuser.value = [];
    isLoading.value = true;
    showLoadingDialog();


    try {
      var response = await http.get(
        Uri.parse("${ApiUrl.shorlistbyuser}"),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      print(statusCode);
      print(token);
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {

        if (jsondata["status"] == true) {
          ShortListedUniversityModel getproject =
          ShortListedUniversityModel.fromJson(jsonDecode(response.body));
          print(response.body);
          for (var i = 0; i < getproject.university!.length; i++) {

            shortbyuser.value.add(ShortUniversity(
                id: getproject.university[i].id,
                university: getproject.university[i].university,
                countryName: getproject.university[i].countryName,
                gre: getproject.university[i].gre,
                toefl: getproject.university[i].toefl,
                ielts: getproject.university[i].ielts,
                universityImage: getproject.university[i].universityImage,
                duration: getproject.university[i].duration,
                fees: getproject.university[i].fees,
                level: getproject.university[i].level,
                program: getproject.university[i].program,
                course: getproject.university[i].course,
                universityBanner: getproject.university[i].universityBanner,
                image: getproject.university[i].image??"",
                levelId: getproject.university[i].levelId,
                programId: getproject.university[i].programId,
                courseId: getproject.university[i].courseId,
                description: getproject.university[i].description,
                countryId: getproject.university[i].countryId,
                rank: getproject.university[i].rank,
                gmat: getproject.university[i].gmat,
                gpa: getproject.university[i].gpa,
                category: getproject.university[i].category,
                createdAt: getproject.university[i].createdAt,
                updatedAt: getproject.university[i].updatedAt,
                isApplied: getproject.university[i].isApplied,
                isShortlist: getproject.university[i].isShortlist

            ));
            print(getproject.university.length);
          }
          hideLoadingDialog();
          isLoading.value= false;
        } else {
          hideLoadingDialog();
          isLoading.value= false;
        }
      } else {
        hideLoadingDialog();
        isLoading.value = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      showInSnackBar("Error Occured", color: Colors.red);
      isLoading.value = false;
      hideLoadingDialog();
    }
  }

  getadminShortUniversity() async {
    print(ApiUrl.adminsort);
    String token = await share.istoken();
    shortbyadmin.value = [];
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
            shortbyadmin.value.add(Shortlistdata(
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
              // description: getproject.shortlist[i].description,
              // countryId: getproject.shortlist[i].countryId,
              // rank: getproject.shortlist[i].rank,
              // gmat: getproject.shortlist[i].gmat,
              // gpa: getproject.shortlist[i].gpa,
              // category: getproject.shortlist[i].category,
              // createdAt: getproject.shortlist[i].createdAt,
              // updatedAt: getproject.shortlist[i].updatedAt,
              // isApplied: getproject.shortlist[i].isApplied,
              // isShortlist: getproject.shortlist[i].isShortlist

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
        isLoading.value = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      showInSnackBar("Error Occured", color: Colors.red);
      isLoading.value = false;
      hideLoadingDialog();
    }
  }




}
