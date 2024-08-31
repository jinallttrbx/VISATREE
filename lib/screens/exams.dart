import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/controller/examController.dart';
import 'package:visatree/model/exammodel.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/screens/examdetails.dart';

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
                    String html =controller.ExamList[index].overview;
                    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    String parsedstring1 = html.replaceAll(exp, '');
                    print(parsedstring1);
                    String html1 =controller.ExamList[index].practicePaper;
                    RegExp exp1 = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    String parsedstring2 = html1.replaceAll(exp1, '');
                    print(parsedstring2);
                    String html2 =controller.ExamList[index].registration;
                    RegExp exp2 = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    String parsedstring3 = html2.replaceAll(exp2, '');
                    print(parsedstring3);
                    String html3 =controller.ExamList[index].dates;
                    RegExp exp3 = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    String parsedstring4 = html3.replaceAll(exp3, '');
                    print(parsedstring4);
                    String html4 =controller.ExamList[index].testCenter;
                    RegExp exp4 = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    String parsedstring5 = html4.replaceAll(exp4, '');
                    print(parsedstring5);
                    String html5 =controller.ExamList[index].syllabus;
                    RegExp exp5 = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                    String parsedstring6 = html5.replaceAll(exp5, '');
                    print(parsedstring6);

                    return  InkWell(
                        onTap: () {
                          Get.to(ExamDetails(
                            result:  controller.ExamList[index].exam,
                            overview: parsedstring1,
                            sample: parsedstring2,
                            registration: parsedstring3,
                            dates: parsedstring4,
                            testcenter: parsedstring5,
                            syllabus: parsedstring6,
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
      style: TextStyle(
        color: Color(0xFF43749E),
        fontSize: 36,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
