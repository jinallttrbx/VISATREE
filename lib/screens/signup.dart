import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/controller/registerController.dart';
import 'package:visatree/screens/Widgets/button.dart';
import 'package:visatree/screens/Widgets/defaulttxt.dart';
import 'package:visatree/screens/loginscreen.dart';

import 'changepassword.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  var controller = Get.put(RegisterController());
  bool passwordVisible = false;
  bool confirmpasswordVisible = false;

  // TextEditingController phone = TextEditingController();
  // TextEditingController email = TextEditingController();
  bool val = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeContainer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      // width: 313.91,
                      height: 49,
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color(0xFF43749E),
                            Color(0xFF43749E),
                            Color(0xFF438581),
                            Color(0xFF27AC2C)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const LoginScreen(),
                                    transition: Transition.noTransition);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 42.11,
                                decoration: ShapeDecoration(
                                  // color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.35,
                                height: MediaQuery.of(context).size.height,
                                // height: 42.11,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultText("First Name"),
                  // customTFF("Your First Name", false),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text,
                    controller: fname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your First Name';
                      }
                      return null;
                    },
                    // cursorColor: AppColors.secondaryColor,
                    obscureText: false,
                    decoration: buildInputDecoration(
                      "Your First Name",
                    ),
                  ),
                  defaultText("Last Name"),
                  // customTFF("Your Last Name", false),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.text,
                    controller: lname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Last Name';
                      }
                      return null;
                    },
                    // cursorColor: AppColors.secondaryColor,
                    obscureText: false,
                    decoration: buildInputDecoration(
                      "Your Last Name",
                    ),
                  ),

                  defaultText("Email"),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else {
                        if (RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(email.text)) {
                          return null;
                        } else {
                          return "Enter valid Email";
                        }
                      }
                    },
                    // cursorColor: AppColors.secondaryColor,
                    obscureText: false,
                    decoration: buildInputDecoration(
                      "Your Email",
                    ),
                  ),
                  defaultText("Password"),
                  TextFormField(
                      obscureText: passwordVisible,
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Password",
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
                          borderSide:
                          const BorderSide(color: Colors.green, width: 1.5),
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
                  // customTFF("Your Confirm Password", true),
                  TextFormField(
                      obscureText: confirmpasswordVisible,
                      controller: confirmpassword,
                      validator: (value) {
                        if (value == password.text) {
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
                          borderSide:
                          const BorderSide(color: Colors.green, width: 1.5),
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
                            password.text == confirmpassword.text;
                        bool emailaddress = RegExp( r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email.text);
                        if (fname.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Enter First Name"),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (lname.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Enter Last Name"),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (email.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Enter Email "),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (emailaddress == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Enter Valid Email "),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (password.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Please Enter Password  "),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (password.text.length < 8) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                "Password Length Must Have At Least 8 Character !! "),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (confirmpassword.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(" Please Enter Confirm Password "),
                            duration: Duration(seconds: 2),
                          ));
                        } else if (matchpassword == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                "Password and Confirm password Not Match "),
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          controller.register(
                              fname.text,
                              lname.text,
                              email.text,
                              password.text,
                              confirmpassword.text,
                              context);
                        }
                      },
                      child: Button("Sign Up")),
                  // orcontinue(),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
