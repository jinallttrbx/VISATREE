import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/Widgets/alertBoxes.dart';
import 'package:visatree/Widgets/snackbar.dart';
import 'package:visatree/model/getdocument.dart';
import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/session%20management.dart';

class DocumentController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
  var DocumentList = [].obs;
  SessionManagement share = SessionManagement();

  List<Document> _documentList = [];

  List<Document> get documentList => _documentList;

  getuploadeddocument() async {
    String token = await share.istoken();
    DocumentList.value = [];
    _documentList = [];
    isLoading.value = true;
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse("${ApiUrl.baseurl}get_upload_pdfs"),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetDocumentModel getdocument = GetDocumentModel.fromJson(jsondata);
          DocumentList.value = getdocument.document;
          _documentList.addAll(getdocument.document);
          hideLoadingDialog();
          isLoading.value = false;
          update();
        } else {
          hideLoadingDialog();
          isLoading.value = false;
        }
      } else {
        hideLoadingDialog();
        isLoading.value = false;
        showInSnackBar(jsondata["message"], color: Colors.red);
      }
    } catch (e) {
      isLoading.value = false;
      showInSnackBar("Error Occured", color: Colors.red);
      hideLoadingDialog();
    }
    update();
  }
}
