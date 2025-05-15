import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/alertBoxes.dart';
import 'package:visatreenew/screens/authentication/loginscreen.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/session%20management.dart';
import 'package:visatreenew/util/images.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  SessionManagement share = SessionManagement();

  Changepassword(String oldpassword, String password, String confirmpassword,
      BuildContext context) async {
    showLoadingDialog();
    String token = await share.istoken();
    String id = await share.isuserid();
    String name = await share.isfirstname();
    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.baseurl}change-password"),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "old_password": oldpassword,
          "password": password,
          "c_password": confirmpassword,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["status"] == true) {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: Container(
              child: Column(
                children: [
                  Image.asset(
                    images.logomain,
                    height: 100,
                  ),
                  Text(
                    '' + data['message']!,
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
          Get.to(const LoginScreen());
        } else {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
              child: Column(
                children: [
                  Image.asset(
                    images.logomain,
                    height: 100,
                  ),
                  Text(
                    '' + data['message']!,
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
      } else if (response.statusCode == 401) {
        hideLoadingDialog();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Current password does not match.!"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {}
  }
}
