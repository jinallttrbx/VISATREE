import 'package:flutter/material.dart';

class customTFF extends StatelessWidget {
  // final IconData icn;
  final String hint;
  bool obsc = false;

   TextEditingController hintcontroller;

  customTFF(this.hint, this.obsc,this.hintcontroller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 51,
      child: TextFormField(


        keyboardType: hint=="Age"||hint=="Referral Code" || hint =="Phone"?TextInputType.number: hint=="Email"?TextInputType.emailAddress:TextInputType.text,
         controller: hintcontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter $hint';
          }
          return null;
        },
        // cursorColor: AppColors.secondaryColor,
        obscureText: obsc,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "$hint",
        ),
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
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
    );
  }
}
