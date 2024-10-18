import 'package:flutter/material.dart';
import 'package:visatree/Widgets/const_text.dart';
import 'package:visatree/model/universitymodel.dart';

import 'package:visatree/util/appcontants.dart';



// ignore: must_be_immutable
class UniversityDetails extends StatefulWidget {
  Universitydata uniidx;
  String desc;

  UniversityDetails({super.key, required this.uniidx, required this.desc});

  @override
  State<UniversityDetails> createState() => _UniversityDetailsState();
}

class _UniversityDetailsState extends State<UniversityDetails> {
  String description = "";

  @override
  void initState() {
    super.initState();
    getUniDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: Row(
                children: [
                  boldtext(Colors.white, 18, "University Details"),
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              "${widget.uniidx.universityBanner}",
                              height: 200,
                              fit: BoxFit.fitWidth,
                              width: 500,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 150),
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  "${widget.uniidx.image}",
                                  width: 110.0,
                                  height: 110.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),

                            Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.uniidx.university.toString(),
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
                                          widget.uniidx.country ?? '',
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
                                  ],
                                )),
                            //   Divider(color: Colors.black,),
                            const SizedBox(
                              height: 20,
                            ),

                            const Divider(
                              color: Colors.black,
                            ),
                            // const Row(
                            //   children: [
                            //     Expanded(
                            //       child: Text(
                            //         'Course Duration',
                            //         style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 16,
                            //           fontFamily: 'Poppins',
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ),
                            //     ),
                            //     Text(
                            //       'Course Fees',
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontFamily: 'Poppins',
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Text(
                            //         widget.uniidx.duration.toString(),
                            //         style: TextStyle(
                            //           color: Colors.black
                            //               .withOpacity(0.800000011920929),
                            //           fontSize: 16,
                            //           fontFamily: 'Poppins',
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Text(
                            //       widget.uniidx.fees.toString(),
                            //       style: TextStyle(
                            //         color: Colors.black
                            //             .withOpacity(0.800000011920929),
                            //         fontSize: 16,
                            //         fontFamily: 'Poppins',
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const Divider(
                            //   color: Colors.black,
                            // ),
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
                              'TOEFL :  ${widget.uniidx.toefl.toString()}',
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'IELTS  :  ${widget.uniidx.ielts.toString()}',
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'GRE    :  ${widget.uniidx.gre.toString()} ',
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Text(description),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     InkWell(
                            //         onTap: () {
                            //           _showcontent( context,universityController.UniversityList[index].id.toString());
                            //           applying = true;
                            //         },
                            //         child: WhiteButton(
                            //           buttonName: 'Apply Now',
                            //         )),
                            //     InkWell(
                            //         onTap: () {
                            //           _showcontent(context,universityController.UniversityList[index].id.toString());
                            //           applying = false;
                            //         },
                            //         child: WhiteButton(
                            //           buttonName: 'Shortlisted',
                            //         ))
                            //   ],
                            // ),

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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              widget.uniidx.category,
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
                ],
              ),
            )));
  }

  void getUniDetails() {
    String html = widget.uniidx.description;

    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring1 = html.replaceAll(exp, '');
    setState(() {
      description = parsedstring1;
    });
  }
}
