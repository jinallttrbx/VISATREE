
import 'package:flutter/material.dart';
import 'package:visatreenew/Widgets/const_text.dart';
import 'package:visatreenew/screens/Shortlisted/ShortlistedByUser.dart';
import 'package:visatreenew/screens/Shortlisted/adminsortscreen.dart';

import 'package:visatreenew/util/appcontants.dart';

class HomeShortListed extends StatefulWidget {
  const HomeShortListed({super.key});

  @override
  State<HomeShortListed> createState() => _HomeShortListedState();
}

class _HomeShortListedState extends State<HomeShortListed> {
  int selectedIndex = 0;
  // List<String> myUniName = [
  //   "Brock University",
  //   "University of Toronto",
  //   "Purdue University",
  //   "University of South Wales"
  // ];
  // List<String> adminSortUniName = [
  //   "Cambridge University",
  //   "University of Toronto",
  //   "Purdue University",
  //   "University of South Wales"
  // ];
  // List<String> myUniLogo = [
  //   images.appicon,
  //   images.logo,
  //   images.logomain,
  //   images.logow
  // ];
  // List<String> AdminUniLogo = [
  //   images.logow,
  //   images.logomain,
  //   images.logo,
  //   images.appicon
  // ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
appBar: AppBar(
  titleSpacing: 0,
  title: Row(
    children: [
      boldtext(Colors.white, 18, "Short Listed University"),
    ],
  ),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10))),
  elevation: 0,
  backgroundColor: AppColors.primaryColor,
),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Container(
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: const Color.fromARGB(163, 213, 208, 208),
                //         borderRadius: BorderRadius.circular(10)),
                //     width: MediaQuery.of(context).size.width,
                //     child: ButtonsTabBar(
                //         decoration: BoxDecoration(
                //           color: AppColors.primaryColor,
                //           // gradient: const LinearGradient(colors: [
                //           //   AppColors.primaryColor2,
                //           //   AppColors.primaryColor
                //           // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                //           // color: Color(0xFF439E5B),
                //           shape: BoxShape.rectangle,
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: [
                //             const BoxShadow(
                //               color: Color(0xFFFFFFFF),
                //               blurRadius: 4,
                //               offset: Offset(0, 4),
                //               spreadRadius: 0,
                //             )
                //           ],
                //         ),
                //         tabs: [
                //           Tab(
                //             child: Container(
                //               alignment: Alignment.center,
                //               width: MediaQuery.of(context).size.width * 0.42,
                //               child: const Text(
                //                 "My Shortlist ",
                //                 style: TextStyle(color: Colors.black),
                //               ),
                //             ),
                //           ),
                //           Tab(
                //             child: Container(
                //               alignment: Alignment.center,
                //               width: MediaQuery.of(context).size.width * 0.396,
                //               child: const Text(
                //                 "VisaTree Suggested ",
                //                 style: TextStyle(color: Colors.black),
                //               ),
                //             ),
                //           )
                //         ]),
                //   ),
                // ),
                Flexible(
                  child: TabBarView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      ShortbyUser(appbar: false),
                      AdminShortlisted(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
