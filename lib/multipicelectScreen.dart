import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:visatreenew/Widgets/alertBoxes.dart';
import 'package:visatreenew/Widgets/const_text.dart';
import 'package:visatreenew/controller/ProfileController.dart';
import 'package:visatreenew/controller/documentcontroller.dart';
import 'package:visatreenew/screens/ProfileScreen/ShowDocumentlist.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/appcontants.dart';
import 'package:visatreenew/util/images.dart';
import 'package:visatreenew/util/session%20management.dart';
import 'package:http/http.dart' as http;
import 'model/GetDicumentlistmodel.dart';

// class UploadDocumentScreen extends StatefulWidget {
//   @override
//   State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
// }
//
// class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
//   final Map<String, File?> selectedFiles = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Document"),
//         backgroundColor: AppColors.primaryColor,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: GetX<DocumentController>(builder: (controller){
//           return Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(12),
//                 child: Text(
//                   'Note: Upload only in PDF format',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               GetX<DocumentController>(builder: (controller) {
//                 return GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 18 / 13,
//                     mainAxisSpacing: 10.0,
//                   ),
//                   itemCount: controller.DocumentListupload.length,
//                   itemBuilder: (context, index) {
//                     final doc = controller.DocumentListupload[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: SelectCard(
//                         choice: doc,
//                         file: selectedFiles[doc.type],
//                         uploaded: doc.uploaded,
//                         onFileSelected: (file) {
//                           setState(() {
//                             selectedFiles[doc.type] = file;
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }),
//               controller.DocumentListupload.isNotEmpty &&
//                   controller.DocumentListupload[0].url == null
//                   ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primaryColor,
//                           ),
//                           onPressed:  () async {
//                             await sendFile(selectedFiles);
//                           }
//                              ,
//                           child: const Text("Upload Document"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//                   : SizedBox.shrink(),
//             ],
//           );
//         },)
//       ),
//     );
//   }
//
//   Future<bool> sendFile(Map<String, File?> selectedFiles) async {
//     SessionManagement share = SessionManagement();
//     String token = await share.istoken();
//     var header = {"Authorization": "Bearer $token"};
//
//     var apiUrl = Uri.parse(ApiUrl.uploadpdf);
//     var request = http.MultipartRequest('POST', apiUrl);
//
//     // Mapping document type to corresponding API field name
//     Map<String, String> fieldNameMapping = {
//       'sop': 'pdf_file_sop',
//       'lor': 'pdf_file_lor',
//       'exam': 'pdf_file_exam',
//       'certification': 'pdf_file_certification',
//       'resume': 'pdf_file_resume',
//       'passport': 'pdf_file_passport',
//     };
//
//     // Loop over selectedFiles and add to request
//     selectedFiles.forEach((docType, file) async {
//       if (file != null && fieldNameMapping.containsKey(docType)) {
//         request.files.add(await http.MultipartFile.fromPath(fieldNameMapping[docType]!, file.path));
//       }
//     });
//
//     request.headers.addAll(header);
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         duration: const Duration(seconds: 2),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(images.logomain, height: 60),
//             const Text("Document Updated Successfully", style: TextStyle(fontSize: 18)),
//           ],
//         ),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         margin: const EdgeInsets.all(16),
//       ));
//       Navigator.pop(context);
//       return true;
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         duration: const Duration(seconds: 2),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(images.logomain, height: 60),
//             const Text("Failed to Upload Documents", style: TextStyle(fontSize: 18)),
//           ],
//         ),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         margin: const EdgeInsets.all(16),
//       ));
//       return false;
//     }
//   }
//
// }
//
// class SelectCard extends StatelessWidget {
//   final Document choice;
//   final File? file;
//   final bool uploaded;
//   final Function(File file) onFileSelected;
//
//   const SelectCard({
//     Key? key,
//     required this.choice,
//     required this.file,
//     required this.uploaded,
//     required this.onFileSelected,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     bool hasUrl = choice.url != null && choice.url!.isNotEmpty;
//     bool hasFile = file != null;
//
//     return Container(
//       height: 120,
//       width: 100,
//       margin: const EdgeInsets.all(6),
//       decoration: BoxDecoration(
//         color: Colors.deepPurple,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   choice.type,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 8),
//                 if (hasFile && !uploaded)
//                   const Icon(Icons.check_circle, color: Colors.white, size: 28),
//               ],
//             ),
//           ),
//
//           // Upload / Edit Button
//           Positioned(
//             top: 4,
//             right: 4,
//             child: GestureDetector(
//               onTap: () async {
//                 final selected = await selectPDFFile();
//                 if (selected != null) {
//                   onFileSelected(selected); // Notify parent
//                 }
//               },
//               child: Icon(
//                 hasFile || hasUrl ? Icons.edit : Icons.upload_file,
//                 color: Colors.white,
//                 size: 22,
//               ),
//             ),
//           ),
//
//           // View icon
//           if (hasUrl && uploaded)
//             Positioned(
//               bottom: 4,
//               right: 4,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => PDFScreen(
//                       url: choice.url!,
//                       name: choice.type.toUpperCase(),
//                     ),
//                   ));
//                 },
//                 child: const Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 22),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Future<File?> selectPDFFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//     if (result != null && result.files.single.extension == 'pdf') {
//       return File(result.files.single.path!);
//     }
//     return null;
//   }
// }

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(home: UploadDocumentScreen()));

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Dummy Controllers and Api URL

// Your actual screen


class UploadDocumentScreen extends StatefulWidget {
  final String title;

  UploadDocumentScreen({super.key, required this.title});

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  final documentController = Get.put(DocumentController());
  final profileController = Get.put(ProfileController());
  final Map<String, File?> selectedFiles = {};

  @override
  void initState() {
    super.initState();
    documentController.getdocument();
  }

  bool get allFilesSelected =>
      selectedFiles.length == documentController.DocumentListupload.length &&
      selectedFiles.values.every((file) => file != null);

  void pickFile(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.extension == 'pdf') {
      setState(() {
        selectedFiles[docType] = File(result.files.single.path!);
      });
    }
  }

  void pickFileAndUpdate(String docType, Document docData) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.extension == 'pdf') {
      setState(() {
        selectedFiles[docType] = File(result.files.single.path!);
      });

      await updateSingleDocument(context, docData, docType);
    }
  }
  String getFieldNameForDocType(String docType) {
    switch (docType.toUpperCase()) {
      case 'SOP': return 'pdf_file_sop';
      case 'LOR': return 'pdf_file_lor';
      case 'English Test': return 'pdf_file_exam';
      case 'Certificates': return 'pdf_file_certification';
      case 'Resume': return 'pdf_file_resume';
      case 'Passport': return 'pdf_file_passport';
      default: return 'unknown';
    }
  }


  Future<bool> updateSingleDocument(BuildContext context, Document document, String docType) async {
    showLoadingDialog(); // Show custom loader

    try {
      // Get token and student ID
      SessionManagement share = SessionManagement();
      String token = await share.istoken();
      String studentId = await share.isuserid() ?? "";

      // API endpoint
      var apiUrl = Uri.parse(ApiUrl.updatedocument);
      var request = http.MultipartRequest('POST', apiUrl);

      // Set headers
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });

      // Add student_id
      request.fields["student_id"] = studentId;

      // Document order and field mapping
      final List<String> docOrder = [
        "SOP",
        "LOR",
        "English Test",
        "Certificates",
        "Resume",
        "Passport"
      ];

      final Map<String, String> fieldMapping = {
        "SOP": "pdf_file_sop",
        "LOR": "pdf_file_lor",
        "English Test": "pdf_file_exam",
        "Certificates": "pdf_file_certification",
        "Resume": "pdf_file_resume",
        "Passport": "pdf_file_passport",
      };

      // Loop through all document types
      for (String docType in docOrder) {
        File? file = selectedFiles[docType];
        String fieldName = fieldMapping[docType]!;


        if (file != null) {
          // New file selected: add as file
          request.files.add(await http.MultipartFile.fromPath(fieldName, file.path));
        } else if (document.url.isNotEmpty) {
          // No new file: use existing filename from URL
          String fileName = document.url.split('/storage/app/public/').last;
          request.fields[fieldName] = fileName;
        } else {
          // Missing both new and old document
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Please select or upload the $docType document."),
          ));
          return false;
        }
      }

      // Send request
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print("UPLOAD RESPONSE: $responseBody");

      hideLoadingDialog();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(images.logomain, height: 100),
              const Text("Document Updated Successfully", style: TextStyle(fontSize: 20)),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 500,
            left: 20,
            right: 20,
          ),
        ));

        Navigator.pop(context);
        documentController.getdocument();
        profileController.getdata();
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to upload documents. Try again."),
        ));
        return false;
      }
    } catch (e) {
      hideLoadingDialog();
      print("UPLOAD ERROR: $e");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong: $e"),
      ));
      return false;
    }
  }


  Future<bool> submitDocuments() async {
    showLoadingDialog(); // Show loader

    try {
      SessionManagement share = SessionManagement();
      String token = await share.istoken();
      String studentId = await share.isuserid() ?? "";

      var apiUrl = Uri.parse("${ApiUrl.uploadpdf}");
      var request = http.MultipartRequest('POST', apiUrl);

      // Headers
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });

      // Attach student_id
      request.fields["student_id"] = studentId;

      // Define the required sequence
      final List<String> docOrder = [
        "SOP",
        "LOR",
        "English Test",
        "Certificates",
        "Resume",
        "Passport"
      ];

      final Map<String, String> fieldMapping = {
        "SOP": "pdf_file_sop",
        "LOR": "pdf_file_lor",
        "English Test": "pdf_file_exam",
        "Certificates": "pdf_file_certification",
        "Resume": "pdf_file_resume",
        "Passport": "pdf_file_passport",
      };

      for (var docType in docOrder) {
        final file = selectedFiles[docType];
        final fieldName = fieldMapping[docType]!;

        if (file == null) {
          hideLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Please select the $docType document."),
          ));
          return false;
        }

        request.files.add(await http.MultipartFile.fromPath(fieldName, file.path));
      }

      // Send request
      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print("UPLOAD RESPONSE BODY: $responseBody");

      hideLoadingDialog();

      if (response.statusCode == 200) {
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
                  "Document Upload Successfully",
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
        documentController.getdocument();
        profileController.getdata();
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to upload documents. Try again."),
        ));
        return false;
      }
    } catch (e) {
      hideLoadingDialog();
      print("UPLOAD ERROR: $e");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong: $e"),
      ));
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
            boldtext(Colors.white, 18, widget.title),
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetX<DocumentController>(
        builder: (controller) {
          final docs = controller.DocumentListupload;

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Note: Upload only PDF files.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                    itemCount: docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 18 / 13,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      final docType = docs[index].type;
                      final selectedFile = selectedFiles[docType];
                      final isSelected = selectedFile != null;
                      final uploaded = docs[index].uploaded;

                      return Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.only(
                                top: 40, left: 8, right: 8, bottom: 12),
                            alignment: Alignment.center,
                            child: boldtext(
                              Colors.white,
                              20,
                              docType,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (uploaded)
                                  IconButton(
                                    icon: const Icon(Icons.remove_red_eye,
                                        color: AppColors.white),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => PDFScreen(
                                            url: docs[index].url,
                                            name:
                                                docs[index].type.toUpperCase(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                IconButton(
                                  icon: Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : uploaded
                                            ? Icons.edit
                                            : Icons.upload_file,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    if (uploaded) {
                                      pickFileAndUpdate(docType, docs[index]);
                                    } else {
                                      pickFile(docType);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              controller.DocumentListupload.isNotEmpty &&
                      controller.DocumentListupload[0].url == null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: allFilesSelected ? submitDocuments : null,
                          // Submit all logic can be added here
                          child: const Text("Upload Documents"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: allFilesSelected
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
