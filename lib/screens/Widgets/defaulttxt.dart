import 'package:flutter/material.dart';

Padding defaultText(deftext) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          deftext,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        // SizedBox(
        //   height: 8,
        // )
      ],
    ),
  );
}
