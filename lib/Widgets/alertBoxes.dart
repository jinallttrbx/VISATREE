import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';
import 'package:visatree/Widgets/const_text.dart';
import 'package:visatree/util/appcontants.dart';

import 'package:visatree/util/images.dart';
import 'package:visatree/util/spacer.dart';



showExitPopup() {
  Get.dialog(Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: Get.width * 0.8,
      height: 200,
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.black, 18, 'Exit App', center: true)),
          vertical(30),
          Material(
            type: MaterialType.transparency,
            child: mediumtext(Colors.black, 14, 'Do you want to exit App?',
                center: true),
          ),
          vertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: const Center(child: Text("No")),
                  ),
                ),
              ),
              horizental(20),
              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: boldtext(Colors.black, 14, "Yes")),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

showLoadingDialog() {
  Get.dialog(
    Center(
      child: Container(
        child:  Center(
          child: SizedBox(
            child: GradientProgressIndicator(
              radius: 50,
              duration: 30,
              strokeWidth: 3,
              gradientStops: const [
                0.8,
                0.8,
              ],
              gradientColors:  [
                AppColors.primaryColor,
                Colors.grey,
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(images.logo,height: 50,)
                ],
              ),
            )
          ),
        ),
      ),
    ),
    // barrierDismissible: false,
  );
}

hideLoadingDialog() {
  Get.back();
}
