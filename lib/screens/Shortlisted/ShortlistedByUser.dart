import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

import 'package:visatree/Widgets/alertBoxes.dart';

import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/appcontants.dart';
import 'package:visatree/util/images.dart';
import 'package:visatree/controller/Shortlistbyusercontroller.dart';
import 'package:visatree/controller/documentcontroller.dart';
import 'package:visatree/controller/homeController.dart';
import 'package:visatree/model/getLevellModel.dart';
import 'package:visatree/model/getProgramCourse.dart';
import 'package:visatree/model/getlevelprogram.dart';

import 'package:http/http.dart' as http;

import 'package:visatree/util/session%20management.dart';

class ShortbyUser extends StatefulWidget {
  ShortbyUser({super.key});

  @override
  State<ShortbyUser> createState() => _ShortbyUserState();
}

class _ShortbyUserState extends State<ShortbyUser> {
  ShortByuserController universityController = Get.find<ShortByuserController>();
  @override
  void initState() {
    super.initState();
    universityController.getShortUniversity();
    universityController.shortbyuser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    universityController.shortbyuser.isEmpty?
    Container(
        height: MediaQuery.of(context).size.height/2,
        child: Center(
          child: Text("No Shortlisted Universities Found"),
        )):
    RefreshIndicator(child: ListView.builder(
        itemCount: universityController.shortbyuser.length,
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
                      "${universityController.shortbyuser[position].image}/${universityController.shortbyuser[position].universityBanner}",
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
                              .shortbyuser[position].university,
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
                              universityController.shortbyuser[position]
                                  .countryName,
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.800000011920929),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            universityController.shortbyuser[position].course
                                ??
                                "",
                            style: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.800000011920929),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            universityController.shortbyuser[position]
                                .program ??
                                "",
                            style: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.800000011920929),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            universityController.shortbyuser[position]
                                .level ??
                                "",
                            style: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.800000011920929),
                              fontSize: 16,
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
                                'TOEFL : ${universityController.shortbyuser[position].toefl}',
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
                                'IELTS : ${universityController.shortbyuser[position].ielts}',
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
                                'GRE : ${universityController.shortbyuser[position].gre} ',
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
                  universityController.shortbyuser[position]?.isApplied ??
                      false
                      ? Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Applied Already",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                      : Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              ApplyUniversity(
                                  context,
                                  universityController
                                      .shortbyuser[
                                  position]
                                      .id
                                      .toString(),
                                  universityController
                                      .shortbyuser[
                                  position]
                                      .levelId
                                      .toString(),
                                  universityController
                                      .shortbyuser[
                                  position]
                                      .programId
                                      .toString(),
                                  universityController
                                      .shortbyuser[
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
                              universityController
                                  .shortbyuser[
                              position]
                                  .isApplied ==
                                  true
                                  ? "Already Applied"
                                  : "Apply Now",
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

        }), onRefresh: ()async{
      universityController.getShortUniversity();
      universityController.shortbyuser;
    })
    );

  }

  void ApplyUniversity(BuildContext context, String universityid, String levelid,
      String programid, String courseid) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return AlertDialog(
            title: const Text(
              'Are you sure you want to apply? ',
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
                            refresh(() {});
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
                              side:  BorderSide(
                                width: 0.50,
                                color: AppColors.primaryColor2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: const Color(0x3F43749E),
                            elevation: 20,
                          ),
                          onPressed: () async {
                            SessionManagement share=SessionManagement();
                            showLoadingDialog();
                            print("User Applied university");
                            String token= await share.istoken();
                            String id= await share.isuserid();
                            String name= await share.isfirstname();
                            print("Student ID $id");
                            print("Student name $name");
                            try {
                              final response = await http.post(
                                Uri.parse(ApiUrl.applyuni),
                                headers: {"Authorization": "Bearer $token"},
                                body: {
                                  "student_id":id,
                                  "university_id":universityid,
                                  "level_id":levelid,
                                  "program_id":programid,
                                  "course_id":courseid,
                                  "applicant_name":name,
                                },);

                              print(response.statusCode);
                              print(response.body);
                              if (response.statusCode == 200) {
                                Map<String, dynamic> data = jsonDecode(response.body);
                                print(data['status']);
                                print(data['message']);
                                if (data["status"] == true) {
                                  Navigator.pop(context);
                                  print("successfully applied university ");
                                  print('' + data['message']);
                                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(

                                    content: Container(
                                      //color: Colors.transparent.withOpacity(0.25),
                                      child: Column(
                                        children: [
                                          Image.asset(images.logomain,height: 100,),
                                          Text('' + data['message']!,style: TextStyle(fontSize: 20),),
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
                                 await universityController.getShortUniversity();
                                 await universityController.shortbyuser;
                                  setState(() {
                                     universityController.getShortUniversity();
                                     universityController.shortbyuser;
                                  });
                                  Get.back();
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(

                                    content: Container(
                                      //color: Colors.transparent.withOpacity(0.25),
                                      child: Column(
                                        children: [
                                          Image.asset(images.logomain,height: 100,),
                                          Text('' + data['message']!,style: TextStyle(fontSize: 20),),
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
                                  Get.back();


                                }
                              }
                            } catch (e) {
                              Get.back();
                              print(e.toString());
                            }
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
}
