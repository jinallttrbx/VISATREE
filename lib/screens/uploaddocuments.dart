import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/util/images.dart';

import '../ShowDocumentlist.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({super.key});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
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
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    var header = {"Authorization": "Bearer $token"};

    // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
    var apiUrl =
        Uri.parse(ApiUrl.uploadpdf);

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
      return true;
    } else {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            boldtext(Colors.white, 18, "Upload Document"),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(ViewDocument());
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.calendar_view_month_outlined),
            ),
          )
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
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
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 18 / 13,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 0.0,
            ),
            itemCount: choices.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () async {
                    final data = await selectPDFFile();
                    if (index == 0) {
                      sopFile = data;
                    } else if (index == 1) {
                      lorFile = data;
                    } else if (index == 2) {
                      examFile = data;
                    } else if (index == 3) {
                      cetificateFile = data;
                    } else if (index == 4) {
                      resumeFile = data;
                    } else {
                      passportFile = data;
                    }
                    setState(() {});
                  },
                  child: SelectCard(
                    choice: choices[index],
                    id: choices[index].id.toString(),
                    file: index == 0
                        ? sopFile
                        : index == 1
                            ? lorFile
                            : index == 2
                                ? examFile
                                : index == 3
                                    ? cetificateFile
                                    : index == 4
                                        ? resumeFile
                                        : passportFile,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [

                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor),
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
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({
    required this.title,
    required this.id,
  });
  final String title;
  final int id;
}

const List<Choice> choices = <Choice>[
  Choice(
    id: 0,
    title: 'SOP',
  ),
  Choice(
    id: 1,
    title: 'LOR',
  ),
  Choice(
    id: 2,
    title: 'EXAM',
  ),
  Choice(
    id: 3,
    title: 'CERTIFICATES',
  ),
  Choice(
    id: 4,
    title: 'RESUME',
  ),
  Choice(
    id: 5,
    title: 'PASSPORT',
  ),
];

class SelectCard extends StatelessWidget {
  const SelectCard(
      {Key? key, required this.choice, required this.id, this.file})
      : super(key: key);
  final String id;
  final Choice choice;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor2,
              ]),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            choice.title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          file != null
              ? const Icon(
                  Icons.verified_outlined,
                  color: Colors.white,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
