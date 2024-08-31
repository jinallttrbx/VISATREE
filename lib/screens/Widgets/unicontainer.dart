import 'package:flutter/material.dart';
import 'package:visatree/screens/appcontants.dart';

Column UniContainer(String Uni_Name, String countryName, String imgname) {
  // String uni_name;
  // int index = 0;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          // height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(97, 179, 175, 175),
              borderRadius: BorderRadius.circular(30)),
          // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                color: AppColors.primaryColor,
                child: Text(
                  Uni_Name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                countryName,
                style: TextStyle(fontSize: 15),
              ),
              Text("University Logo"),
              Image.asset(
                imgname,
                height: 60,
              ),
              Text("List of seats using exams"),
              Text("Description about university"),
              ElevatedButton(onPressed: () {}, child: Text("Apply Now"))
            ],
          ),
        ),
      ),
    ],
  );
}
