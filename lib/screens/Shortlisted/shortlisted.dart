// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/material.dart';
// import 'package:visatree/screens/Shortlisted/ShortlistedByUser.dart';
// import 'package:visatree/screens/Shortlisted/adminsortscreen.dart';
//
// import 'package:visatree/util/appcontants.dart';
//
// class ShortListed extends StatefulWidget {
//   const ShortListed({super.key});
//
//   @override
//   State<ShortListed> createState() => _ShortListedState();
// }
//
// class _ShortListedState extends State<ShortListed> {
//   int selectedIndex = 0;
//   // List<String> myUniName = [
//   //   "Brock University",
//   //   "University of Toronto",
//   //   "Purdue University",
//   //   "University of South Wales"
//   // ];
//   // List<String> adminSortUniName = [
//   //   "Cambridge University",
//   //   "University of Toronto",
//   //   "Purdue University",
//   //   "University of South Wales"
//   // ];
//   // List<String> myUniLogo = [
//   //   images.appicon,
//   //   images.logo,
//   //   images.logomain,
//   //   images.logow
//   // ];
//   // List<String> AdminUniLogo = [
//   //   images.logow,
//   //   images.logomain,
//   //   images.logo,
//   //   images.appicon
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: SafeArea(
//         child: Scaffold(
//
//             body: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: const Color.fromARGB(163, 213, 208, 208),
//                     borderRadius: BorderRadius.circular(10)),
//                 width: MediaQuery.of(context).size.width,
//                 child: ButtonsTabBar(
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryColor,
//                       // gradient: const LinearGradient(colors: [
//                       //   AppColors.primaryColor2,
//                       //   AppColors.primaryColor
//                       // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                       // color: Color(0xFF439E5B),
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         const BoxShadow(
//                           color: Color(0xFFFFFFFF),
//                           blurRadius: 4,
//                           offset: Offset(0, 4),
//                           spreadRadius: 0,
//                         )
//                       ],
//                     ),
//                     tabs: [
//                       Tab(
//                         child: Container(
//                           alignment: Alignment.center,
//                           width: MediaQuery.of(context).size.width * 0.42,
//                           child: const Text(
//                             "My Shortlist ",
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Container(
//                           alignment: Alignment.center,
//                           width: MediaQuery.of(context).size.width * 0.396,
//                           child: const Text(
//                             "VisaTree Suggested ",
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       )
//                     ]),
//               ),
//             ),
//              Flexible(
//               child: TabBarView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 children: [
//                   ShortbyUser(),
//                  AdminShortlisted(),
//                 ],
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/Widgets/const_text.dart';
import 'package:visatree/screens/Shortlisted/ShortlistedByUser.dart';
import 'package:visatree/screens/Shortlisted/adminsortscreen.dart';
import 'package:visatree/util/appcontants.dart';







class ShortListed extends StatefulWidget {
  const ShortListed({super.key});

  @override
  State<ShortListed> createState() => _ShortListedState();
}

class _ShortListedState extends State<ShortListed> {
  final _controller = PageController();



  bool isView = true;
  String title="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title="service";
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 2,
      child: Scaffold(
// appBar: AppBar(
//           titleSpacing: 0,
//           title: Row(
//             children: [
//
//                    boldtext(Colors.white, 18, "Shortlisted university "),
//             ],
//           ),
//           shape:  RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10),
//             ),
//           ),
//           elevation: 0,
//           backgroundColor: AppColors.primaryColor,
//         ),

        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(163, 213, 208, 208),
                     borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,

                width: MediaQuery.of(context).size.width,
                child: ButtonsTabBar(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor
                  ),

                    tabs: [
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: boldtext(AppColors.black,14,
                            "My Shortlist",
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.396,
                          child:  boldtext(AppColors.black,14,
                            "VisaTree Suggested ",

                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Flexible(
              child: TabBarView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  ShortbyUser(),
                  AdminShortlisted(),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
