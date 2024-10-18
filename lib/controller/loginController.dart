import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visatree/Widgets/alertBoxes.dart';
import 'package:visatree/screens/homeScrenn/curvedbutton.dart';
import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/images.dart';
import 'package:visatree/util/session%20management.dart';





class LoginController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;
  var statusCode = 200.obs;
  SessionManagement sharedPreference = SessionManagement();
  String token = "";

  login(String username, String password, BuildContext context) async {
    showLoadingDialog();
    SharedPreferences pres = await SharedPreferences.getInstance();
    String? token = await FirebaseMessaging.instance.getToken();
    print("token=================");
    print(token);
    print("token=================");
    isLogin.value == true;
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.login),
        body: {
          'email': username,
          'password': password,
          'device_token': token ?? ''
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["status"] == true) {
          sharedPreference.settoken(data["token"]);
          sharedPreference.setuserid(data["student"]["id"].toString());
          sharedPreference
              .setfirstname(data["student"]["firstname"].toString());
          sharedPreference.setlastname(data["student"]["lastname"].toString());
          sharedPreference.setemail(data["student"]["email"].toString());
          sharedPreference.setage(data["student"]["age"].toString());
          sharedPreference.setgender(data["student"]["gender"].toString());
          sharedPreference.setphone(data["student"]["phone"].toString());
          sharedPreference
              .setimage(data["student"]["student_profile"].toString());
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Column(
              children: [
                Image.asset(
                  images.logomain,
                  height: 100,
                ),
                Text(
                  '${data['message']}',
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
          isLogin.value = false;
          pres.setBool("login", true);
          Get.off(() => const RootWidget());
        } else {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Column(
              children: [
                Image.asset(
                  images.appicon,
                  height: 100,
                ),
                Text(
                  '${data['message']}',
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
        }
      }
    } catch (e) {
      isLogin.value = false;
      print(e.toString());
    }
  }
}
