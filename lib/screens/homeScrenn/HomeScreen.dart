import 'package:flutter/material.dart';
import 'package:visatree/screens/homeScrenn/home.dart';


class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var time = DateTime.now();
  // var home=Get.put(allExtraexpemcesController());
  // var university=Get.put(UniversityController());
  // var changepassword=Get.put(ChangePasswordController());
  // var applyuniversity=Get.put(ApplyUniController());
  // var profile=Get.put(ProfileController());
  // var exam=Get.put(ExamController());
  // var scholar=Get.put(ScholarshipController());

  String token = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // home.getCountry();
    // home.getCourse();
    // home.getProgram();
    // home.getLevel();
    // profile.getdata();
    // applyuniversity.getapplyUniversity();
    // university.getUniversity();
    // scholar.getScholarship();
    // changepassword.Changepassword("", "", "");
    // exam.getExam();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeScreen());
  }
}
