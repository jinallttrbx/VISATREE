import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/controller/eventController.dart';
import 'package:visatree/screens/Eventlistshow.dart';
import 'package:visatree/screens/Widgets/scholarshipUni.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/screens/countriesinfo.dart';
import 'package:visatree/screens/events.dart';
import 'package:visatree/screens/homeScrenn/homeSort.dart';
import 'package:visatree/screens/homeScrenn/homeUni.dart';
import 'package:visatree/screens/profileshow.dart';
import 'package:visatree/screens/university_search.dart';
import 'package:visatree/session%20management.dart';
import 'package:visatree/util/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EventController eventController = Get.find<EventController>();
  String firstname = "";
  String lastname = "";
  String image = "";
  SessionManagement sharedPreference = SessionManagement();

  @override
  void initState() {
    super.initState();
    eventController.EventList;
    setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: ()async{
         await eventController.EventList;
         eventController.getEvent();
         print(eventController.EventList.length);
          setdata();
        },
        child: ListView(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Profiledata(),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  HomeUniversityList(isDashBoard: false)),
                          );
                          //Get.to(const HomeUniversityList(isDashBoard: false));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                images.uni5,
                                color: AppColors.primaryColor,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "University",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ScholaShipUniversity(titleTxt: "Scholarship"));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                images.uni,
                                color: AppColors.primaryColor,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Scholarship",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to( HomeShortListed(title: "Shortlisted",));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                images.uni1,
                                color: AppColors.primaryColor,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Shortlisted ",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const CountriesInfo());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                images.uni2,
                                color: AppColors.primaryColor,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Country",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const EventScreen());
                          print("go to Event page ");
                        },
                        child: Container(
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                images.uni3,
                                color: AppColors.primaryColor,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Event",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const UniversitySearch());
                        },
                        child: Container(
                          padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                images.uni4,
                                color: AppColors.primaryColor,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Click To Find",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  eventController.EventList.isNotEmpty?SizedBox.shrink():const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Upcoming Event ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.28,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EventList(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  void setdata() async {
    print("SET DATA OF VISA TREE");
    final share = SessionManagement();
    String firstname1 = await share.isfirstname();
    String lastname1 = await share.islastname();
    String studentprofile = await share.isimage();
    setState(() {
      firstname =
          firstname1[0].toUpperCase() + firstname1.substring(1).toLowerCase();
      lastname =
          lastname1[0].toUpperCase() + lastname1.substring(1).toLowerCase();
      image = studentprofile;
    });
  }
}
