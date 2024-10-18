import 'package:flutter/material.dart';
import 'package:visatree/Widgets/const_text.dart';

import 'package:visatree/util/appcontants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Row(
              children: [
                boldtext(Colors.white, 18, "About Us"),
              ],
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  "Best Student Visa Consultancy in India",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
                Text(
                    " We are a premier visa consultancy dedicated to turning your dreams of global exploration into reality.Whether you're a student aspiring to study abroad, a professional aiming for international career opportunities, or a family seeking new horizons, were here to navigate the intricate pathways of visas and permits for you.")
              ],
            ),
          )),
    );
  }
}
