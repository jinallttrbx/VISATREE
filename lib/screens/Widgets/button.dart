import 'package:flutter/material.dart';
import 'package:visatree/screens/appcontants.dart';

Padding Button(String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 60),
    child: Container(
      alignment: Alignment.center,
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor2,
            AppColors.primaryColor,
          ])),
      child: Text(
        txt,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          // fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
