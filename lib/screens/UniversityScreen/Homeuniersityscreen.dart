import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visatree/Widgets/commanbottomsheet.dart';
import 'package:visatree/Widgets/const_text.dart';

import 'package:visatree/controller/homeController.dart';
import 'package:visatree/controller/universityController.dart';
import 'package:visatree/screens/UniversityScreen/universityDetails.dart';
import 'package:visatree/util/appcontants.dart';

import 'package:visatree/util/images.dart';


import '../../model/getLevellModel.dart';
import '../../model/getProgramCourse.dart';
import '../../model/getlevelprogram.dart';

class HomeUniversity extends StatefulWidget {
  final bool isDashBoard;
  final String? countryId;
  const HomeUniversity(
      {super.key, required this.isDashBoard, this.countryId});

  @override
  State<HomeUniversity> createState() => _HomeUniversityState();
}

class _HomeUniversityState extends State<HomeUniversity> {
  allExtraexpemcesController expencesController =
  Get.find<allExtraexpemcesController>();
  UniversityController universityController =
  Get.find<UniversityController>();



  @override
  void initState() {
    super.initState();
    universityController.getUniversity(countryId: widget.countryId);

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: GetBuilder<UniversityController>(
            builder: (universityController) => universityController.loading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : RefreshIndicator(
                color: AppColors.primaryColor,
                child: ListView.builder(

                    physics: const BouncingScrollPhysics(),
                    itemCount: universityController.universityModel.length,
                    // padding: EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      String html =
                          universityController.universityModel[index].description;

                      RegExp exp = RegExp(r"<[^>]*>",
                          multiLine: true, caseSensitive: true);
                      String parsedstring1 = html.replaceAll(exp, '');

                      return GestureDetector(
                        onTap: () {
                          Get.to(UniversityDetails(
                              uniidx: universityController.universityModel[index],
                              desc: parsedstring1));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
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
                                        "${universityController.universityModel[index].universityBanner}",
                                        height: 150,
                                        fit: BoxFit.fitWidth,
                                        width: double.infinity,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            universityController
                                                .universityModel[index].university
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.grey,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.location_on_outlined),
                                              Text(
                                                universityController
                                                    .universityModel[index]
                                                    .country ??
                                                    '',
                                                style: TextStyle(
                                                  color: Colors.black.withOpacity(
                                                      0.800000011920929),
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.grey,
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
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'TOEFL : ${universityController.universityModel[index].toefl.toString()}',
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(
                                                        0.800000011920929),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'IELTS : ${universityController.universityModel[index].ielts.toString()}',
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(
                                                        0.800000011920929),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'GRE : ${universityController.universityModel[index].gre.toString()} ',
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(
                                                        0.800000011920929),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    universityController.universityModel[index]
                                        .isApplied ==
                                        true
                                        ? Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "Appiled Already",
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
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
                                              onPressed: () {
                                                CommonBottomSheet.show( context,
                                                    universityController
                                                        .universityModel[
                                                    index]
                                                        .id.toString(),"applynow");
                                                // _showcontent(
                                                //     context,
                                                //     universityController
                                                //         .universityModel[
                                                //     index]
                                                //         .id
                                                //         .toString(),
                                                //     true);
                                              },
                                              style:
                                              ElevatedButton.styleFrom(
                                                backgroundColor:
                                                AppColors.primaryColor,
                                                shape:
                                                const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                              ),
                                              child:
                                              const Text("Apply Now"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 2),
                                        Expanded(
                                          child: SizedBox(
                                            height: 50,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                universityController.universityModel[index].isshort==true? Alreadyshortlisted(
                                                  context,
                                                ):  CommonBottomSheet.show(context,  universityController
                                                    .universityModel[
                                                index]
                                                    .id
                                                    .toString(),"shortlist");
                                                // _showcontent(
                                                //     context,
                                                //     universityController
                                                //         .universityModel[
                                                //     index]
                                                //         .id
                                                //         .toString(),
                                                //     false);
                                              },
                                              style:
                                              ElevatedButton.styleFrom(
                                                backgroundColor:
                                                AppColors.primaryColor,
                                                shape:
                                                const RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomRight:
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                              ),
                                              child:
                                              Text(universityController.universityModel[
                                              index].isshort==true?
                                              "Shortlisted":"Shortlist"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 20,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: const ShapeDecoration(
                                      color: AppColors
                                          .primaryColor2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      universityController
                                          .universityModel[index].category,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
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
                    }), onRefresh: ()async {
              await universityController.getUniversity(countryId: widget.countryId);

            })
        ),
      ),
    );
  }

  void Alreadyshortlisted(BuildContext context, ) {
    showDialog(
      context: context, barrierDismissible: true, // user must tap button!
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return AlertDialog(
            title: const Text(
              'Shortlisted Already  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                    // gradient: LinearGradient(
                    //     colors: [ AppColors.primaryColor2,
                    //       AppColors.primaryColor,])
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: Text(
                      "OK",
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

          );
        });
      },
    );
  }
}
