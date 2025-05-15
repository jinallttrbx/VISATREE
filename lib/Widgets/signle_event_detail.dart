import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visatreenew/util/images.dart';

import '../../controller/eventController.dart';
import 'package:visatreenew/util/appcontants.dart';

class SingleEventDetailPage extends StatefulWidget {
  final dynamic data;
  const SingleEventDetailPage({super.key, this.data});

  @override
  State<SingleEventDetailPage> createState() => _SingleEventDetailPageState();
}

class _SingleEventDetailPageState extends State<SingleEventDetailPage> {
  String inputFormat = '';
  String parsedstring2 = '';
  String parsedstring1 = '';
  @override
  void initState() {
    inputFormat = DateFormat('dd/MM/yyyy ').format(widget.data.date);
    String html = widget.data.venue;

    RegExp exp =
        RegExp(r'<[^>]*>|&[^;]+;', multiLine: true, caseSensitive: true);
    parsedstring1 = html.replaceAll(exp, '');
    String html1 = widget.data.about;
    RegExp exp1 =
        RegExp(r'<[^>]*>|&[^;]+;', multiLine: true, caseSensitive: true);
    parsedstring2 = html1.replaceAll(exp1, '');
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
            padding: const EdgeInsets.all(10),
            // decoration: ShapeDecoration(
            //   color: Colors.white,
            //   shape: RoundedRectangleBorder(
            //     side: const BorderSide(width: 0.50, color: Color(0x6DB09E9E)),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   shadows: const [
            //     BoxShadow(
            //       color: Color(0x3F43749E),
            //       blurRadius: 4,
            //       offset: Offset(0, 2),
            //       spreadRadius: 0,
            //     ),
            //     BoxShadow(
            //       color: Color(0x3F43749E),
            //       blurRadius: 4,
            //       offset: Offset(2, 0),
            //       spreadRadius: 0,
            //     ),
            //     BoxShadow(
            //       color: Color(0x3F43749E),
            //       blurRadius: 4,
            //       offset: Offset(2, 0),
            //       spreadRadius: 0,
            //     )
            //   ],
            // ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.data.eventImage,
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    widget.data.title.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.28,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 15,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            inputFormat,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 15,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.data.time,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(
                    widget.data.subTitle.toString(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Venue : $parsedstring1',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'About this event ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.24,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    parsedstring2,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  widget.data.isApplied==true?Container(
                    child: Center(child: Text("Already Registered",style: TextStyle(fontSize: 20,color: AppColors.primaryColor),),),
                  ) :  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        EventController eventcontroller =
                            Get.find<EventController>();
                        eventcontroller.RegisterEvent(
                            widget.data.id.toString(), context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor,
                              // gradient: const LinearGradient(colors: [
                              //   AppColors.primaryColor2,
                              //   AppColors.primaryColor,
                              // ])
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              // fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            )),
      ),
    );
  }
}
