import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/Widgets/const_text.dart';

import 'package:visatree/controller/forgotpasswordController.dart';
import 'package:visatree/screens/authentication/changepassword.dart';

import 'package:visatree/util/appcontants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();
  var controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Forgot",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Password?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Don't worry! It happens. Please enter the address associated with your account.",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              // customTFF("Email", false),

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
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  bool emailaddress =
                      RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(email.text);

                  if (email.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Enter Email "),
                      duration: Duration(seconds: 2),
                    ));
                  } else if (emailaddress == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Enter Valid Email "),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    controller.forgotpassword(email.text, context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  height: 50,
                  // width: 200,
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18, color: AppColors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
