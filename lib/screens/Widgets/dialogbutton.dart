import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  DialogButton({super.key, required this.btnName, required this.btncolor});
  Color btncolor;
  String btnName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.3,
      height: 41,
      decoration: ShapeDecoration(
        color: btncolor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: btncolor),
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
        btnName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
// Container DialogButton(btncolor, btnName) {
//   return;
// }
class DialogButton2 extends StatelessWidget {
  DialogButton2({super.key, required this.btnName, required this.btncolor});
  Color btncolor;
  String btnName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.3,
      height: 41,
      decoration: ShapeDecoration(
        color: btncolor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: btncolor),
          borderRadius: BorderRadius.circular(5),
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
        btnName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}