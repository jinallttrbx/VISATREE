import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/LoadingLayout.dart';
import 'package:visatree/alertBoxes.dart';
import 'package:visatree/apiclass.dart';
import 'package:visatree/commandialog.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/controller/homeController.dart';
import 'package:visatree/controller/universityController.dart';
import 'package:visatree/model/getCourseModel.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/model/getLevellModel.dart';
import 'package:visatree/model/getProgramModel.dart';
import 'package:visatree/screens/Widgets/defaulttxt.dart';
import 'package:visatree/screens/Widgets/dialogbutton.dart';
import 'package:visatree/screens/Widgets/dropdownCustom.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/screens/universityDetails.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/snackbar.dart';
import 'package:visatree/util/images.dart';



class UniversityList extends StatefulWidget {

  UniversityList({super.key});

  @override
  State<UniversityList> createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  allExtraexpemcesController expencesController = Get.find<allExtraexpemcesController>();
  UniversityController universityController=Get.find<UniversityController>();
  String Levelvalue = "select";
  String LevelId = "";
  String Programvalue = "select";
  String ProgramId = "";
  String Coursevalue = "select";
  String CourseId = "";




  @override
  void initState() {
    super.initState();

    expencesController.LevelList;
    expencesController.ProgramList;
    expencesController.CourseList;
    universityController.UniversityList;


  }

  bool applying = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   titleSpacing: 0,
        //
        //   title: Row(
        //     children: [
        //       boldtext(Colors.white, 18, "University"),
        //
        //
        //
        //
        //     ],
        //   ),
        //
        //
        //   shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(10),
        //           bottomRight: Radius.circular(10))),
        //   elevation: 0,
        //   backgroundColor:  AppColors.primaryColor,
        // ),
        body: universityController.isLoading.value==true?Text("data"):ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: universityController.UniversityList.length,
          // padding: EdgeInsets.all(15),
          itemBuilder: (context, index) {
            String html = universityController.UniversityList[index].description;

            RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
            String parsedstring1 = html.replaceAll(exp, '');
            print(parsedstring1);
            return  GestureDetector(
              onTap: (){
                print("Go to university detail page ");
                Get.to(UniversityDetails(uniidx: universityController.UniversityList[index], desc: parsedstring1));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // width: MediaQuery.of(context).size.width * 0.5,
                  // height: MediaQuery.of(context).size.height * 0.6,
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
                          SizedBox(
                            height: 40,
                          ),


                          Image.network(
                            "${universityController.UniversityList[index].image}/${universityController.UniversityList[index].universityBanner}",
                            height: 70,fit: BoxFit.fitWidth,
                            width: 500,
                          ),
                          Text(
                            universityController.UniversityList[index].university.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Divider(color: Colors.black,),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              Text(
                                universityController.UniversityList[index].country.toString(),
                                style: TextStyle(
                                  color:
                                  Colors.black.withOpacity(0.800000011920929),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          Divider(color: Colors.black,),
                          Row(
                            children: [
                              Expanded(child:  const Text(
                                'Course Duration',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),),
                              const Text(
                                'Course Fees',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),


                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child:   Text(
                                universityController.UniversityList[index].duration.toString(),
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.800000011920929),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),),
                              Text(
                                universityController.UniversityList[index].fees.toString(),
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
                          Divider(color: Colors.black,),
                          const Text(
                            'Eligibility',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'TOEFL :  ${universityController.UniversityList[index].toefl.toString()}',
                            style: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.800000011920929),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'IELTS  :  ${universityController.UniversityList[index].ielts.toString()}',
                            style: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.800000011920929),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'GRE    :  ${universityController.UniversityList[index].gre.toString()} ',
                            style: TextStyle(
                              color: Colors.black
                                  .withOpacity(0.800000011920929),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Divider(color: Colors.black,),
                          const SizedBox(
                            height: 20,
                          ),
                         universityController.UniversityList[index].isApplied==true?Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    CommonBottomSheet.show( context,universityController.UniversityList[index].id.toString(),"applynow");
                                    applying = true;
                                  },
                                  child: WhiteButton(
                                    buttonName: 'Apply Now',
                                  )),
                              InkWell(
                                  onTap: () {
                                    CommonBottomSheet.show(context,universityController.UniversityList[index].id.toString(),"shortlist");
                                    applying = false;
                                  },
                                  child: WhiteButton(
                                    buttonName: 'Shortlisted',
                                  ))
                            ],
                          ):SizedBox.shrink(),

                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(

                          alignment: Alignment.center,
                          width: 110,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            universityController.UniversityList[index].category,
                            style: TextStyle(
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
              ),
            );

          },
        ),

      ),
    );
  }

  Applyuni(String uniid,String levelid, String programid,String courseid,BuildContext context) async {
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
        Uri.parse("${ApiUrl.baseurl}universitystore"),
        headers: {"Authorization": "Bearer $token"},
        body: {
          "student_id":id,
          "university_id":uniid,
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

          print("successfully applied university ");
          print('' + data['message']);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('' + data['message']!),
            duration: const Duration(seconds: 2),
          ));
          hideLoadingDialog();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('' + data['message']!),
            duration: const Duration(seconds: 2),
          ));
          hideLoadingDialog();

        }
      }
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }
}

class WhiteButton extends StatefulWidget {
  WhiteButton({super.key, required this.buttonName});
  String buttonName;

  @override
  State<WhiteButton> createState() => _WhiteButtonState();
}

class _WhiteButtonState extends State<WhiteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.3,
      height: 41,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0x8443749E)),
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
      child: Text(
        widget.buttonName,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
