import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/LoadingLayout.dart';
import 'package:visatree/controller/loginController.dart';
import 'package:visatree/screens/Widgets/button.dart';
import 'package:visatree/screens/signup.dart';
import 'package:visatree/util/images.dart';

import 'Widgets/defaulttxt.dart';
import 'appcontants.dart';
import 'changepassword.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var controller = Get.put(LoginController());
  // final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: GetX<LoginController>(builder: (login) {
        return login.isLoading == true
            ? const Center(
                child: Center(
                child: LoadingLayout(),
              ))
            : Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // color: Color.fromARGB(255, 5, 88, 113),
                child: SingleChildScrollView(
                  child: Form(
                    // key: _formKey,
                    child: Column(
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
                                  // begin: Alignment(1.00, 0.00),
                                  // end: Alignment(-1, 0),
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
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        // height: 42.11,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'Sign In',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(const SignupScreen(),
                                            transition:
                                                Transition.noTransition);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height: 42.11,
                                        decoration: ShapeDecoration(
                                          // color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.white,
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
                            height: 20,
                          ),
                          defaultText("Email"),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Email';
                              } else {
                                if (RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(emailcontroller.text)) {
                                  return null;
                                } else
                                  return "Enter valid Email";
                              }
                            },
                            // cursorColor: AppColors.secondaryColor,
                            obscureText: false,
                            decoration: buildInputDecoration(
                              "Your Email",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          defaultText("Password"),
                          TextFormField(
                            obscureText: passwordVisible,
                            controller: passwordcontroller,
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
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(const ForgetPasswordScreen());
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              child: Button("Continue"),
                              onTap: () async {
                                bool emailaddress = RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z].")
                                    .hasMatch(emailcontroller.text);
                                if (emailcontroller.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Please enter your email!'),
                                    // duration: Duration(seconds: 2),
                                  ));
                                } else if (emailaddress == false) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Please Enter Valid Email "),
                                    duration: Duration(seconds: 2),
                                  ));
                                } else if (passwordcontroller.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text('Please enter your Password!'),
                                    // duration: Duration(seconds: 2),
                                  ));
                                } else {
                                  controller.login(emailcontroller.text,
                                      passwordcontroller.text, context);

                                  // checklogin(emailcontroller.text,passwordcontroller.text);
                                }
                              }),
                          // orcontinue()
                        ]),
                  ),
                ),
              );
      })),
    );
  }
}

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.311,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            images.logo, fit: BoxFit.fill,
            width: 300,
            // height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Welcome ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              // fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.72,
            ),
          ),
          Text(
            'Please enter your details',
            style: TextStyle(
              color: Colors.black.withOpacity(0.4000000059604645),
              fontSize: 16,
              // fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.32,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
