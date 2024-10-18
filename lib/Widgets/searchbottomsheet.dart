import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/Widgets/alertBoxes.dart';

import 'package:visatree/controller/Searchuniversity.dart';
import 'package:visatree/controller/universityController.dart';

import 'package:visatree/model/Getlevelbyuniversity.dart';

import 'package:visatree/model/getLevellModel.dart';
import 'package:visatree/model/getcoursebyuniversity.dart';
import 'package:visatree/model/getcourseunoversity.dart';
import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/appcontants.dart';

import 'package:visatree/util/images.dart';
import 'package:visatree/util/session%20management.dart';

class SearchCommonBottomSheet extends StatefulWidget {
  String userid;
  String shortlist;


  SearchCommonBottomSheet(this.userid,this.shortlist);

  @override
  _CommonBottomSheetState createState() => _CommonBottomSheetState();

  static void show(
      BuildContext context, String userid,String shortlist) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints.tight(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .5)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return SearchCommonBottomSheet(userid,shortlist);
          });
        });
  }
}

class _CommonBottomSheetState extends State<SearchCommonBottomSheet> {

  GetLevelbyuniversitydata? levelDropDownValue;
  GetProgrambyuniversitydata? programDropDownValue;
  GetCoursebyuniversitydata? courseDropDownValue;
  GetCourseuniversitydata? universityDropDownValue;
  List<GetLevelbyuniversitydata>? levelList = [];
  List<GetProgrambyuniversitydata>? programList = [];
  List<GetCoursebyuniversitydata>? courseList = [];
  List<GetCourseuniversitydata>? universityList = [];
  String countryid="";
  String levelid="";
  String courseid="";
  String courseprice="";
  String courseduration="";
  String programid="";
  String universityid="";
  var university = Get.put(SearchUnivercityController());
  SearchUnivercityController universityController =
  Get.find<SearchUnivercityController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLevelList();



  }



  @override
  Widget build(BuildContext context,) {
    return StatefulBuilder(builder: (
        BuildContext context,
        StateSetter setState,
        /*You can rename this!*/
        ) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child:  Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20,),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Level",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: DropdownButton<GetLevelbyuniversitydata>(
                        isExpanded: true,
                        hint: const Text("Select level"),
                        underline: const SizedBox.shrink(),
                        value: levelDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: levelList
                            ?.map(
                              (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.level),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          levelDropDownValue = value;
                          programDropDownValue = null;
                          courseDropDownValue = null;
                          universityDropDownValue = null;
                          programList = [];
                          courseList = [];
                          universityList = [];
                          getLevelProgram(levelDropDownValue!.id.toString());
                          setState(() {
                            levelid=value!.id.toString();
                          });
                          print("LEVEL ID PRINT $levelid");
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Select Program",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: DropdownButton<GetProgrambyuniversitydata>(
                        isExpanded: true,
                        hint: const Text("Select Program"),
                        underline: const SizedBox.shrink(),
                        value: programDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: programList
                            ?.map(
                              (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.program),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          programDropDownValue = value;
                          courseDropDownValue = null;
                          universityDropDownValue = null;
                          courseList = [];
                          universityList = [];
                          getProgramCourse(programDropDownValue!.id.toString());
                          setState(() {
                            programid=value!.id.toString();
                          });
                          print("PROGRAM ID PRINT $programid");
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Select Course",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: DropdownButton<GetCoursebyuniversitydata>(
                        isExpanded: true,
                        hint: const Text("Select Course"),
                        underline: const SizedBox.shrink(),
                        value: courseDropDownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: courseList
                            ?.map(
                              (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.course),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          courseDropDownValue = value;
                          universityDropDownValue = null;
                          universityList = [];
                          setState(() {
                            courseid=value!.id.toString();
                            courseprice=value.fees.toString();
                            courseduration=value.duration.toString();
                          });
                          print("COURSE PRINT $courseid");
                        },
                      ),
                    ),
                    GradientText("Course Price =$courseprice",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), colors: [AppColors.primaryColor2,
                        AppColors.primaryColor,],),
                    GradientText("Course Duration =$courseduration",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), colors: [AppColors.primaryColor2,
                        AppColors.primaryColor,],),
                    const SizedBox(height: 10),

                  ],
                ),
              )
          ),
          bottomNavigationBar:   Container(
            margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child:   SizedBox(
                  height: 50,
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
                      Navigator.pop(context);
                      Navigator.pop(context);

                    },
                    child: const Text("Go Back"),
                  ),
                ),),
                SizedBox(width: 20,),
                Expanded(child:  Container(
                  height: 50,
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

                      if ( widget.shortlist=="applynow") {
                        if(levelDropDownValue==null){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Select Level Name"),
                            duration: Duration(seconds: 2),
                          ));
                          print("object");
                        }else if(programDropDownValue==null){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Select Program Name"),
                            duration: Duration(seconds: 2),
                          ));
                        }else if(courseDropDownValue==null){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Select Course Name"),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        else{
                          SessionManagement share = SessionManagement();
                          showLoadingDialog();
                          String token = await share.istoken();
                          String studentId = await share.isuserid();
                          String name = await share.isfirstname();

                          try {
                            final response = await http.post(
                              Uri.parse( ApiUrl.storeuniversiti
                              ),
                              headers: {"Authorization": "Bearer $token"},
                              body: {
                                "student_id": studentId,
                                "university_id": widget.userid,
                                "level_id":
                                levelDropDownValue!.id.toString(),
                                "program_id":
                                programDropDownValue!.id.toString(),
                                "course_id":
                                courseDropDownValue!.id.toString(),
                                "applicant_name": name,
                              },
                            );
                            print(response.body);
                            if (response.statusCode == 200) {
                              Map<String, dynamic> data =
                              jsonDecode(response.body);

                              if (data["status"] == true) {
                              //  Navigator.of(context).pop();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Column(
                                    children: [
                                      Image.asset(
                                        images.logomain,
                                        height: 100,
                                      ),
                                      Text(
                                        data['message'].toString(),
                                        style:
                                        const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .size
                                          .height -
                                          500,
                                      right: 20,
                                      left: 20),
                                ));
                                Navigator.pop(context);
                                Navigator.pop(context);
                                levelDropDownValue = null;
                                courseDropDownValue = null;
                                programDropDownValue = null;

                                setState(() {
                                 // universityController.getUniversity();

                                });
                                Get.back();
                              } else {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Column(
                                    children: [
                                      Image.asset(
                                        images.logomain,
                                        height: 100,
                                      ),
                                      Text(
                                        data['message'].toString(),
                                        style:
                                        const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .size
                                          .height -
                                          500,
                                      right: 20,
                                      left: 20),
                                ));
                                Get.back();
                              }
                            }
                          } catch (e) {
                            Get.back();
                          }
                        }
                      }
                      else if( widget.shortlist!="applynow") {
                        SessionManagement share = SessionManagement();
                        showLoadingDialog();
                        String token = await share.istoken();
                        String studentId = await share.isuserid();
                        String name = await share.isfirstname();

                        try {
                          final response = await http.post(
                            Uri.parse( "${ApiUrl.baseurl}shortliststore"
                            ),
                            headers: {"Authorization": "Bearer $token"},
                            body: {
                              "student_id": studentId,
                              "university_id": widget.userid,
                              "level_id":
                              levelDropDownValue!.id.toString(),
                              "program_id":
                              programDropDownValue!.id.toString(),
                              "course_id":
                              courseDropDownValue!.id.toString(),
                              "applicant_name": name,
                            },
                          );
                          print(response.body);
                          if (response.statusCode == 200) {
                            Map<String, dynamic> data =
                            jsonDecode(response.body);

                            if (data["status"] == true) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Column(
                                  children: [
                                    Image.asset(
                                      images.logomain,
                                      height: 100,
                                    ),
                                    Text(
                                      data['message'].toString(),
                                      style:
                                      const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .size
                                        .height -
                                        500,
                                    right: 20,
                                    left: 20),
                              ));
                              levelDropDownValue = null;
                              courseDropDownValue = null;
                              programDropDownValue = null;

                              setState(() {
                               // universityController.getUniversity();

                              });
                              Get.back();
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Column(
                                  children: [
                                    Image.asset(
                                      images.logomain,
                                      height: 100,
                                    ),
                                    Text(
                                      data['message'].toString(),
                                      style:
                                      const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .size
                                        .height -
                                        500,
                                    right: 20,
                                    left: 20),
                              ));
                              Get.back();
                            }
                          }
                        } catch (e) {
                          Get.back();
                        }
                      }
                      else{
                        print("NO any method work ");

                      }

                      // widget.shortlist=="shortlist"?print("Shortlisted") :ApplyNow(widget.userid,levelid,programid,courseid);
                    },
                    child:
                    Text(widget.shortlist=="shortlist"?"Shortlist" :"Apply Now" ),
                  ),
                ))
              ],
            ),
          )
      );
    });
  }
  Future<void> getLevelList() async {
    print(ApiUrl.getlevel+widget.userid);
    SessionManagement share = SessionManagement();
    String token = await share.istoken();

    final response = await http.get(
      Uri.parse(ApiUrl.getlevel+widget.userid),
      headers: {"Authorization": "Bearer $token "},
    );
    if (response.statusCode == 200) {
      GetLevelbyuniversity vehicalTypeModel =
      GetLevelbyuniversity.fromJson(jsonDecode(response.body));
      levelList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  getLevelProgram(String levelid) async {
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    print(ApiUrl.getprogram+"?university_id=${widget.userid}"+"&level_id=$levelid");
    final response = await http.get(
      Uri.parse(ApiUrl.getprogram+"?university_id=${widget.userid}"+"&level_id=$levelid"),
      headers: {"Authorization": "Bearer $token "},
    );
    if (response.statusCode == 200) {
      GetProgrambyuniversity vehicalTypeModel =
      GetProgrambyuniversity.fromJson(jsonDecode(response.body));
      programList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }
  getProgramCourse(String levelid) async {
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    print(ApiUrl.getcourse+"?university_id=${widget.userid}"+"&program_id=$levelid");
    final response = await http.get(
      Uri.parse(ApiUrl.getcourse+"?university_id=${widget.userid}"+"&program_id=$levelid"),
      headers: {"Authorization": "Bearer $token "},
    );
    if (response.statusCode == 200) {
      GetCoursebyuniversity vehicalTypeModel =
      GetCoursebyuniversity.fromJson(jsonDecode(response.body));
      courseList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  // ApplyNow(String universityid,String levelid,String programid,String courseid) async {
  //   SessionManagement share = SessionManagement();
  //   String token = await share.istoken();
  //   print(ApiUrl.applyuni);
  //   final response = await http.post(
  //     Uri.parse(ApiUrl.applyuni),
  //     body: {
  //       "university_id":universityid,
  //       "level_id":levelid,
  //       "program_id":programid,
  //       "course_id":courseid
  //     },
  //     headers: {"Authorization": "Bearer $token "},
  //   );
  //   if (response.statusCode == 200) {
  //     Get.back();
  //   //  universityController.getUniversity(countryId: widget.userid);
  //     setState(() {});
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  void refresh() {


  }


}







