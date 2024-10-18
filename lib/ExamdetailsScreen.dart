// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/material.dart';
// import 'package:visatree/Widgets/const_text.dart';
//
//
// import 'package:visatree/util/appcontants.dart';
//
// class ExamDetails extends StatefulWidget {
//   var overview, result, sample, registration, syllabus, dates, testcenter;
//   ExamDetails(
//       {super.key,
//         @required this.overview,
//         @required this.result,
//         @required this.sample,
//         @required this.registration,
//         @required this.syllabus,
//         @required this.dates,
//         @required this.testcenter});
//
//   @override
//   State<ExamDetails> createState() => _ExamDetailsState();
// }
//
// class _ExamDetailsState extends State<ExamDetails> {
//   // var overview;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         titleSpacing: 0,
//
//         title: Row(
//           children: [
//             boldtext(Colors.white, 18, "Exam Details"),
//
//
//
//
//           ],
//         ),
//
//
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10))),
//         elevation: 0,
//         backgroundColor:  AppColors.primaryColor,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10,),
//           Padding(padding:   const EdgeInsets.only(left:15.0),child: Text(
//         "Result",
//         style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//       ), ) ,
//             ExamDetailsContainer(
//               data: widget.result,
//             ),
//         Padding(padding:   const EdgeInsets.only(left: 15.0,top: 10),child:  Text(
//               "Overview",
//               style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//             ),),
//             ExamDetailsContainer(
//               data: widget.overview,
//             ),
//         Padding(padding:   const EdgeInsets.only(left: 15.0,top: 10),child:  Text(
//               "Sample",
//               style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//             ),),
//             ExamDetailsContainer(
//               data: widget.sample,
//             ),
//         Padding(padding:   const EdgeInsets.only(left: 15.0,top: 10),child:  Text(
//               "Registration",
//               style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//             ),),
//             ExamDetailsContainer(
//               data: widget.registration,
//             ),
//         Padding(padding:   const EdgeInsets.only(left: 15.0,top: 10),child: Text(
//               "Syllabus",
//               style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//             ),),
//             ExamDetailsContainer(
//               data: widget.syllabus,
//             ),
//         Padding(padding:   const EdgeInsets.only(left: 15.0,top: 10),child:    Text(
//               "Dates",
//               style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//             ),),
//             ExamDetailsContainer(
//               data: widget.dates,
//             ),
//         Padding(padding:   const EdgeInsets.only(left: 15.0,top: 10),child: Text(
//               "Test Center",
//               style: TextStyle(fontSize:20,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
//             ),),
//             ExamDetailsContainer(
//               data: widget.testcenter,
//             ),
//
//
//
//
//           ],
//         ),
//       ),
//         bottomNavigationBar: Container(
//           margin: EdgeInsets.all(16),
//           height: 50,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
//               onPressed: (){
//
//               },
//               child: boldtext(AppColors.white, 16, "Enroll Now")
//
//           ),
//         )
//     );
//   }
// }
//
// class ExamDetailsContainer extends StatelessWidget {
//   ExamDetailsContainer({super.key, required this.data});
//   String data;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left:15.0,top: 10,right: 15),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         width: MediaQuery.of(context).size.width,
//         decoration: ShapeDecoration(
//           shape: RoundedRectangleBorder(
//             side: const BorderSide(
//                 width: 0.50,
//                 strokeAlign: BorderSide.strokeAlignOutside,
//                 color: AppColors.white
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//
//         ),
//         child: Text(
//           data,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 15,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
