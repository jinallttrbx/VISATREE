import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatreenew/ExamdetailsScreen.dart';
import 'package:visatreenew/Widgets/const_text.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:visatreenew/controller/examController.dart';
import 'package:visatreenew/model/exammodel.dart';
import 'package:visatreenew/screens/ExamScreen/examdetails.dart';
import 'package:visatreenew/util/appcontants.dart';


class ExamScreen extends StatefulWidget{

  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}
class _ExamScreenState extends State<ExamScreen> {
  List<Examdata> list = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,

            title: Row(
              children: [
                boldtext(Colors.white, 18, "Exam"),




              ],
            ),


            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            elevation: 0,
            backgroundColor:  AppColors.primaryColor,
          ),
        body: GetX<ExamController>(builder: (controller){
          return Container(
              child:RefreshIndicator(
                color: AppColors.primaryColor,
                child:  GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.ExamList.length,
                  padding: EdgeInsets.all(25),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,childAspectRatio: 2.8,mainAxisSpacing: 20,),
                  itemBuilder: ( context, index) {
                    // String overview =controller.ExamList[index].overview;
                    // RegExp overviewtext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showoverview = overview.replaceAll(overviewtext, '');
                    // print(showoverview);
                    // String practicePaper =controller.ExamList[index].practicePaper;
                    // RegExp practicePapertext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showpracticePaper = practicePaper.replaceAll(practicePapertext, '');
                    // print(showpracticePaper);
                    // String registration =controller.ExamList[index].registration;
                    // RegExp registrationtext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showregistration = registration.replaceAll(registrationtext, '');
                    // print(showregistration);
                    // String examdates =controller.ExamList[index].dates;
                    // RegExp examdatestext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showexamdates = examdates.replaceAll(examdatestext, '');
                    // print(showexamdates);
                    // String testcenter =controller.ExamList[index].testCenter;
                    // RegExp testcentertext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showtestcenter = testcenter.replaceAll(testcentertext, '');
                    // print(showtestcenter);
                    // String syllabus =controller.ExamList[index].syllabus;
                    // RegExp syllabustext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showsyllabus = syllabus.replaceAll(syllabustext, '');
                    // print(showsyllabus);
                    // String score =controller.ExamList[index].syllabus;
                    // RegExp scoretext = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    // String showscore = score.replaceAll(scoretext, '');
                    // print(showscore);
                    final overview = html_parser.parse(controller.ExamList[index].overview);
                    String parsedText = overview.body?.text ?? '';
                    String OVERVIEW = parsedText.replaceAll('\u00A0', '');
                    final practicepaper = html_parser.parse(controller.ExamList[index].practicePaper);
                    String parsedText1 = practicepaper.body?.text ?? '';
                    String PRACTICEPAPER = parsedText1.replaceAll('\u00A0', '');
                    final registration = html_parser.parse(controller.ExamList[index].registration);
                    String parsedText2 = registration.body?.text ?? '';
                    String REGISTRATION = parsedText2.replaceAll('\u00A0', '');
                    final dates = html_parser.parse(controller.ExamList[index].dates);
                    String parsedText3 = dates.body?.text ?? '';
                    String DATES = parsedText3.replaceAll('\u00A0', '');
                    final testcenter = html_parser.parse(controller.ExamList[index].testCenter);
                    String parsedText4 = testcenter.body?.text ?? '';
                    String TESTCENTER = parsedText4.replaceAll('\u00A0', '');
                    final syllabus = html_parser.parse(controller.ExamList[index].syllabus);
                    String parsedText5 = syllabus.body?.text ?? '';
                    String SYLLABUS = parsedText5.replaceAll('\u00A0', '');
                    // final overview = html_parser.parse(controller.ExamList[index].overview);
                    // String parsedText = overview.body?.text ?? '';
                    // String OVERVIEW = parsedText.replaceAll('\u00A0', '');
                    return  InkWell(
                        onTap: () {
                          Get.to(ExamDetails(
                            result:  SYLLABUS,
                            overview: OVERVIEW,
                            sample: PRACTICEPAPER,
                            registration: REGISTRATION,
                            dates: DATES,
                            testcenter: TESTCENTER,
                            syllabus: SYLLABUS,
                          ));
                        },
                        child: examContainer(
                            controller.ExamList[index].exam,
                        ));
                  },

                ),onRefresh: ()async{

              },
              ));
        })
      ),
    );
  }

}

Container examContainer(examName) {
  return Container(
    height: 50,
    width: 100,
    alignment: Alignment.center,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadows: [
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
      examName,
      style: TextStyle(color:
        AppColors.primaryColor2,
        fontSize: 36,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
