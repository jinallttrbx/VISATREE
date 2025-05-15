import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatreenew/Widgets/const_text.dart';

import 'package:visatreenew/controller/applyUniController.dart';
import 'package:visatreenew/util/ApiUrl.dart';
import 'package:visatreenew/util/appcontants.dart';

class ApplicationHistory extends StatefulWidget {
 final bool appbar;
   ApplicationHistory({super.key,required this.appbar});

  @override
  State<ApplicationHistory> createState() => _ApplicationHistoryState();
}

class _ApplicationHistoryState extends State<ApplicationHistory> {
  @override
  void initState() {
    Get.find<ApplyUniController>().getapplyUniversity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar!=true?AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            boldtext(
                Colors.white, 18, "Application History")

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
      ):null,
      body: GetX<ApplyUniController>(
        builder: (controller) => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.appliedUniversityList.isEmpty?Container(child: Center(child: Text("History Not Found"),),):
       RefreshIndicator(
         color: AppColors.primaryColor,

           child:  ListView.builder(
         physics: const BouncingScrollPhysics(),
         itemCount: controller.appliedUniversityList.length,
         padding: const EdgeInsets.all(10),
         itemBuilder: (context, index) {
           return Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Container(
               decoration: ShapeDecoration(
                 color: Colors.white,
                 shape: RoundedRectangleBorder(
                   side: const BorderSide(
                       width: 0.50, color: Color(0x7F43749E)),
                   borderRadius: BorderRadius.circular(20),
                 ),
                 shadows: const [
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
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   ClipRRect(
                     borderRadius: const BorderRadius.only(
                       topLeft: Radius.circular(20),
                       topRight: Radius.circular(20),
                     ),
                     child: Image.network(
                       "${ApiUrl.BASEURL}admin/images/university/${controller.appliedUniversityList[index].universityBanner}",
                       height: 150,
                       fit: BoxFit.fitWidth,
                       width: double.infinity,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(10),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         controller.appliedUniversityList[index]
                             .universityName ==
                             null
                             ? const SizedBox.shrink()
                             : Text(
                           controller.appliedUniversityList[index]
                               .universityName ??
                               '',
                           style: const TextStyle(
                             color: Colors.black,
                             fontSize: 18,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           "${controller.appliedUniversityList[index].countryName}",
                           style: const TextStyle(
                            color: AppColors.primaryColor2,
                             fontSize: 16,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           "${controller.appliedUniversityList[index].courseName}",
                           style: const TextStyle(
                             color: AppColors.primaryColor2,
                             fontSize: 16,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           "${controller.appliedUniversityList[index].levelName}",
                           style: const TextStyle(
                             color: AppColors.primaryColor2,
                             fontSize: 14,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         Text(
                           "${controller.appliedUniversityList[index].programName}",
                           style: const TextStyle(
                             color: AppColors.primaryColor2,
                             fontSize: 16,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           );
         },
       ), onRefresh: ()async {
         await Get.find<ApplyUniController>().getapplyUniversity();
       })
      ),
    );
  }
}

Padding ApplicationButton(btwidth, btncolor, btnName, btmtxtcolor) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      alignment: Alignment.center,
      width: btwidth,
      height: 40,
      decoration: ShapeDecoration(
        color: btncolor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: btncolor),
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
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
        btnName,
        style: TextStyle(
          color: btmtxtcolor,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
