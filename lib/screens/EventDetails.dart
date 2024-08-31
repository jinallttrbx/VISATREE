// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:visatree/LoadingLayout.dart';
// import 'package:visatree/const_text.dart';
// import 'package:visatree/controller/eventController.dart';
// import 'package:visatree/util/images.dart';
//
// import 'appcontants.dart';
//
// class EventDetailScreen extends StatefulWidget {
//   const EventDetailScreen({super.key});
//
//   @override
//   State<EventDetailScreen> createState() => _EventdetailScreenState();
// }
//
// class _EventdetailScreenState extends State<EventDetailScreen> {
//   EventController eventcontroller = Get.find<EventController>();
//
//   @override
//   void initState() {
//     super.initState();
//     eventcontroller.EventList;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           titleSpacing: 0,
//           title: Row(
//             children: [
//               boldtext(Colors.white, 18, "Events Details"),
//             ],
//           ),
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10))),
//           elevation: 0,
//           backgroundColor: AppColors.primaryColor,
//         ),
//         body: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: GetX<EventController>(
//               builder: (eventcontroller) {
//                 return Padding(
//                     padding: const EdgeInsets.only(left: 10.0, top: 10),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Find Amazing Events For You ',
//                             style: TextStyle(
//                               color: Colors.black.withOpacity(0.75),
//                               fontSize: 20,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.40,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Image.asset(
//                                 images.crad,
//                                 height: 100,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 '23 EventScreen we are organizing',
//                                 style: TextStyle(
//                                   color: Colors.black
//                                       .withOpacity(0.699999988079071),
//                                   fontSize: 14,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   letterSpacing: 0.28,
//                                 ),
//                               )
//                             ],
//                           ),
//
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Text(
//                             'Today’s Event ',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.28,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: MediaQuery.of(context).size.height * 0.56,
//                             // width: 150,
//                             child: eventcontroller.EventList.isEmpty
//                                 ? const Text("No Events Available")
//                                 : eventcontroller.isLoading == true
//                                     ? const Center(
//                                         child: Center(
//                                         child: LoadingLayout(),
//                                       ))
//                                     : ListView.builder(
//                                         physics: const BouncingScrollPhysics(),
//                                         itemCount:
//                                             eventcontroller.EventList.length,
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 8),
//                                         scrollDirection: axisDirectionToAxis(
//                                             AxisDirection.left),
//                                         itemBuilder: (context, index) {
//                                           var inputFormat =
//                                               DateFormat('dd/MM/yyyy ').format(
//                                                   eventcontroller
//                                                       .EventList[index].date);
//                                           String html = eventcontroller
//                                               .EventList[index].venue;
//
//                                           RegExp exp = RegExp(
//                                               r'<[^>]*>|&[^;]+;',
//                                               multiLine: true,
//                                               caseSensitive: true);
//                                           String parsedstring1 =
//                                               html.replaceAll(exp, '');
//                                           print(parsedstring1);
//                                           String html1 = eventcontroller
//                                               .EventList[index].about;
//
//                                           RegExp exp1 = RegExp(
//                                               r'<[^>]*>|&[^;]+;',
//                                               multiLine: true,
//                                               caseSensitive: true);
//                                           String parsedstring2 =
//                                               html1.replaceAll(exp1, '');
//                                           print(parsedstring2);
//                                           return Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15.0),
//                                             child: Container(
//                                                 padding:
//                                                     const EdgeInsets.all(10),
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.8,
//                                                 decoration: ShapeDecoration(
//                                                   color: Colors.white,
//                                                   shape: RoundedRectangleBorder(
//                                                     side: const BorderSide(
//                                                         width: 0.50,
//                                                         color:
//                                                             Color(0x6DB09E9E)),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                   ),
//                                                   shadows: const [
//                                                     BoxShadow(
//                                                       color: Color(0x3F43749E),
//                                                       blurRadius: 4,
//                                                       offset: Offset(0, 2),
//                                                       spreadRadius: 0,
//                                                     ),
//                                                     BoxShadow(
//                                                       color: Color(0x3F43749E),
//                                                       blurRadius: 4,
//                                                       offset: Offset(2, 0),
//                                                       spreadRadius: 0,
//                                                     ),
//                                                     BoxShadow(
//                                                       color: Color(0x3F43749E),
//                                                       blurRadius: 4,
//                                                       offset: Offset(2, 0),
//                                                       spreadRadius: 0,
//                                                     )
//                                                   ],
//                                                 ),
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Image.asset(
//                                                         images.crad,
//                                                         height: 100,
//                                                         width: 100,
//                                                       ),
//                                                       Text(
//                                                         eventcontroller
//                                                             .EventList[index]
//                                                             .title
//                                                             .toString(),
//                                                         style: const TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 14,
//                                                           fontFamily: 'Poppins',
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           letterSpacing: 0.28,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               const Icon(
//                                                                 Icons
//                                                                     .calendar_month_rounded,
//                                                                 size: 15,
//                                                                 color: AppColors
//                                                                     .primaryColor,
//                                                               ),
//                                                               const SizedBox(
//                                                                 width: 10,
//                                                               ),
//                                                               Text(
//                                                                 inputFormat,
//                                                                 style:
//                                                                     const TextStyle(
//                                                                   color: Color(
//                                                                       0xFF27AC2C),
//                                                                   fontSize: 12,
//                                                                   fontFamily:
//                                                                       'Poppins',
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                   letterSpacing:
//                                                                       0.24,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           const SizedBox(
//                                                             height: 10,
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               const Icon(
//                                                                 Icons
//                                                                     .watch_later_outlined,
//                                                                 size: 15,
//                                                                 color: AppColors
//                                                                     .primaryColor,
//                                                               ),
//                                                               const SizedBox(
//                                                                 width: 10,
//                                                               ),
//                                                               Text(
//                                                                 eventcontroller
//                                                                     .EventList[
//                                                                         index]
//                                                                     .time,
//                                                                 style:
//                                                                     const TextStyle(
//                                                                   color: Color(
//                                                                       0xFF27AC2C),
//                                                                   fontSize: 12,
//                                                                   fontFamily:
//                                                                       'Poppins',
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                   letterSpacing:
//                                                                       0.24,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       const Divider(
//                                                         color: Colors.black,
//                                                       ),
//                                                       Text(
//                                                         eventcontroller
//                                                             .EventList[index]
//                                                             .subTitle
//                                                             .toString(),
//                                                         style: TextStyle(
//                                                           color: Colors.black
//                                                               .withOpacity(
//                                                                   0.800000011920929),
//                                                           fontSize: 12,
//                                                           fontFamily: 'Poppins',
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           letterSpacing: 0.24,
//                                                         ),
//                                                       ),
//                                                       const Divider(
//                                                         color: Colors.black,
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Text(
//                                                         'Venue : $parsedstring1',
//                                                         style: const TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 12,
//                                                           fontFamily: 'Poppins',
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           letterSpacing: 0.24,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Text(eventcontroller
//                                                           .EventList[
//                                                       index]
//                                                           .isApplied,),
//                                                       const Text(
//                                                         'About this event ',
//                                                         style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 12,
//                                                           fontFamily: 'Poppins',
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           letterSpacing: 0.24,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Text(
//                                                         parsedstring2,
//                                                         style: TextStyle(
//                                                           color: Colors.black
//                                                               .withOpacity(
//                                                                   0.800000011920929),
//                                                           fontSize: 12,
//                                                           fontFamily: 'Poppins',
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 15,
//                                                       ),
//
//                                                       GestureDetector(
//                                                         onTap: () {
//                                                           eventcontroller
//                                                               .RegisterEvent(
//                                                                   eventcontroller
//                                                                       .EventList[
//                                                                           index]
//                                                                       .id
//                                                                       .toString(),
//                                                                   context);
//                                                         },
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       10),
//                                                           child: Container(
//                                                             alignment: Alignment
//                                                                 .center,
//                                                             height: 50,
//                                                             width:
//                                                                 MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .width,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     gradient:
//                                                                         const LinearGradient(
//                                                                             colors: [
//                                                                           AppColors
//                                                                               .primaryColor2,
//                                                                           AppColors
//                                                                               .primaryColor,
//                                                                         ])),
//                                                             child: const Text(
//                                                               "Register",
//                                                               style: TextStyle(
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontSize: 20,
//                                                                 // fontFamily: 'Poppins',
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 )),
//                                           );
//                                         },
//                                       ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           // Text(
//                           //   'Upcoming Event ',
//                           //   style: TextStyle(
//                           //     color: Colors.black,
//                           //     fontSize: 14,
//                           //     fontFamily: 'Poppins',
//                           //     fontWeight: FontWeight.w600,
//                           //     letterSpacing: 0.28,
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   height: 20,
//                           // ),
//                           //
//                           // eventcontroller.isLoading==true?Center(child: Center(child: LoadingLayout(),)): ListView.builder(
//                           //     shrinkWrap: true,
//                           //     itemCount: eventcontroller.EventList.length,
//                           //     itemBuilder: (context,index){
//                           //       var inputFormat = DateFormat('dd/MM/yyyy ').format(eventcontroller.EventList[index].date);
//                           //       return Container(
//                           //         margin: EdgeInsets.all(10),
//                           //         decoration: BoxDecoration(
//                           //             color: Colors.white,
//                           //             borderRadius: BorderRadius.all(Radius.circular(10))
//                           //         ),
//                           //         padding: EdgeInsets.all(10),
//                           //         child: Row(
//                           //           children: [
//                           //             ClipRRect(
//                           //               borderRadius: BorderRadius.circular(5),
//                           //               child:  Image.asset(
//                           //                 images.crad,height: 100,width: 100,
//                           //                 // height: 150,
//                           //                 fit: BoxFit.fill,
//                           //               ),
//                           //             ),
//                           //             SizedBox(width: 10,),
//                           //             Expanded(child:   Column(
//                           //               crossAxisAlignment: CrossAxisAlignment.start,
//                           //               mainAxisAlignment: MainAxisAlignment.center,
//                           //               children: [
//                           //                 Text(
//                           //                   eventcontroller.EventList[index].title,
//                           //                   style: TextStyle(
//                           //                     color: Colors.black,
//                           //                     fontSize: 14,
//                           //                     fontFamily: 'Poppins',
//                           //                     fontWeight: FontWeight.w600,
//                           //                     letterSpacing: 0.28,
//                           //                   ),
//                           //                 ),
//                           //                 Divider(color: AppColors.primaryColor,),
//                           //                 Row(
//                           //                   children: [
//                           //                     Icon(Icons.calendar_month_rounded,size: 15,color: AppColors.primaryColor,),
//                           //                     SizedBox(width: 10,),
//                           //                     Text(
//                           //                       inputFormat,
//                           //                       style: TextStyle(
//                           //                         color: Color(0xFF27AC2C),
//                           //                         fontSize: 12,
//                           //                         fontFamily: 'Poppins',
//                           //                         fontWeight: FontWeight.w600,
//                           //                         letterSpacing: 0.24,
//                           //                       ),
//                           //                     ),
//                           //                   ],
//                           //                 ),
//                           //                 SizedBox(height: 5,),
//                           //                 Row(
//                           //                   children: [
//                           //                     Icon(Icons.watch_later_outlined,size: 15,color: AppColors.primaryColor,),
//                           //                     SizedBox(width: 10,),
//                           //                     Text(eventcontroller.EventList[index].time,
//                           //                       style: TextStyle(
//                           //                         color: Color(0xFF27AC2C),
//                           //                         fontSize: 12,
//                           //                         fontFamily: 'Poppins',
//                           //                         fontWeight: FontWeight.w600,
//                           //                         letterSpacing: 0.24,
//                           //                       ),),
//                           //                   ],
//                           //                 )
//                           //
//                           //
//                           //               ],
//                           //             )),
//                           //
//                           //
//                           //
//                           //           ],
//                           //         ),
//                           //       );
//                           //     })
//                           //
//                         ],
//                       ),
//                     ));
//               },
//             )),
//       ),
//     );
//   }
// }
