import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatreenew/Widgets/const_text.dart';

import 'package:visatreenew/model/GetLevel.dart';
import 'package:visatreenew/model/countrymodel.dart';
import 'package:visatreenew/model/getProgramCourse.dart';
import 'package:visatreenew/model/getcourseunoversity.dart';
import 'package:visatreenew/model/getlevelprogram.dart';
import 'package:visatreenew/screens/ClickToFind/SearchUniversitylist.dart';
import 'package:visatreenew/util/ApiUrl.dart';

import 'package:visatreenew/util/appcontants.dart';
import 'package:visatreenew/util/session%20management.dart';


class UniversitySearch extends StatefulWidget {
  const UniversitySearch({super.key});

  @override
  State<UniversitySearch> createState() => _UniversitySearchState();
}

class _UniversitySearchState extends State<UniversitySearch> {
  List<Country>? countryList = [];
  List<GetLevelByCountryModeldata>? levelList = [];
  List<GetLevelProgramdata>? programList = [];
  List<Course>? courseList = [];
  List<GetCourseuniversitydata>? universityList = [];
  String countryid="";
  String levelid="";
  String courseid="";
  String programid="";
  String universityid="";


  @override
  void initState() {
    super.initState();
    getCountryList();

  }

  Country? countryDropDownValue;
  GetLevelByCountryModeldata? levelDropDownValue;
  GetLevelProgramdata? programDropDownValue;
  Course? courseDropDownValue;
  GetCourseuniversitydata? universityDropDownValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              boldtext(Colors.white, 18, "Search University"),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Country",
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
                child: DropdownButton<Country>(
                  isExpanded: true,
                  hint: const Text("Select Country"),
                  underline: const SizedBox.shrink(),
                  value: countryDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: countryList
                      ?.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.country),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    countryDropDownValue = value;
                    levelDropDownValue=null;
                    programDropDownValue = null;
                    courseDropDownValue = null;
                    universityDropDownValue = null;
                    setState(() {
                      countryid=value!.id.toString();
                    });
                    getCountryLevel(countryid);
                    print("COUNTRY PRINT $countryid");
                  },
                ),
              ),
              const SizedBox(height: 20),
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
                child: DropdownButton<GetLevelByCountryModeldata>(
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
              const SizedBox(height: 20),
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
                child: DropdownButton<GetLevelProgramdata>(
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
              const SizedBox(height: 20),
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
                child: DropdownButton<Course>(
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
                    getCourseuniversity(courseDropDownValue!.id.toString());
                    setState(() {
                      courseid=value!.id.toString();
                    });
                    print("COURSE PRINT $courseid");
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select University",
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
                child: DropdownButton<GetCourseuniversitydata>(
                  isExpanded: true,
                  hint: const Text("Select University"),
                  underline: const SizedBox.shrink(),
                  value: universityDropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: universityList
                      ?.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.university),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    universityDropDownValue = value;
                    setState(() {
                      universityid=value!.id.toString();
                    });
                    print("UNIVERSITYID PRINT $universityid");
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor,
                    // gradient: LinearGradient(
                    //     colors: [ AppColors.primaryColor2,
                    //       AppColors.primaryColor,])
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    print("$countryid");
                    print(levelid);
                    print(programid);
                    print(courseid);
                    print(universityid);
                    if (countryDropDownValue == null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Please Select Country Name"),
                        duration: Duration(seconds: 2),
                      ));
                    }else if(levelDropDownValue==null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Please Select Level Name"),
                        duration: Duration(seconds: 2),
                      ));
                    }else if(programDropDownValue==null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Please Select Program Name"),
                        duration: Duration(seconds: 2),
                      ));
                    }else if(courseDropDownValue==null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Please Select Course Name"),
                        duration: Duration(seconds: 2),
                      ));
                    }else if(universityDropDownValue==null){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("Please Select University Name"),
                        duration: Duration(seconds: 2),
                      ));
                    }else{


                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SearcUniversityList(
                            countryid,levelid,programid,courseid,universityid

                        ),));




                       // Get.to(

                      // );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    "Search Result",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future<void> getCountryList() async {
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    final response = await http.get(
      Uri.parse(ApiUrl.getcountry),
      headers: {"Authorization": "Bearer $token "},
    );
    if (response.statusCode == 200) {
      GetCountryModel vehicalTypeModel =
          GetCountryModel.fromJson(jsonDecode(response.body));
      countryList = vehicalTypeModel.country;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> getCountryLevel(String countryid) async {
    print("${ApiUrl.baseurl}get_level_by_CountryId?country_id=$countryid");
    SessionManagement share = SessionManagement();
    String token = await share.istoken();

    final response = await http.get(
      Uri.parse("${ApiUrl.baseurl}get_level_by_CountryId?country_id=$countryid"),
      headers: {"Authorization": "Bearer $token "},
    );
    if (response.statusCode == 200) {
      GetLevelByCountryModel vehicalTypeModel =
      GetLevelByCountryModel.fromJson(jsonDecode(response.body));
      levelList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  getLevelProgram(String levelid) async {
    print("${ApiUrl.baseurl}get_program_by_Level_id?level_id=$levelid&country_id=$countryid");
    final response = await http.get(
      Uri.parse("${ApiUrl.baseurl}get_program_by_Level_id?level_id=$levelid&country_id=$countryid"),
    );
    if (response.statusCode == 200) {
      GetLevelProgram vehicalTypeModel =
          GetLevelProgram.fromJson(jsonDecode(response.body));
      programList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  getProgramCourse(String levelid) async {
    print("${ApiUrl.baseurl}get_source_by_program_id?program_id=$levelid&country_id=$countryid");

    final response = await http.get(
      Uri.parse("${ApiUrl.baseurl}get_source_by_program_id?program_id=$levelid&country_id=$countryid"),
    );
    if (response.statusCode == 200) {
      GetProgramCourse vehicalTypeModel =
          GetProgramCourse.fromJson(jsonDecode(response.body));
      courseList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }

  getCourseuniversity(String courseid) async {
    print(ApiUrl.courseuniversity + "country_id=$countryid&course_id=$courseid");
    final response = await http.get(
      Uri.parse(ApiUrl.courseuniversity + "country_id=$countryid&course_id=$courseid"),
    );
    if (response.statusCode == 200) {
      GetCourseuniversity vehicalTypeModel =
          GetCourseuniversity.fromJson(jsonDecode(response.body));
      universityList = vehicalTypeModel.data;
      setState(() {});
    } else {
      throw Exception('Failed to load album');
    }
  }
}
