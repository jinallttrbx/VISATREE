import 'package:flutter/material.dart';
import 'package:visatree/screens/Widgets/bottomappbar.dart';

import 'appcontants.dart';

class IELTS extends StatefulWidget {
  const IELTS({super.key});

  @override
  State<IELTS> createState() => _IELTSState();
}

class _IELTSState extends State<IELTS> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        
        appBar: AppBar(leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Exam Details"),
          bottom: TabBar(
              isScrollable: true,
              // dividerColor: AppColors.secondaryColor,
              indicatorColor: AppColors.secondaryColor,
              tabs: [
                Tab(
                  text: "OVERVIEW",
                ),
                Tab(
                  text: "RESULT",
                ),
                Tab(
                  text: "SAMPLE",
                ),
                Tab(
                  text: "REGISTRATION",
                ),
                Tab(
                  text: "SYLLABUS",
                ),
                Tab(
                  text: "DATES",
                ),
                Tab(
                  text: "TEST CENTER",
                ),
              ]),
        ),
        body: TabBarView(
          // controller: ,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text("Overview"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Result"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Sample"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Registration"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Syllabus"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Dates"),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Test Center"),
            ),
          ],
          // tabs: [Text("data"), Text("data"), Text("data")],
        ),
      ),
    );
  }
}
