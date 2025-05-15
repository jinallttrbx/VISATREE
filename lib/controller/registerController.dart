import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visatreenew/Widgets/alertBoxes.dart';

import 'package:visatreenew/screens/homeScrenn/curvedbutton.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/images.dart';
import 'package:visatreenew/util/session%20management.dart';



class RegisterController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;
  var statusCode = 200.obs;
  SessionManagement sharedPreference = SessionManagement();

  login(String username, String password, BuildContext context) async {
    showLoadingDialog();
    SharedPreferences pres = await SharedPreferences.getInstance();
    isLogin.value == true;
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.login),
        body: {
          'email': username,
          'password': password,
        },
      );

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
                left: 20),
          ));
          isLogin.value = false;
          pres.setBool("login", true);
          Get.off(() => const RootWidget());
        } else {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Container(
              //color: Colors.transparent.withOpacity(0.25),
              child: Column(
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
      }
    } catch (e) {
      isLogin.value = false;
      print(e.toString());
    }
  }
  login1(String username, String password, BuildContext context) async {
    showLoadingDialog();
    SharedPreferences pres = await SharedPreferences.getInstance();
    isLogin.value == true;
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.login),
        body: {
          'email': username,
          'password': password,
        },
      );

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
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   duration: const Duration(seconds: 1),
          //   content: Column(
          //     children: [
          //       Image.asset(
          //         images.logomain,
          //         height: 100,
          //       ),
          //       Text(
          //         '${data['message']}',
          //         textAlign: TextAlign.center,
          //         style: const TextStyle(fontSize: 20),
          //       ),
          //     ],
          //   ),
          //   behavior: SnackBarBehavior.floating,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   margin: EdgeInsets.only(
          //       bottom: MediaQuery.of(context).size.height - 500,
          //       right: 20,
          //       left: 20),
          // ));
          isLogin.value = false;
          pres.setBool("login", true);
          Get.off(() => const RootWidget());
        } else {
          hideLoadingDialog();
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   duration: const Duration(seconds: 1),
          //   content: Container(
          //     //color: Colors.transparent.withOpacity(0.25),
          //     child: Column(
          //       children: [
          //         Image.asset(
          //           images.logomain,
          //           height: 100,
          //         ),
          //         Text(
          //           '${data['message']}',
          //           textAlign: TextAlign.center,
          //           style: const TextStyle(fontSize: 20),
          //         ),
          //       ],
          //     ),
          //   ),
          //   behavior: SnackBarBehavior.floating,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   margin: EdgeInsets.only(
          //       bottom: MediaQuery.of(context).size.height - 500,
          //       right: 20,
          //       left: 20),
          // ));
        }
      }
    } catch (e) {
      isLogin.value = false;
      print(e.toString());
    }
  }
  register(String firstname, String lastname, String email, String password,
      String confirmpassword,String phonenumber, BuildContext context) async {
    showLoadingDialog();
    SharedPreferences pres = await SharedPreferences.getInstance();
    isLogin.value == true;
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.register),
        body: {
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "password": password,
          "c_password": confirmpassword,
          "phone":phonenumber
        },
      );

      if (response.statusCode == 400) {
        Map<String, dynamic> data = jsonDecode(response.body);
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
              left: 20),
        ));
        hideLoadingDialog();
      } else if (response.statusCode == 200) {
        print(response.statusCode);
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["status"] == true) {
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
                left: 20),
          ));
          login1(email, password, context);

          isLogin.value = false;
        }
        else if(data["status"] == false){
          isLoading.value=false;
          hideLoadingDialog();
        }
        else {
          hideLoadingDialog();
          isLogin.value = false;
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
                left: 20),
          ));
          hideLoadingDialog();
        }
      }
    } catch (e) {
      isLogin.value = false;
      print(e.toString());
    }
  }
}
