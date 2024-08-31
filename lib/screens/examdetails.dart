import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../const_text.dart';
import 'appcontants.dart';

class ExamDetails extends StatefulWidget {
  var overview, result, sample, registration, syllabus, dates, testcenter;
  ExamDetails(
      {super.key,
      @required this.overview,
      @required this.result,
      @required this.sample,
      @required this.registration,
      @required this.syllabus,
      @required this.dates,
      @required this.testcenter});

  @override
  State<ExamDetails> createState() => _ExamDetailsState();
}

class _ExamDetailsState extends State<ExamDetails> {
  // var overview;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,

          title: Row(
            children: [
              boldtext(Colors.white, 18, "Exam Details"),




            ],
          ),


          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 0,
          backgroundColor:  AppColors.primaryColor,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(163, 213, 208, 208),
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  child: ButtonsTabBar(
                      physics: const ScrollPhysics(),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              AppColors.primaryColor2,
                              AppColors.primaryColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        // color: Color(0xFF439E5B),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
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
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Overview",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Result",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Sample",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Registration",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Syllabus",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Dates",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              "Test Center",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              Flexible(
                child: TabBarView(
                  // physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExamDetailsContainer(
                            data: widget.overview,
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [ExamDetailsContainer(data: widget.result)],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExamDetailsContainer(
                            data: widget.sample,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExamDetailsContainer(
                            data: widget.registration,
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [ExamDetailsContainer(data: widget.syllabus)],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExamDetailsContainer(
                            data: widget.dates,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ExamDetailsContainer(
                            data: widget.testcenter,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExamDetailsContainer extends StatelessWidget {
  ExamDetailsContainer({super.key, required this.data});
  String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.50,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFF43749E),
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
        child: Text(
          data,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
// Padding ExamDetailsContainer(data) {
//   return Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: Container(
//       padding: EdgeInsets.all(8),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.width,
//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             width: 0.50,
//             strokeAlign: BorderSide.strokeAlignOutside,
//             color: Color(0xFF43749E),
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         shadows: [
//           BoxShadow(
//             color: Color(0x3F43749E),
//             blurRadius: 4,
//             offset: Offset(0, 2),
//             spreadRadius: 0,
//           ),
//           BoxShadow(
//             color: Color(0x3F43749E),
//             blurRadius: 4,
//             offset: Offset(2, 0),
//             spreadRadius: 0,
//           ),
//           BoxShadow(
//             color: Color(0x3F43749E),
//             blurRadius: 4,
//             offset: Offset(2, 0),
//             spreadRadius: 0,
//           )
//         ],
//       ),
//       child: Text(
//         data,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 15,
//           fontFamily: 'Poppins',
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     ),
//   );
// }
