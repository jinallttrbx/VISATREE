import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/screens/loginscreen.dart';
import 'package:visatree/snackbar.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;
  var statusCode = 200.obs;

  forgotpassword(String email,BuildContext context) async {
    isLogin.value == true;
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.forgotpassword),
        body: {"email": email},
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200) {

       // if (data["status"] == true) {
          isLogin.value = false;
      //  } else {
          isLogin.value = false;
         // _launchURL();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text(data['message']),
            duration: Duration(seconds: 2),
          ));
        Get.to(LoginScreen());
      //  }
      }else{
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(data['message']),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      isLogin.value = false;
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 2),
      ));
      print(e.toString());
    }
  }

  _launchURL() async {
    final Uri url = Uri.parse(
        '${ApiUrl.BASEURL}reset-password/975954bfe0f3b8ddf0a53a37d74741dd8df7b9d4676f664c3432dabf4f4033ae?email=mehul.lttrbx%40gmail.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
