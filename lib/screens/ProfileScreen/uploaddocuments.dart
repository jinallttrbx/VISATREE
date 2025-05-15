import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/alertBoxes.dart';
import 'package:visatreenew/Widgets/const_text.dart';
import 'package:visatreenew/controller/ProfileController.dart';
import 'package:visatreenew/controller/documentcontroller.dart';
import 'package:visatreenew/model/GetDicumentlistmodel.dart';
import 'package:visatreenew/multipicelectScreen.dart';
import 'package:visatreenew/screens/ProfileScreen/ShowDocumentlist.dart';
import 'package:visatreenew/screens/homeScrenn/curvedbutton.dart';
import 'package:visatreenew/util/ApiUrl.dart';

import 'package:visatreenew/util/appcontants.dart';

import 'package:visatreenew/util/images.dart';
import 'package:visatreenew/util/session%20management.dart';

class UploadDocuments extends StatefulWidget {
  String title;
   UploadDocuments({super.key,required this.title});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  var documentcontroller = Get.put(DocumentController());
  var profilecontroller = Get.put(ProfileController());
  File? sopFile;
  File? lorFile;
  File? examFile;
  File? cetificateFile;
  File? resumeFile;
  File? passportFile;

  Future<File?> selectPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.extension == 'pdf') {
      return File(result.files.single.path!);
    }
    return null;
  }

  Future<bool> sendFile() async {
    showLoadingDialog();
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    var header = {"Authorization": "Bearer $token"};

    // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
    var apiUrl = Uri.parse(ApiUrl.uploadpdf);

    var request = http.MultipartRequest('POST', apiUrl);
    request.files.add(
      await http.MultipartFile.fromPath('pdf_file_sop', sopFile!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath('pdf_file_lor', lorFile!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath('pdf_file_exam', examFile!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
          'pdf_file_certification', cetificateFile!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath('pdf_file_resume', resumeFile!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
          'pdf_file_passport', passportFile!.path),
    );

    request.headers.addAll(header);
    var response = await request.send();

    if (response.statusCode == 200) {
      hideLoadingDialog();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: SizedBox(
          child: Column(
            children: [
              Image.asset(
                images.logomain,
                height: 100,
              ),
              const Text(
                "Document Update Successfully",
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
      Navigator.pop(context);
      documentcontroller.getdocument();
      profilecontroller.getdata();
      return true;
    } else {
      hideLoadingDialog();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: SizedBox(
          child: Column(
            children: [
              Image.asset(
                images.logomain,
                height: 100,
              ),
              const Text(
                "Fail to Update Documents",
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
      Navigator.pop(context);
      return false;
    }
  }

  String getFieldNameByType(String type) {
    switch (type.toLowerCase()) {
      case 'sop':
        return 'pdf_file_sop';
      case 'lor':
        return 'pdf_file_lor';
      case 'exam score':
        return 'pdf_file_exam';
      case 'certificate':
        return 'pdf_file_certification';
      case 'resume':
        return 'pdf_file_resume';
      case 'passport':
        return 'pdf_file_passport';
      default:
        return 'file'; // fallback
    }
  }

  @override
  void initState() {
    documentcontroller.getdocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            boldtext(Colors.white, 18, widget.title),
          ],
        ),
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     Get.to(ViewDocument());
          //   },
          //   child: const Padding(
          //     padding: EdgeInsets.all(10),
          //     child: Icon(Icons.calendar_view_month_outlined),
          //   ),
          // )
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              '\nNote : upload only in PDF Format\n ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            GetX<DocumentController>(builder: (controller) {
              return Container(
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 18 / 13,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 0.0,
                      ),
                      itemCount: controller.DocumentListupload.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () async {
                              if (controller.DocumentListupload[index].url != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PDFScreen(
                                      url: controller.DocumentListupload[index].url,
                                      name: controller.DocumentListupload[index].type.toUpperCase(),
                                    ),
                                  ),
                                );
                              } else {
                                final data = await selectPDFFile();
                                if (controller.DocumentListupload[index].type == "SOP") {
                                  sopFile = data;
                                } else if (controller.DocumentListupload[index].type == "LOR") {
                                  lorFile = data;
                                } else if (controller.DocumentListupload[index].type == "English Test") {
                                  examFile = data;
                                } else if (controller.DocumentListupload[index].type == "Certificates") {
                                  cetificateFile = data;
                                } else if (controller.DocumentListupload[index].type == "Resume") {
                                  resumeFile = data;
                                } else {
                                  passportFile = data;
                                }
                                setState(() {});
                              }
                            },
                            child: SelectCard(
                              choice: controller.DocumentListupload[index],
                              type: controller.DocumentListupload[index].type,
                              file: controller.DocumentListupload[index].type == "SOP"
                                  ? sopFile
                                  : controller.DocumentListupload[index].type == "LOR"
                                  ? lorFile
                                  : controller.DocumentListupload[index].type == "English Test"
                                  ? examFile
                                  : controller.DocumentListupload[index].type == "Certificates"
                                  ? cetificateFile
                                  : controller.DocumentListupload[index].type == "Resume"
                                  ? resumeFile
                                  : passportFile,
                              uploded: controller.DocumentListupload[index].uploaded,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    controller.DocumentListupload.isNotEmpty &&
                        controller.DocumentListupload[0].url == null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                onPressed: (sopFile != null &&
                                    lorFile != null &&
                                    examFile != null &&
                                    cetificateFile != null &&
                                    resumeFile != null &&
                                    passportFile != null)
                                    ? () async {
                                  await sendFile();
                                }
                                    : null,
                                child: const Text("Upload Document"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : SizedBox.shrink(),
                  ],
                ),
              );
            }),
          ],
        ),
      )

    );
  }

  Future<void> updateSingleDocument(BuildContext context, Document documentlist) async {
    showLoadingDialog();
    print(ApiUrl.updatedocument);
    var documentcontroller = Get.put(DocumentController());
    var profilecontroller=Get.put(ProfileController());
    SessionManagement share = SessionManagement();
    var token = await share.istoken();
    var studentid = await share.isuserid();
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${ApiUrl.updatedocument}"),
      );
      request.headers.addAll(
          {"Authorization": "Bearer $token", "Accept": "Application/json"});

      // Adding form fields
      request.fields["student_id"] = studentid ?? "";

      if (sopFile != null) {
        request.files.add(
            await http.MultipartFile.fromPath('pdf_file_sop', sopFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_sop"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }

      if (lorFile != null) {
        request.files.add(
            await http.MultipartFile.fromPath('pdf_file_lor', lorFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_lor"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (examFile != null) {
        request.files.add(
            await http.MultipartFile.fromPath('pdf_file_exam', examFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_exam"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (cetificateFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pdf_file_certification', cetificateFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_certification"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (resumeFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pdf_file_resume', resumeFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_resume"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (passportFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pdf_file_passport', passportFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_passport"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }

      // Sending the request
      var response = await request.send();
      print("UPDATE DOCUMENT RESPONSE ${response.statusCode}${studentid}");

      // Reading the response
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);

      if (jsonResponse["status"] == true) {
        hideLoadingDialog();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          content: SizedBox(
            child: Column(
              children: [
                Image.asset(
                  images.logomain,
                  height: 100,
                ),
                const Text(
                  "Document Update Successfully",
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
        documentcontroller.getdocument();
        profilecontroller.getdata();

      } else {
        EasyLoading.dismiss();
        // Handle failure response
      }
    } catch (e) {
      EasyLoading.dismiss();
    }
  }
}

class SelectCard extends StatelessWidget {
  SelectCard(
      {Key? key,
      required this.choice,
      required this.type,
      this.file,
      required this.uploded})
      : super(key: key);
  final String type;
  final Document choice;
  final File? file;
  bool uploded;
  File? sopFile;
  File? lorFile;
  File? examFile;
  File? cetificateFile;
  File? resumeFile;
  File? passportFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [

          // Edit icon at top right
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () async {
                final data = await selectPDFFile();
                if (choice.type == "SOP") {
                  sopFile = data;
                } else if (choice.type ==
                    "LOR") {
                  lorFile = data;
                } else if (choice.type ==
                    "English Test") {
                  examFile = data;
                } else if (choice.type ==
                    "Certificates") {
                  cetificateFile = data;
                } else if (choice.type ==
                    "Resume") {
                  resumeFile = data;
                } else {
                  passportFile = data;
                }
                await updateSingleDocument(context, choice);
              },
              child: choice.uploaded==true?Row(
                children: [
                  Text("",style: TextStyle(fontSize: 10,color: AppColors.white),),
                  Icon(Icons.edit, color: Colors.white, size: 20)
                ],
              ):Icon(Icons.upload, color: Colors.white, size: 20),
            ),
          ),
          Positioned(
            top: 4,
            right: 30,

            child: GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(
                      url: choice.url,
                      name: choice.type.toUpperCase(),
                    ),
                  ),
                );
              },
              child: choice.uploaded==true?Row(
                children: [
                  Text("",style: TextStyle(fontSize: 10,color: AppColors.white),),
                  Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 20)
                ],
              ):SizedBox.shrink()
            ),
          ),

          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  choice.type,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (file != null)
                  const Icon(Icons.verified_outlined, color: Colors.white),
              ],
            ),
          ),

          // View icon at bottom right
          // if (choice.uploaded == true)
          //   Positioned(
          //     bottom: 6,
          //     right: 6,
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => PDFScreen(
          //               url: choice.url,
          //               name: choice.type.toUpperCase(),
          //             ),
          //           ),
          //         );
          //       },
          //       child:  Row(
          //         children: [
          //           Text("View",style: TextStyle(fontSize: 10,color: AppColors.white),),
          //           Icon(Icons.visibility,
          //               color: Colors.white70, size: 22),
          //         ],
          //       )
          //     ),
          //   ),

          // Upload button at bottom center
        ],
      ),
    );
  }

  Future<void> updateSingleDocument(BuildContext context, Document documentlist) async {
    print(ApiUrl.updatedocument);
    var documentcontroller = Get.put(DocumentController());
    SessionManagement share = SessionManagement();
    var token = await share.istoken();
    var studentid = await share.isuserid();
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${ApiUrl.updatedocument}"),
      );
      request.headers.addAll(
          {"Authorization": "Bearer $token", "Accept": "Application/json"});

      // Adding form fields
      request.fields["student_id"] = studentid ?? "";

      if (sopFile != null) {
        request.files.add(
            await http.MultipartFile.fromPath('pdf_file_sop', sopFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_sop"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }

      if (lorFile != null) {
        request.files.add(
            await http.MultipartFile.fromPath('pdf_file_lor', lorFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_lor"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (examFile != null) {
        request.files.add(
            await http.MultipartFile.fromPath('pdf_file_exam', examFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_exam"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (cetificateFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pdf_file_certification', cetificateFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_certification"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (resumeFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pdf_file_resume', resumeFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_resume"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }
      if (passportFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'pdf_file_passport', passportFile!.path));
      } else if (documentlist?.url != null && documentlist?.url == "") {
        request.fields["pdf_file_passport"] =
            documentlist?.url.split('/storage/app/public/').last ?? "";
      }

      // Sending the request
      var response = await request.send();
      print("UPDATE DOCUMENT RESPONSE ${response.statusCode}${studentid}");

      // Reading the response
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);

      if (jsonResponse["status"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          content: SizedBox(
            child: Column(
              children: [
                Image.asset(
                  images.logomain,
                  height: 100,
                ),
                const Text(
                  "Document Update Successfully",
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
        Navigator.pop(context);
      } else {
        EasyLoading.dismiss();
        // Handle failure response
      }
    } catch (e) {
      EasyLoading.dismiss();
    }
  }

  Future<File?> selectPDFFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.extension == 'pdf') {
      return File(result.files.single.path!);
    }
    return null;
  }
}
