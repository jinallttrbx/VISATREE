import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/alertBoxes.dart';
import 'package:visatree/util/images.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/controller/Shortlistbyusercontroller.dart';
import 'package:visatree/controller/documentcontroller.dart';
import 'package:visatree/controller/homeController.dart';
import 'package:visatree/model/getLevellModel.dart';
import 'package:visatree/model/getProgramCourse.dart';
import 'package:visatree/model/getlevelprogram.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/session%20management.dart';

class AdminShortlisted extends StatefulWidget {
  AdminShortlisted({super.key});

  @override
  State<AdminShortlisted> createState() => _AdminShortlistedState();
}

class _AdminShortlistedState extends State<AdminShortlisted> {
  ShortByuserController universityController = Get.find<ShortByuserController>();
  @override
  void initState() {
    super.initState();
    universityController.getadminShortUniversity();
    universityController.shortbyadmin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: universityController.shortbyadmin.isEmpty?
    Container(
      height: MediaQuery.of(context).size.height/2,
      child: const Center(child: Text("No Suggested Universities"),),):
   RefreshIndicator(child:  ListView.builder(
       itemCount: universityController.shortbyadmin.length,
       shrinkWrap: true,
       itemBuilder: (context, position) {
         return Padding(
           padding: const EdgeInsets.only(top: 15),
           child: Container(
             margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
             decoration: ShapeDecoration(
               color: Colors.white,
               shape: RoundedRectangleBorder(
                 side: const BorderSide(
                     width: 0.50, color: Color(0x7F43749E)),
                 borderRadius: BorderRadius.circular(20),
               ),
               shadows: const [
                 BoxShadow(
                   color: Color(0x3F43749E),
                   blurRadius: 4,
                   offset: Offset(0, 2),
                   spreadRadius: 0,
                 ),
                 BoxShadow(
                   color: Color(0x3F43749E),
                   blurRadius: 4,
                   offset: Offset(2, 0),
                   spreadRadius: 0,
                 ),
                 BoxShadow(
                   color: Color(0x3F43749E),
                   blurRadius: 4,
                   offset: Offset(2, 0),
                   spreadRadius: 0,
                 )
               ],
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ClipRRect(
                   borderRadius: const BorderRadius.only(
                       topLeft: Radius.circular(20),
                       topRight: Radius.circular(20)),
                   child: Image.network(
                     "${universityController.shortbyadmin[position].image}/${universityController.shortbyadmin[position].universityBanner}",
                     height: 150,
                     fit: BoxFit.fitWidth,
                     width: double.infinity,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         universityController
                             .shortbyadmin[position].university,
                         style: const TextStyle(
                           color: Colors.black,
                           fontSize: 18,
                           fontFamily: 'Poppins',
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                       Row(
                         children: [
                           const Icon(Icons.location_on_outlined),
                           Text(
                             universityController.shortbyadmin[position]
                                 .country,
                             style: TextStyle(
                               color: Colors.black
                                   .withOpacity(0.800000011920929),
                               fontSize: 15,
                               fontFamily: 'Poppins',
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                         ],
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10),
                         child: Text(
                           universityController.shortbyadmin[position]
                               .course ??
                               "",
                           style: TextStyle(
                             color: Colors.black
                                 .withOpacity(0.800000011920929),
                             fontSize: 12,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10),
                         child: Text(
                           universityController.shortbyadmin[position]
                               .program ??
                               "",
                           style: TextStyle(
                             color: Colors.black
                                 .withOpacity(0.800000011920929),
                             fontSize: 10,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 10),
                         child: Text(
                           universityController.shortbyadmin[position]
                               .level ??
                               "",
                           style: TextStyle(
                             color: Colors.black
                                 .withOpacity(0.800000011920929),
                             fontSize: 10,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ),
                       const Divider(
                         color: Colors.black,
                       ),
                       const Text(
                         'Eligibility',
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 16,
                           fontFamily: 'Poppins',
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       Row(
                         children: [
                           Expanded(
                             child: Text(
                               'TOEFL : ${universityController.shortbyadmin[position].toefl}',
                               style: TextStyle(
                                 color: Colors.black.withOpacity(
                                     0.800000011920929),
                                 fontSize: 16,
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ),
                           Expanded(
                             child: Text(
                               'IELTS : ${universityController.shortbyadmin[position].ielts}',
                               style: TextStyle(
                                 color: Colors.black.withOpacity(
                                     0.800000011920929),
                                 fontSize: 16,
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ),
                           Expanded(
                             child: Text(
                               'GRE : ${universityController.shortbyadmin[position].gre} ',
                               style: TextStyle(
                                 color: Colors.black.withOpacity(
                                     0.800000011920929),
                                 fontSize: 16,
                                 fontFamily: 'Poppins',
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 // universityController.shortbyadmin[position]?.isApplied ??
                 //     false
                 //     ? Row(
                 //   mainAxisAlignment:
                 //   MainAxisAlignment.center,
                 //   children: const [
                 //     Padding(
                 //       padding: EdgeInsets.all(10.0),
                 //       child: Text(
                 //         "Applied Already",
                 //         style: TextStyle(
                 //           color: AppColors.primaryColor,
                 //           fontWeight: FontWeight.bold,
                 //           fontSize: 16,
                 //         ),
                 //       ),
                 //     ),
                 //   ],
                 // )
                 //:
                 Row(
                   children: [
                     Expanded(
                       child: SizedBox(
                         height: 50,
                         child: ElevatedButton(
                           onPressed: () async {
                             ApplyUniversity(
                                 context,
                                 universityController
                                     .shortbyadmin[
                                 position]
                                     .id
                                     .toString(),
                                 universityController
                                     .shortbyadmin[
                                 position]
                                     .levelId
                                     .toString(),
                                 universityController
                                     .shortbyadmin[
                                 position]
                                     .programId
                                     .toString(),
                                 universityController
                                     .shortbyadmin[
                                 position]
                                     .courseId
                                     .toString());
                           },
                           style: ElevatedButton.styleFrom(
                             backgroundColor:
                             AppColors.primaryColor,
                             shape:
                             const RoundedRectangleBorder(
                               borderRadius:
                               BorderRadius.only(
                                 bottomLeft:
                                 Radius.circular(20),
                                 bottomRight:
                                 Radius.circular(20),
                               ),
                             ),
                           ),
                           child: Text(
                             "Apply Now",
                             style: TextStyle(fontSize: 18),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         );
       }), onRefresh: ()async {
    await universityController.getadminShortUniversity();
   }));
  }

  void ApplyUniversity(BuildContext context, String universityid, String levelid,
      String programid, String courseid) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return AlertDialog(
            title: const Text(
              'Are you sure apply this university ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            content: GetBuilder<allExtraexpemcesController>(
              builder: (listController) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 41,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor2,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: AppColors.primaryColor2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            refresh(() {
                              universityController.getadminShortUniversity();
                              universityController.shortbyadmin;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Go Back"),
                        ),
                      ),
                      Container(
                        height: 41,
                        decoration: ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.50,
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F43749E),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x3F43749E),
                              blurRadius: 4,
                              offset: Offset(2, 0),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x3F43749E),
                              blurRadius: 4,
                              offset: Offset(2, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.50,
                                color: AppColors.primaryColor2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: const Color(0x3F43749E),
                            elevation: 20,
                          ),
                          onPressed: () async {
                            applieduniversity(universityid,levelid,programid,courseid);
                          },
                          child: Text("Apply Now"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  void applieduniversity(String Universityid,String Levelid,String Programid,String Courseid) async {
    SessionManagement share = SessionManagement();
    showLoadingDialog();
    print("User Applied university");
    String token = await share.istoken();
    String id = await share.isuserid();
    String name = await share.isfirstname();
    print("Student ID $id");
    print("Student name $name");
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.applyuni),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "student_id": id,
          "university_id": Universityid,
          "level_id": Levelid,
          "program_id": Programid,
          "course_id": Courseid,
          "applicant_name": name,
        },);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data['status']);
        print(data['message']);
        if (data["status"] == true) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: Container(
              child: Column(
                children: [
                  Image.asset(images.logomain, height: 100,),
                  Text('' + data['message']!, style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .size
                    .height - 500,
                right: 20,
                left: 20),
          ));
          universityController.getadminShortUniversity();
          universityController.shortbyadmin;
          hideLoadingDialog();
        } else {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
            content: Container(
              //color: Colors.transparent.withOpacity(0.25),
              child: Column(
                children: [
                  Image.asset(images.logomain, height: 100,),
                  Text('' + data['message']!, style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .size
                    .height - 500,
                right: 20,
                left: 20),
          ));
          universityController.getadminShortUniversity();
          universityController.shortbyadmin;
          hideLoadingDialog();
          Get.back();
        }
      }
    } catch (e) {
      Get.back();
      print(e.toString());
    }
  }
}
