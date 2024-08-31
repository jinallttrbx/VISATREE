import 'package:flutter/material.dart';

Widget boldtext(Color tcolor, double tsize, String text, {bool? center,}) {
  return Text(
    text,
   // textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(
        color: tcolor,
        fontSize: tsize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins'),
  );
}

Widget regulartext(Color tcolor, double tsize, String text, {bool? center}) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(
        color: tcolor,
        fontSize: tsize,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.normal),
  );
}

Widget mediumtext(Color tcolor, double tsize, String text, {bool? center}) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(
        color: tcolor,
        fontSize: tsize,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500),
  );
}

Widget lighttext(Color tcolor, double tsize, String text, {bool? center}) {
  return Text(
    text,
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
    style: TextStyle(color: tcolor, fontSize: tsize, fontFamily: 'Poppins'),
  );
}

Widget titletext(Color tcolor, double tsize, String text, {bool? center,}) {
  return  RichText(
    text: TextSpan(
        text: '$text',
        style: TextStyle(
            color: tcolor, fontFamily: 'Poppins', fontSize: tsize),
        children: [
          TextSpan(
              text: ' *',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: tsize))
        ]),
    textAlign: (center == true) ? TextAlign.center : TextAlign.left,
  );
}
