
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/alertBoxes.dart';
import 'package:visatree/controller/loginController.dart';
import 'package:visatree/globalvalues.dart';
import 'package:visatree/model/GetScholarshioModel.dart';
import 'package:visatree/model/exammodel.dart';
import 'package:visatree/model/loginModel.dart';
import 'package:visatree/model/universitymodel.dart';
import 'package:visatree/screens/loginscreen.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/snackbar.dart';
import 'package:visatree/util/images.dart';


class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  SessionManagement share=SessionManagement();








  Changepassword(String oldpassword,String password, String confirmpassword,BuildContext context) async {
    showLoadingDialog();
    print("User Applied university");
    String token= await share.istoken();
    String id= await share.isuserid();
    String name= await share.isfirstname();
    print("Student ID $id");

    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.baseurl}change-password"),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "old_password":oldpassword,
          "password":password,
          "c_password":confirmpassword,

        },);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["status"] == true) {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(

            content: Container(
              //color: Colors.transparent.withOpacity(0.25),
              child: Column(
                children: [
                  Image.asset(images.logomain,height: 100,),
                  Text('' + data['message']!,style: TextStyle(fontSize: 20),),
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
          Get.to(LoginScreen());

        } else {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(

            content: Container(
              //color: Colors.transparent.withOpacity(0.25),
              child: Column(
                children: [
                  Image.asset(images.logomain,height: 100,),
                  Text('' + data['message']!,style: TextStyle(fontSize: 20),),
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
        }
      } else if(response.statusCode==401){
        hideLoadingDialog();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Current password does not match.!"),
          duration: const Duration(seconds: 2),
        ));
      }

    } catch (e) {
      print(e.toString());
    }
  }






}