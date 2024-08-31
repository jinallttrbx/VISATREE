import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/alertBoxes.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/controller/Shortlistbyusercontroller.dart';
import 'package:visatree/controller/homeController.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/util/images.dart';
import 'package:http/http.dart' as http;






class HomeShortListed extends StatefulWidget {
  String? title;
  HomeShortListed({this.title});
  @override
  _HomeShortListedState createState() => _HomeShortListedState();
}

class _HomeShortListedState extends State<HomeShortListed>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: Row(
                children: [
                  boldtext(Colors.white, 18, widget.title!),
                ],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(163, 213, 208, 208),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: ButtonsTabBar(
                        decoration: BoxDecoration(
                          gradient:  LinearGradient(colors: [
                            AppColors.primaryColor2,
                            AppColors.primaryColor
                          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                          // color: Color(0xFF439E5B),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(
                              color: Color(0xFFFFFFFF),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: const Text(
                                "My Shortlist ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.396,
                              child: const Text(
                                "VisaTree Suggested ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                Flexible(
                  child: TabBarView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      usershortlisted(0),
                      adminshortlisted(1),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget usershortlisted(int tabIndex) {
    ShortByuserController universityController = Get.find<ShortByuserController>();
    return RefreshIndicator(
        onRefresh: () => _handleRefresh(tabIndex,universityController),
        child: universityController.shortbyuser.isEmpty?
        ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child:   Center(
                child:  Text("No Shortlisted Universities Found"),
              ),
            )
          ],
        ):ListView.builder(
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
                                                            side: const BorderSide(
                                                              width: 0.50,
                                                              color: AppColors.primaryColor2,
                                                            ),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          shadowColor: const Color(0x3F43749E),
                                                          elevation: 20,
                                                        ),
                                                        onPressed: () async{
                                                          ShortByuserController shortunicontroller =
                                                          Get.find<ShortByuserController>();
                                                          shortunicontroller.ApplyUniversity(
                                                              universityController.shortbyuser[position].id.toString(),universityController.shortbyuser[position].levelId.toString(),universityController.shortbyuser[position].programId.toString(),universityController.shortbyuser[position].courseId.toString(), context);
                                                        },
                                                        // {
                                                        //   SessionManagement share=SessionManagement();
                                                        //   showLoadingDialog();
                                                        //   print("User Applied university");
                                                        //   String token= await share.istoken();
                                                        //   String id= await share.isuserid();
                                                        //   String name= await share.isfirstname();
                                                        //   print("Student ID $id");
                                                        //   print("Student name $name");
                                                        //   print(universityController.shortbyuser[position].id.toString(),);
                                                        //   print(universityController.shortbyuser[position].levelId.toString());
                                                        //   print(universityController.shortbyuser[position].programId.toString());
                                                        //   print(universityController.shortbyuser[position].courseId.toString());
                                                        //
                                                        //   try {
                                                        //     final response = await http.post(
                                                        //       Uri.parse(ApiUrl.applyuni),
                                                        //       headers: {"Authorization": "Bearer $token"},
                                                        //       body: {
                                                        //         "student_id":id,
                                                        //         "university_id":universityController.shortbyuser[position].id.toString(),
                                                        //         "level_id":universityController.shortbyuser[position].levelId.toString(),
                                                        //         "program_id":universityController.shortbyuser[position].programId.toString(),
                                                        //         "course_id":universityController.shortbyuser[position].courseId.toString(),
                                                        //         "applicant_name":name,
                                                        //       },);
                                                        //     print(response.statusCode);
                                                        //     print(response.body);
                                                        //     if (response.statusCode == 200) {
                                                        //       setState(() {
                                                        //         universityController.getShortUniversity();
                                                        //       });
                                                        //       Map<String, dynamic> data = jsonDecode(response.body);
                                                        //       print(data['status']);
                                                        //       print(data['message']);
                                                        //       if (data["status"] == true) {
                                                        //         Navigator.pop(context);
                                                        //         print("successfully applied university ");
                                                        //         print('' + data['message']);
                                                        //         ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                        //           content: Container(
                                                        //             //color: Colors.transparent.withOpacity(0.25),
                                                        //             child: Column(
                                                        //               children: [
                                                        //                 Image.asset(images.logomain,height: 100,),
                                                        //                 Text('' + data['message']!,style: TextStyle(fontSize: 20),),
                                                        //               ],
                                                        //             ),
                                                        //           ),
                                                        //           behavior: SnackBarBehavior.floating,
                                                        //           shape: RoundedRectangleBorder(
                                                        //             borderRadius: BorderRadius.circular(10),
                                                        //           ),
                                                        //           margin: EdgeInsets.only(
                                                        //               bottom: MediaQuery.of(context).size.height - 500,
                                                        //               right: 20,
                                                        //               left: 20),
                                                        //         ));
                                                        //         setState(() {
                                                        //           universityController.getShortUniversity();
                                                        //           universityController.shortbyuser;
                                                        //         });
                                                        //         Get.back();
                                                        //       } else {
                                                        //         Navigator.pop(context);
                                                        //         ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                        //           content: Container(
                                                        //             //color: Colors.transparent.withOpacity(0.25),
                                                        //             child: Column(
                                                        //               children: [
                                                        //                 Image.asset(images.logomain,height: 100,),
                                                        //                 Text('' + data['message']!,style: TextStyle(fontSize: 20),),
                                                        //               ],
                                                        //             ),
                                                        //           ),
                                                        //           behavior: SnackBarBehavior.floating,
                                                        //           shape: RoundedRectangleBorder(
                                                        //             borderRadius: BorderRadius.circular(10),
                                                        //           ),
                                                        //           margin: EdgeInsets.only(
                                                        //               bottom: MediaQuery.of(context).size.height - 500,
                                                        //               right: 20,
                                                        //               left: 20),
                                                        //         ));
                                                        //         Get.back();
                                                        //
                                                        //
                                                        //       }
                                                        //     }
                                                        //   } catch (e) {
                                                        //     Get.back();
                                                        //     print(e.toString());
                                                        //   }
                                                        // },
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
                                  // CommonBottomSheet1.showbottom(context,  universityController
                                  //     .shortbyuser[
                                  // position]
                                  //     .id
                                  //     .toString(),universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .levelId
                                  //         .toString(),  universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .programId
                                  //         .toString(), universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .courseId
                                  //         .toString(),"shortlist");
                                  // ApplyUniversity(
                                  //     context,
                                  //     universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .id
                                  //         .toString(),
                                  //     universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .levelId
                                  //         .toString(),
                                  //     universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .programId
                                  //         .toString(),
                                  //     universityController
                                  //         .shortbyuser[
                                  //     position]
                                  //         .courseId
                                  //         .toString());
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

            })
    );
  }
  Widget adminshortlisted(int tabIndex) {
    ShortByuserController universityController = Get.find<ShortByuserController>();
    return RefreshIndicator(
        onRefresh: () => _handleRefresh(tabIndex,universityController),
        child: universityController.shortbyadmin.isEmpty?
        ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child:   Center(
                child:  Text("No Suggested Universities Found"),
              ),
            )
          ],
        ):ListView.builder(
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
                                  // ApplyUniversity(
                                  //     context,
                                  //     universityController
                                  //         .shortbyadmin[
                                  //     position]
                                  //         .id
                                  //         .toString(),
                                  //     universityController
                                  //         .shortbyadmin[
                                  //     position]
                                  //         .levelId
                                  //         .toString(),
                                  //     universityController
                                  //         .shortbyadmin[
                                  //     position]
                                  //         .programId
                                  //         .toString(),
                                  //     universityController
                                  //         .shortbyadmin[
                                  //     position]
                                  //         .courseId
                                  //         .toString());
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
            })
    );
  }

  Future<void> _handleRefresh(int tabIndex,ShortByuserController controler) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    setState(() {
      print(controler.shortbyuser.length);
      print(controler.shortbyadmin.length);
      controler.shortbyuser;
      print("admin can shortlisted university ");
      controler.shortbyadmin;
      // controler.shortbyuser[tabIndex] = List.generate(
      //     controler.shortbyuser.length, (i) => 'Item ${i + 1} (Refreshed at ${DateTime.now().second})');
    });
  }
}
