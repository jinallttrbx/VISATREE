import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/Widgets/alertBoxes.dart';
import 'package:visatree/Widgets/snackbar.dart';

import 'package:visatree/model/profilemodel.dart';

import 'package:http/http.dart' as http;
import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/images.dart';
import 'package:visatree/util/session%20management.dart';


class ProfileController extends GetxController {
  var isLoading = true.obs;
  GetProfileModel? profileData;
  var statusCode = 200.obs;
  File? selectedFile;
  var name = "".obs;
  var userName = "".obs;
  var avtar = "".obs;
  SessionManagement share = SessionManagement();

  getdata() async {
    String token = await share.istoken();
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse("${ApiUrl.baseurl}user"),
        headers: {"Authorization": "Bearer $token"},
      );
      Map<String, dynamic> jsondata = jsonDecode(response.body);

      statusCode.value = response.statusCode;
      print(jsondata);
      print("LIST OF PROFIL");
      print(profileData);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetProfileModel getproject =
              GetProfileModel.fromJson(jsonDecode(response.body));
          profileData = getproject;
          print("LIST OF PROFIL");
          print(profileData);
          //  print(profileData!.data!.name);
        } else {
          isLoading.value = false;
        }
      } else {
        isLoading.value = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }

      isLoading.value = false;
    } catch (e) {
      print("Error Occured inside propert Leads");
      showInSnackBar("Error Occured", color: Colors.red);
      print(e.toString());
      isLoading.value = false;
    }
    update();
  }

  EditProfile(
    String firstname,
    String lastname,
    String email,
    String phone,
    String age,
    String gender,
    // String imgPath,
    File? imgPath,
    BuildContext context,
  ) async {
    print( "${ApiUrl.baseurl}students/profile");
    showLoadingDialog();
    String token = await share.istoken();
    try {
      isLoading.value = true;
      var headers = {
        "Authorization": "Bearer $token"
      }; /*,body: {
         // "state_id":state_id
        }*/
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "${ApiUrl.baseurl}students/profile"));
      if (imgPath != null) {
        request.files.add(
            await http.MultipartFile.fromPath('student_profile', imgPath.path));
      }
      request.headers.addAll(headers);
      request.fields["firstname"] = firstname;
      request.fields["lastname"] = lastname;
      request.fields["email"] = email;
      request.fields["phone"] = phone;
      request.fields["age"] = age;
      request.fields["gender"] = gender;
      http.StreamedResponse response = await request.send();
      print("RESPONSE OF USER STATUS CODE ${response.statusCode}");
      print('status code=======>${request.fields}');

      final data = await http.Response.fromStream(response);
      print(data.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        hideLoadingDialog();
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Container(
            //color: Colors.transparent.withOpacity(0.25),
            child: Column(
              children: [
                Image.asset(
                  images.logomain,
                  height: 100,
                ),
                Text(
                  "Profile Update Successfully",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 500,
              right: 20,
              left: 20),
        ));
        print("Profile Update successfully");
        Navigator.pop(context);
        getdata();
        isLoading.value = false;
        update();
      } else {
        isLoading.value=false;
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: Container(
            //color: Colors.transparent.withOpacity(0.25),
            child: Column(
              children: [
                Image.asset(
                  images.logomain,
                  height: 100,
                ),
                Text(
                  "Something Went Wrong",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 500,
              right: 20,
              left: 20),
        ));
        hideLoadingDialog();
        print("Server error");

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print("Error Profile $e");
    }
  }
}
