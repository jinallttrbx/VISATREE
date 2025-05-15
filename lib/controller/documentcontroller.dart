import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/alertBoxes.dart';
import 'package:visatreenew/Widgets/snackbar.dart';
import 'package:visatreenew/model/GetDicumentlistmodel.dart';
import 'package:visatreenew/model/getdocument.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/session%20management.dart';

class DocumentController extends GetxController {
  var isLoading = false.obs;
  var statusCode = 200.obs;
   var DocumentList = [].obs;
  var DocumentListupload = [].obs;
  SessionManagement share = SessionManagement();

 // List<Document> _documentList = [];

 // List<Document> get documentList => _documentList;

  // getuploadeddocument() async {
  //   String token = await share.istoken();
  //   DocumentList.value = [];
  //
  //   isLoading.value = true;
  //   showLoadingDialog();
  //   try {
  //     var response = await http.get(
  //       Uri.parse("${ApiUrl.baseurl}get_upload_pdfs"),
  //       headers: {"Authorization": "Bearer $token"},
  //     );
  //     statusCode.value = response.statusCode;
  //     Map<String, dynamic> jsondata = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (jsondata["status"] == true) {
  //         GetDocumentModel getdocument = GetDocumentModel.fromJson(jsondata);
  //         DocumentList.value = getdocument.document;
  //
  //         hideLoadingDialog();
  //         isLoading.value = false;
  //         update();
  //       } else {
  //         hideLoadingDialog();
  //         isLoading.value = false;
  //       }
  //     } else {
  //       hideLoadingDialog();
  //       isLoading.value = false;
  //       showInSnackBar(jsondata["message"], color: Colors.red);
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     showInSnackBar("Error Occured", color: Colors.red);
  //     hideLoadingDialog();
  //   }
  //   update();
  // }

  getdocument() async {
    String token = await share.istoken();
    DocumentListupload.value = [];

    isLoading.value = true;
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse("${ApiUrl.baseurl}check_document_uploaded"),
        headers: {"Authorization": "Bearer $token"},
      );
      statusCode.value = response.statusCode;
      Map<String, dynamic> jsondata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsondata["status"] == true) {
          GetDocumentListModel getdocument = GetDocumentListModel.fromJson(jsondata);
          DocumentListupload.value = getdocument.documents;

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


  void setLocalFile(int index, File file) {
    DocumentListupload[index].localFile = file;
    DocumentListupload.refresh();
  }



}
