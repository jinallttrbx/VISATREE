import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatreenew/Widgets/const_text.dart';

import 'package:visatreenew/controller/changepasswordcontroller.dart';


import 'package:visatreenew/util/appcontants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ChangePasswordController _changePasswordController =
      Get.find<ChangePasswordController>();
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController ncpassword = TextEditingController();
  bool passwordVisible = false;
  bool confirmpasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              boldtext(Colors.white, 18, "Change Password"),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // decoration: ShapeDecoration(
              //   color: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   shadows: [
              //     BoxShadow(
              //       color: Color(0x3F43749E),
              //       blurRadius: 4,
              //       offset: Offset(0, 2),
              //       spreadRadius: 0,
              //     ),
              //     BoxShadow(
              //       color: Color(0x3F43749E),
              //       blurRadius: 4,
              //       offset: Offset(2, 0),
              //       spreadRadius: 0,
              //     ),
              //     BoxShadow(
              //       color: Color(0x3F43749E),
              //       blurRadius: 4,
              //       offset: Offset(2, 0),
              //       spreadRadius: 0,
              //     )
              //   ],
              // ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    defaultText("Old Password"),
                    const SizedBox(
                      height: 5,
                    ),
                    // customTFF("", true),
                    TextFormField(
                      controller: oldpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Old Password';
                        }
                        return null;
                      },
                      // cursorColor: AppColors.secondaryColor,
                      obscureText: false,
                      decoration: buildInputDecoration(
                        "Old Password",
                      ),
                    ),
                    defaultText("New Password"),
                    const SizedBox(
                      height: 5,
                    ),
                    // customTFF("", true),
                    TextFormField(
                        obscureText: confirmpasswordVisible,
                        controller: newpassword,
                        validator: (value) {
                          if (value == newpassword.text) {

                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Confirm Password",
                          isDense: true,
                          suffixIcon: IconButton(
                            icon: Icon(confirmpasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                () {
                                  confirmpasswordVisible =
                                      !confirmpasswordVisible;
                                },
                              );
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.green, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                        )),
                    defaultText("Confirm Password"),
                    const SizedBox(
                      height: 5,
                    ),
                    // customTFF("", true),
                    TextFormField(
                        obscureText: passwordVisible,
                        controller: ncpassword,
                        validator: (value) {
                          if (value == ncpassword.text) {

                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Confirm Password",
                          isDense: true,
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.green, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                        )),

                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          bool matchpassword =
                              newpassword.text == ncpassword.text;
                          if (oldpassword.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Please Enter Old password  "),
                              duration: Duration(seconds: 2),
                            ));
                          } else if (newpassword.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Please Enter new password  "),
                              duration: Duration(seconds: 2),
                            ));
                          } else if (ncpassword.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text("Please Enter new Conform password  "),
                              duration: Duration(seconds: 2),
                            ));
                          } else if (matchpassword == false) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "New Password and Confirm password Not Match "),
                              duration: Duration(seconds: 2),
                            ));
                          } else if (newpassword.text.length < 8) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Password length must have at least 8 character !! "),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            _changePasswordController.Changepassword(
                                oldpassword.text,
                                newpassword.text,
                                ncpassword.text,
                                context);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // gradient: LinearGradient(colors: [
                                //   AppColors.primaryColor2,
                                //   AppColors.primaryColor,
                                // ])
                              color: AppColors.primaryColor,
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                // fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hinttext) {
  return InputDecoration(
    isDense: true,
    hintText: hinttext,
    // prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    ),
  );
}
