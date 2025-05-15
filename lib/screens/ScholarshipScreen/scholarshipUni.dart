import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visatreenew/Widgets/LoadingLayout.dart';
import 'package:visatreenew/Widgets/const_text.dart';

import 'package:visatreenew/controller/ScholarshipController.dart';
import 'package:visatreenew/controller/universityController.dart';
import 'package:visatreenew/screens/UniversityScreen/universityDetails.dart';
import 'package:visatreenew/util/appcontants.dart';


class ScholaShipUniversity extends StatefulWidget {
  var titleTxt;
  ScholaShipUniversity({super.key, @required this.titleTxt});

  @override
  State<ScholaShipUniversity> createState() => _ScholaShipUniversityState();
}

class _ScholaShipUniversityState extends State<ScholaShipUniversity> {
  var controller = Get.find<UniversityController>();

  @override
  void initState() {
    super.initState();
    controller.getUniversity();
    Get.find<ScholarshipController>().getScholarShipData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              boldtext(Colors.white, 18, widget.titleTxt),
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
        body: widget.titleTxt == "University"
            ? GetX<UniversityController>(builder: (unicontroller) {
                return unicontroller.isLoading.value == true
                    ? const Center(
                        child: Center(
                        child: LoadingLayout(),
                      ))
                    : Container(
                        margin: const EdgeInsets.all(10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: unicontroller.UniversityList.length,
                          itemBuilder: (context, index) {
                            String html =
                                unicontroller.UniversityList[index].description;

                            RegExp exp = RegExp(r"<[^>]*>",
                                multiLine: true, caseSensitive: true);
                            String parsedstring1 = html.replaceAll(exp, '');

                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  UniversityDetails(
                                    uniidx: unicontroller.UniversityList[index],
                                    desc: parsedstring1,
                                  ),
                                );
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(color: Colors.grey)),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            "${unicontroller.UniversityList[index].image}/${unicontroller.UniversityList[index].universityImage}",
                                            width: 110.0,
                                            height: 110.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Image.network("${unicontroller.UniversityList[index].image}/${unicontroller.UniversityList[index].universityImage}",height: 80,),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${unicontroller.UniversityList[index].university}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "${unicontroller.UniversityList[index].country}",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            // Text(parsedstring1,style: TextStyle(fontSize: 14,),),
                                            Text(
                                              parsedstring1.isEmpty
                                                  ? "title"
                                                  : parsedstring1.length > 100
                                                      ? "${parsedstring1.substring(0, 99)}...."
                                                      : parsedstring1,
                                              //length>15?'${ list_circular[index].title.substring(0,14)}...' :list_circular[index].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            //Text("${unicontroller.UniversityList[index].university}"),
                                          ],
                                        ))
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      );
              })
            : GetBuilder<ScholarshipController>(
                builder: (scholaShipCOntroller) => scholaShipCOntroller.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : scholaShipCOntroller.scholarDataList.isEmpty
                        ? const Center(
                            child: Text("No ScholarShip Available"),
                          )
                        : RefreshIndicator(
                    color: AppColors.primaryColor,
                    child: ListView.builder(
                  itemCount:
                  scholaShipCOntroller.scholarDataList.length,
                  itemBuilder: (context, index) {
                    String html = scholaShipCOntroller
                        .scholarDataList[index].overview ??
                        '';

                    RegExp exp = RegExp(r"<[^>]*>",
                        multiLine: true, caseSensitive: true);
                    String parsedstring1 = html.replaceAll(exp, '');
                    DateTime deadline=DateTime.parse(scholaShipCOntroller.scholarDataList[index].deadline.toString());

                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15),
                      child: Container(
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.outer)
                            ],
                            borderRadius: BorderRadius.all(
                                Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "ScolarShip : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].scholarship}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "ScolarShip Type : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].type}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "University : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].universityName}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Course : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].courseName}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Country : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].countryName}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),

                                  Row(
                                    children: [
                                      const Text(
                                        "Number Of Awards : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].awards}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Final Deadline : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${DateFormat("dd-MM-yyyy").format(deadline)}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),

                                  Row(
                                    children: [
                                      const Text(
                                        "Max Scholarship Per Student : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${scholaShipCOntroller.scholarDataList[index].max}",
                                          style: const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  const Text(
                                    "Description :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    parsedstring1,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            scholaShipCOntroller
                                .scholarDataList[index]
                                .isApplied ??
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
                                      color: AppColors
                                          .primaryColor,
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                                : scholaShipCOntroller.applying
                                ? Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                              ],
                            )
                                : Row(
                              children: [
                                const Expanded(
                                    child: SizedBox()),
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await scholaShipCOntroller
                                            .appyForScholarShip(
                                            scholaShipCOntroller
                                                .scholarDataList[
                                            index]
                                                .id
                                                .toString(),
                                            context);
                                        Get.find<
                                            ScholarshipController>()
                                            .getScholarShipData();
                                      },
                                      style: ElevatedButton
                                          .styleFrom(
                                        backgroundColor:
                                        AppColors
                                            .primaryColor,
                                        shape:
                                        const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .only(
                                            bottomRight:
                                            Radius
                                                .circular(
                                                20),
                                            topLeft: Radius
                                                .circular(
                                                20),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                          "Apply Now"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ), onRefresh: ()async{
                  controller.getUniversity();
                  Get.find<ScholarshipController>().getScholarShipData();
                })
              ),
      ),
    );
  }
}
