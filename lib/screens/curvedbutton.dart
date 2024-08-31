// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:visatree/const_text.dart';
// import 'package:visatree/controller/ScholarshipController.dart';
// import 'package:visatree/controller/examController.dart';
// import 'package:visatree/controller/homeController.dart';
// import 'package:visatree/controller/universityController.dart';
// import 'package:visatree/screens/HomeScreen.dart';
// import 'package:visatree/screens/Shortlisted/shortlisted.dart';
// import 'package:visatree/screens/Widgets/drawer.dart';
// import 'package:visatree/screens/apllicationhistory.dart';
// import 'package:visatree/screens/appcontants.dart';
// import 'package:visatree/screens/profile.dart';
// import 'package:visatree/screens/universitylist.dart';
// import 'package:visatree/session%20management.dart';
// import 'package:visatree/util/images.dart';
//
//
// class RootWidget extends StatefulWidget {
//   int? goTo;
//   RootWidget({super.key, this.goTo});
//
//   @override
//   State<RootWidget> createState() => _RootWidgetState();
// }
//
// class _RootWidgetState extends State<RootWidget> {
// //  var university = Get.put(UniversityController());
//   var scholar = Get.put(ScholarshipController());
// //  var exam = Get.put(ExamController());
//   var call = Get.put(allExtraexpemcesController());
//
//   GlobalKey _NavKey = GlobalKey();
//
//   List<Widget> rootDirection = [
//     Home(index: 0,),
//     ShortListed(),
//     UniversityList(),
//     ApplicationHistory(index: 3,),
//     ProfileScreen(index: 4,)
//   ];
//
//   int selected = 0;
//   String token="";
//   SessionManagement sharedPreference=SessionManagement();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     call.getLevel();
//     scholar.getScholarship();
//     //university.getUniversity();
//     //exam.getExam();
//     //expenses.getExpenses();
//     if (widget.goTo != null) {
//       setState(() {
//         selected = widget.goTo!;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => showPopup(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         drawer: CustomDrawer(),
//         appBar: AppBar(
//           title: Row(
//             children: [
//
//            selected==0? boldtext(Colors.white, 18, "Home"):selected==1? boldtext(Colors.white, 18, "Sort Listed university list"):selected==2? boldtext(Colors.white, 18, "university list"):selected==3? boldtext(Colors.white, 18, "Scolarship Univesity"):selected==4? boldtext(Colors.white, 18, "Profile"): boldtext(Colors.white, 18, ""),
//               Spacer(),
//               // Icon(Icons.search),
//               // Flexible(
//               //   child: TextField(
//               //     decoration: InputDecoration(
//               //         hintText: "Search for Clients",
//               //         hintStyle: TextStyle(color: Colors.white)),
//               //   ),
//               // ),
//
//             ],
//           ),
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30))),
//           elevation: 0,
//           backgroundColor:  AppColors.primaryColor,
//         ),
//         body: rootDirection[selected],
//         bottomNavigationBar: CurvedNavigationBar(
//           height: 50,
//           backgroundColor: Colors.white,
//           key: _NavKey,
//           items: [
//             selected==0?Image.asset(images.homeicon,height: 20,color: AppColors.primaryColor,):Image.asset(images.homeicon,height: 20,color: Colors.white,),
//             selected==1?Image.asset(images.universitySearchLogo,height: 20,color: AppColors.primaryColor,):Image.asset(images.universitySearchLogo,height: 20,color: Colors.white,),
//             selected==2?Image.asset(images.universityicon,height: 20,color: AppColors.primaryColor,):Image.asset(images.universityicon,height: 20,),
//             selected==3?Image.asset(images.scholarshipLogo,height: 20,color: AppColors.primaryColor,):Image.asset(images.scholarshipLogo,height: 20,),
//             selected==4?Image.asset(images.profileicon,height: 20,color: AppColors.primaryColor,):Image.asset(images.profileicon,height: 20,),
//
//
//             // Icon((myindex == 0) ? Icons.home : Icons.home_outlined),
//             // Icon((myindex == 1) ? Icons.message : Icons.message_outlined),
//             // Icon((myindex == 2) ? Icons.favorite_border : Icons.favorite),
//             // Icon((myindex == 3) ? Icons.people : Icons.people_alt_outlined),
//             // Icon((myindex == 4) ? Icons.perm_identity : Icons.perm_contact_cal_rounded)
//           ],
//           buttonBackgroundColor: Colors.white,
//           onTap: (index) {
//             setState(() {
//               selected = index;
//             });
//           },
//           animationCurve: Curves.fastOutSlowIn,
//           color: AppColors.primaryColor,
//         ),
//       ),
//     );
//   }
//   Future<bool> showPopup() async {
//     return await showDialog(
//       //show confirm dialogue
//       //the return value will be from "Yes" or "No" options
//       context: context,
//       builder: (context) => AlertDialog(
//         elevation: 5,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(30),
//           ),
//           side: BorderSide(color: Colors.grey),
//         ),
//
//         // title: Text(Apptext.forgot_password),
//         content: const Text(
//           'Do you want to exit app?',
//           style: TextStyle(fontFamily: "POPIN"),
//         ),
//         actionsAlignment: MainAxisAlignment.center,
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 const Spacer(),
//                 Container(
//                   height: 40,
//                   width: 60,
//                   decoration: const BoxDecoration(
//                       gradient: LinearGradient(colors: [
//
//                         Color(0xff00adba),
//                         Color(0xffaff9ff),
//
//                         // Color(0xffaff9ff),
//                         // Color(0xff00adba),
//                       ],
//                           begin: Alignment.topCenter, end: Alignment.bottomCenter),
//
//                       borderRadius: BorderRadius.all(Radius.circular(10))
//                   ),
//                   child:   GestureDetector(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Center(
//                         child: Text(
//                           'No',
//                           style: TextStyle(fontFamily: "POPIN",color: Colors.white),
//                         ),
//                       )),
//                 ),
//                 const Spacer(),
//                 Container(
//
//                   height: 40,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(colors: [
//                         Color(0xff00adba),
//                         Color(0xffaff9ff),
//
//                         // Color(0xffaff9ff),
//                         // Color(0xff00adba),
//                       ],
//                           begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                       borderRadius: BorderRadius.all(Radius.circular(10))
//                   ),
//                   child: GestureDetector(
//                       onTap: () {
//                         SystemNavigator.pop();
//                         //   Navigator.pop(context);
//                       },
//                       child: Center(
//                         child: Text(
//                           'Yes',
//                           style: TextStyle(fontFamily: "POPIN",color: Colors.white),
//                         ),
//                       )),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           )
//         ],
//       ),
//     ) ??
//         false; //if showDialouge had returned null, then return false
//   }
//
//
//
// }

import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/controller/ProfileController.dart';
import 'package:visatree/controller/ScholarshipController.dart';
import 'package:visatree/controller/Searchuniversity.dart';
import 'package:visatree/controller/Shortlistbyusercontroller.dart';
import 'package:visatree/controller/applyUniController.dart';
import 'package:visatree/controller/changepasswordcontroller.dart';
import 'package:visatree/controller/chat_controller.dart';
import 'package:visatree/controller/documentcontroller.dart';
import 'package:visatree/controller/eventController.dart';
import 'package:visatree/controller/examController.dart';
import 'package:visatree/controller/homeController.dart';
import 'package:visatree/controller/universityController.dart';
import 'package:visatree/example.dart';
import 'package:visatree/screens/HomeScreen.dart';
import 'package:visatree/screens/Shortlisted/shortlisted.dart';
import 'package:visatree/screens/Widgets/scholarshipUni.dart';
import 'package:visatree/screens/aboutus.dart';
import 'package:visatree/screens/apllicationhistory.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/screens/changepassword.dart';
import 'package:visatree/screens/chatscreen.dart';
import 'package:visatree/screens/countriesinfo.dart';
import 'package:visatree/screens/events.dart';
import 'package:visatree/screens/exams.dart';
import 'package:visatree/screens/loginscreen.dart';
import 'package:visatree/screens/profile.dart';
import 'package:visatree/screens/university_search.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/util/images.dart';
import 'homeScrenn/homeUni.dart';

const String dashboard = "Page 1";
const String student = "Page 2";
const String attendance = "Page 3";
const String title = "DashBoard";

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: title);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _currentIndex;
  String firstname = "";

  SessionManagement sharedPreference = SessionManagement();
  var home = Get.put(allExtraexpemcesController());
  var university = Get.put(UniversityController());
  var changepassword = Get.put(ChangePasswordController());
  var applyuniversity = Get.put(ApplyUniController());
  var searchunivercity = Get.put(SearchUnivercityController());
  var document = Get.put(DocumentController());
  var shortbuuni = Get.put(ShortByuserController());
  var profile = Get.put(ProfileController());
  var exam = Get.put(ExamController());
  var event = Get.put(EventController());
  var scholar = Get.put(ScholarshipController());
  var chat = Get.put(ChatController());

  String token = "";

  var options = [];

  @override
  void initState() {
    _currentIndex = 0;

    super.initState();
    home.getCountry();
    home.getCourse();
    home.getProgram();
    profile.getdata();
    applyuniversity.getapplyUniversity();
    searchunivercity.searchuser;
    university.getUniversity();
    university.getadminUniversity();
    scholar.getScholarship();
    // changepassword.Changepassword("", "", "", context);
    exam.getExam();
    event.getEvent();
    document.getuploadeddocument();
    chat.initMessaging();
    shortbuuni.getShortUniversity();
    shortbuuni.getadminShortUniversity();
    setdata();
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Do you want to exit?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor),
                          onPressed: () async {
                            SystemNavigator.pop();
                          },
                          child: const Text("Yes"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    debugPrintBeginFrameBanner = false;

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              _currentIndex == 0
                  ? boldtext(Colors.white, 18, "Home")
                  : _currentIndex == 1
                  ? boldtext(Colors.white, 18, "Shortlisted university ")
                  : _currentIndex == 2
                  ? boldtext(Colors.white, 18, "University ")
                  : _currentIndex == 3
                  ? boldtext(
                  Colors.white, 18, "Application History")
                  : _currentIndex == 4
                  ? boldtext(Colors.white, 18, "Profile")
                  : boldtext(Colors.white, 18, ""),
            ],
          ),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.chat),
        ),
        body: _currentIndex == 0
            ? Home()
            : _currentIndex == 1
            ?  ShortListed()
            : _currentIndex == 2
            ? const HomeUniversityList(
          isDashBoard: true,
        )
            : _currentIndex == 3
            ? const ApplicationHistory()
            : const ProfileScreen(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors.secondaryColor,
          ),
          child: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppColors.primaryColor,
            animationCurve: Curves.fastLinearToSlowEaseIn,
            color: AppColors.primaryColor,
            //  type: BottomNavigationBarType.fixed,
            // currentIndex: currentIndex,
            //  selectedItemColor: TempDataClass.appPrimaryColor,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              _currentIndex == 0
                  ?  Image.asset(images.icon5,height: 25,color: AppColors.secondaryColor,)
                  :  SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(images.icon5,height: 25,color: AppColors.secondaryColor,),
                      Text("Home",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                          ))
                    ],
                  )),
              _currentIndex == 1
                  ?  Image.asset(images.icon4,height: 25,color: AppColors.secondaryColor,)
                  :  SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(images.icon4,height: 25,color: AppColors.secondaryColor,),
                      Text("Shortlist",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                          ))
                    ],
                  )),
              _currentIndex == 2
                  ?   Image.asset(images.icon3,height: 25,color: AppColors.secondaryColor,)
                  :  SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(images.icon3,height: 25,color: AppColors.secondaryColor,),
                      Text("University",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                          ))
                    ],
                  )),
              _currentIndex == 3
                  ?  Image.asset(images.icon2,height: 25,color: AppColors.secondaryColor,)
                  :  SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Image.asset(images.icon2,height: 25,color: AppColors.secondaryColor,),

                      Text("History",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                          ))
                    ],
                  )),
              _currentIndex == 4
                  ?    Image.asset(images.icon1,height: 25,color: AppColors.secondaryColor,)
                  :  SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(images.icon1,height: 25,color: AppColors.secondaryColor,),
                      Text("Profile",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColor,
                            fontSize: 10,
                          ))
                    ],
                  )),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.green,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 80,
                              child: DrawerHeader(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Image.asset(images.appicon),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        firstname,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.48,
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            ListTile(
                              onTap: () {
                                Get.back();
                                changeTab(0);
                              },
                              leading: Image.asset(
                                images.icon5,
                                color: Colors.white,
                                height: 20,
                              ),
                              title: const Text(
                                "Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),

                            // ListTile(
                            //   onTap: () {
                            //     Get.back();
                            //     changeTab(4);
                            //   },
                            //   leading: Image.asset(
                            //     images.icon3,
                            //     color: Colors.white,
                            //     height: 20,
                            //   ),
                            //   title: const Text(
                            //     "My Profile",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 20,
                            //       fontFamily: 'Poppins',
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),

                            // const Divider(
                            //   color: Colors.white,
                            // ),
                            ListTile(
                              leading: Image.asset(
                                images.icon2,
                                color: Colors.white,
                                height: 20,
                              ),
                              onTap: () {
                                Get.back();
                                Get.to(const ExamScreen());
                              },
                              title: const Text(
                                "Exam",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ScholaShipUniversity(
                                  titleTxt: "Scholarship",
                                ));
                              },
                              child: ListTile(
                                leading: Image.asset(
                                  images.uni,
                                  color: Colors.white,
                                  height: 20,
                                ),
                                title: const Text(
                                  "Scholarships",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            ListTile(
                              onTap: () {
                                Get.back();
                                Get.to(const UniversitySearch());
                              },
                              leading: Image.asset(
                                images.uni4,
                                color: Colors.white,
                                height: 20,
                              ),
                              title: const Text(
                                "University Search",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            ListTile(
                              onTap: () {
                                Get.back();
                                Get.to(const CountriesInfo());
                              },
                              leading: Image.asset(
                                images.uni2,
                                color: Colors.white,
                                height: 20,
                              ),
                              title: const Text(
                                "Countries Info.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            ListTile(
                              leading: Image.asset(
                                images.uni3,
                                color: Colors.white,
                                height: 20,
                              ),
                              onTap: () {
                                Get.back();
                                Get.to(const EventScreen());
                              },
                              title: const Text(
                                "Events",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            // ListTile(
                            //   leading: Image.asset(
                            //     images.uni1,
                            //     color: Colors.white,
                            //     height: 20,
                            //   ),
                            //   onTap: () {
                            //     Get.back();
                            //     changeTab(1);
                            //   },
                            //   title: const Text(
                            //     "ShortListed University",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 20,
                            //       fontFamily: 'Poppins',
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),
                            // const Divider(
                            //   color: Colors.white,
                            // ),
                            // ListTile(
                            //   onTap: () {
                            //     Get.back();
                            //     changeTab(3);
                            //     // Navigator.push(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) => RootWidget(
                            //     //           goTo: 3,
                            //     //         )));
                            //   },
                            //   leading: Image.asset(
                            //     images.icon4,
                            //     color: Colors.white,
                            //     height: 20,
                            //   ),
                            //   title: const Text(
                            //     "Application History",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 20,
                            //       fontFamily: 'Poppins',
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),
                            // const Divider(
                            //   color: Colors.white,
                            // ),
                            ListTile(
                              onTap: () async {
                                const url = 'https://play.google.com/store/apps/';
                                try {
                                  await Share.share(url);
                                } catch (e) {
                                  print('Share Error------------$e');
                                }

                                // for files share
                                // Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
                              },
                              leading: Image.asset(
                                images.invite,
                                height: 20,
                              ),
                              title: const Text(
                                "Invite Friends",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            // ListTile(
                            //   onTap: () {
                            //     Get.back();
                            //     Get.to(ChatSupport());
                            //   },
                            //   leading: Image.asset(
                            //     images.chatsupport,
                            //     height: 20,
                            //   ),
                            //   title: Text("Chat Support",style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 20,
                            //     fontFamily: 'Poppins',
                            //     fontWeight: FontWeight.w500,
                            //   ),),
                            // ),
                            // Divider(
                            //   color: Colors.white,
                            // ),
                            ListTile(
                              onTap: () {
                                Get.back();
                                Get.to(const AboutUs());
                              },
                              leading: Image.asset(
                                images.aboutus,
                                height: 20,
                              ),
                              title: const Text(
                                "About Us",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            ListTile(
                              onTap: () {
                                Get.back();
                                Get.to(const ChangePassword());
                              },
                              leading: Image.asset(
                                images.changepassword,
                                height: 20,
                              ),
                              title: const Text(
                                "Change Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.power_settings_new_sharp,
                                color: Colors.white,
                              ),
                              onTap: () {
                                _logout(context);
                              },
                              title: const Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> LogoutshowPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        // title: Text(Apptext.forgot_password),
        content: const Text(
          'Do you want to logout app?',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Medium"),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(fontFamily: "Medium", color: Colors.black),
              )),
          const SizedBox(
            width: 20,
          ),
          TextButton(
              onPressed: () async {
                sharedPreference.getAllPrefsClear();
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()),
                      (route) => false,
                );
              },
              child: const Text(
                'Yes',
                style: TextStyle(fontFamily: "Medium", color: Colors.black),
              )),
        ],
      ),
    ) ??
        false; //if showDialouge had returned null, then return false
  }

  void openWhatsapp(
      {required BuildContext context,
        required String text,
        required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  void setdata() async {
    print("Set Data to user ");
    SessionManagement share = await SessionManagement();
    String studphone1 = await share.isphone();
    String studemail1 = await share.isemail();
    String studage1 = await share.isage();

    String studgender1 = await share.isgender();

    String firstname1 = await share.isfirstname();
    String lastname1 = await share.islastname();
    setState(() {
      firstname = firstname1;
    });
  }

  _logout(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            insetPadding: const EdgeInsets.only(left: 10, right: 10),
            iconPadding: EdgeInsets.zero,
            content: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_rounded),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child:   Text(
                        "Are you sure you want to log out?",style: TextStyle( fontSize: 18,fontFamily: "Poppins"
                      ),
                      ),),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () async {
                            final session =
                            SessionManagement();
                            await session
                                .getAllPrefsClear();
                            Navigator.of(context)
                                .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                  const LoginScreen(),
                                ),
                                    (route) => false);
                          },
                          child:
                          Text( "Confirm logout",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: 14),),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text( "Cancel",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: 14),),
                        )
                      ],
                    )
                  ],
                )),
          );
        });
  }
}

class Menu {
  var id;
  int? positions = 0;
  var Name;
  var name;
  var icon;
  var ischild;
  Menu(this.name, this.icon, this.ischild);
  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }
}
