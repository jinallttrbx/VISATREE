import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/Widgets/alertBoxes.dart';
import 'package:visatree/Widgets/const_text.dart';
import 'package:visatree/Widgets/searchbottomsheet.dart';

import 'package:visatree/controller/Searchuniversity.dart';
import 'package:visatree/model/GetSearchUniversity.dart';
import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/appcontants.dart';



import 'package:visatree/model/Getlevelbyuniversity.dart';

import 'package:visatree/model/getLevellModel.dart';
import 'package:visatree/model/getcoursebyuniversity.dart';
import 'package:visatree/model/getcourseunoversity.dart';
import 'package:visatree/util/session%20management.dart';

class SearcUniversityList extends StatefulWidget {

  final String countryid;
  final String levelid;
  final String programid;
  final String courseid;
  final String uniid;

  const SearcUniversityList(this.countryid,this.levelid,this.programid,this.courseid,this.uniid,{super.key});

  @override
  State<SearcUniversityList> createState() => _SearchUniversityListState();
}

class _SearchUniversityListState extends State<SearcUniversityList> {
  var searchuniversity = Get.put(SearchUnivercityController());

  List<GetSearchUniversitydata> searchini=[];
  bool isLoading=false;
  String description = "";
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
  String programid="";
  String universityid="";





  @override
  void initState() {
    super.initState();
    // searchuniversity.getsearchunivercity(({
    //   "university_id":widget.uniid.toString(),
    //   "country_id":widget.countryid.toString(),
    //   "level_id":widget.levelid.toString(),
    //   "course_id":widget.courseid.toString(),
    //   "program_id":widget.programid.toString(),
    // }));

    print("object");
    getuniversity(widget.countryid,widget.levelid,widget.programid,widget.courseid,widget.uniid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Row(
              children: [
                boldtext(Colors.white, 18, "University"),
              ],
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
          ),
          body: ListView.builder(
              itemCount: searchini?.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return
                  Stack(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                            const BorderSide(width: 0.50, color: Color(0x7F43749E)),
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
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.network(
                                    searchini[index]?.universityBanner ?? '',
                                    height: 150,
                                    fit: BoxFit.fitWidth,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        searchini[index].university ?? '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined),
                                          Text(
                                            searchini[index]?.countryName ?? '',
                                            style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.800000011920929),
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
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
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'TOEFL : ${searchini[index]?.toefl}',
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.800000011920929),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'IELTS : ${searchini[index]?.ielts}',
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.800000011920929),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'GRE : ${searchini[index]?.gre}',
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
                                      const Divider(
                                        color: Colors.black,
                                      ),
                                      searchini[index]?.isApplied ?? false
                                          ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Applied Already",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.primaryColor),
                                            )
                                          ],
                                        ),
                                      )
                                          : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 50,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      AppColors.primaryColor),
                                                  onPressed: () {
                                                    print("APPLY UNIVERSITY");
                                                    SearchCommonBottomSheet.show(
                                                        context,
                                                        searchini[index]!.id
                                                            .toString()
                                                            .toString(),"applynow"
                                                    );


                                                  },
                                                  child: const Text("Apply Now"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              htmlToString(
                                                  searchini[index]?.description ?? ''),
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.800000011920929),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            searchini[index]?.fees ?? '',
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
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              right: 15,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                height: 30,
                                decoration: const ShapeDecoration(
                                  color: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  searchini[index]?.category ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: isLoading
                              ? showLoadingDialog()
                              : Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ))
                    ],
                  );
              })

     ),
    );
  }
  getuniversity(String countryid,String levelid,String programid,String courseid,String universityid,) async {
    print(ApiUrl.searchuni);
    setState(() {
      isLoading=true;
    });
    SessionManagement share = SessionManagement();
    String token = await share.istoken();
    final response = await http.post(
      Uri.parse(ApiUrl.searchuni),body: {
      "university_id":universityid.toString(),
      "country_id":countryid.toString(),
      "level_id":levelid.toString(),
      "course_id":courseid.toString(),
      "program_id":programid.toString(),
    },
      headers: {"Authorization": "Bearer $token"},
    );
    print(response.statusCode);
    print("COUNTRY ID $countryid,");
    print( "LEVELID $levelid",);
    print( "PROGRAM ID $programid",);
    print( "COURSEID $courseid",);
    print( "UNIVERSITY ID $universityid",);
    print(searchini.length);
    print(response.body);
    if (response.statusCode == 200) {
      GetSearchUniversity vehicalTypeModel =
      GetSearchUniversity.fromJson(jsonDecode(response.body));
      searchini = vehicalTypeModel.data;
      setState(() {
        isLoading=false;
      });
      print(searchini.length);
    } else {
      throw Exception('Failed to load album');
    }
  }






}

String htmlToString(String htmlString) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}
