import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/alertBoxes.dart';
import 'package:visatree/model/eventmodel.dart';
import 'package:visatree/screens/curvedbutton.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/snackbar.dart';
import 'package:visatree/util/images.dart';

class EventController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var EventList = [].obs;
  SessionManagement share = SessionManagement();
  var isLogin = false.obs;

  getEvent() async {
    print(ApiUrl.getevent);
    String token = await share.istoken();
    EventList.value = [];
    isLoading.value = true;
    try {
      var response = await http.get(Uri.parse(ApiUrl.getevent),
          headers: {"Authorization": "Bearer $token"});
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          EventModel getproject =
              EventModel.fromJson(jsonDecode(response.body));
          EventList.addAll(getproject.events);
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

  RegisterEvent(String eventid, BuildContext context) async {
    showLoadingDialog();
    String token = await share.istoken();
    String id = await share.isuserid();
    String name = await share.isfirstname();
    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.baseurl}evet/store"),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "student_id": id,
          "event_id": eventid,
        },
      );
      if (response.statusCode == 200) {
        Get.off(() => const RootWidget());
        print(response.statusCode);
        print(id);
        print(eventid);
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["status"] == true) {
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
                    '' + data['message']!,
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
          getEvent();
          hideLoadingDialog();
          Navigator.pop(context);
        } else {
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
                    '' + data['message']!,
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
          Get.off(() => const RootWidget());


        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
