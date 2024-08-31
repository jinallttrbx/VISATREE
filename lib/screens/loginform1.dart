import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/screens/loginscreen.dart';
import 'package:visatree/screens/signup.dart';
import 'package:visatree/util/images.dart';

class LoginForm1 extends StatelessWidget {
  const LoginForm1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            Image.asset(
              images.appicon,
              height: 250,
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Get.to(LoginScreen());
              },
              child: loginFormContainer(
                bgcolor: AppColors.primaryColor,
                titlename: "Continue with E-Mail",
                img: images.uni3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            loginFormContainer(
                bgcolor: Colors.black,
                titlename: "Continue with Apple",
                img: images.apple),
            SizedBox(
              height: 20,
            ),
            loginFormContainer(
                bgcolor: AppColors.primaryColor2,
                titlename: "Continue with Google",
                img: images.google),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF43749E),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class loginFormContainer extends StatelessWidget {
  loginFormContainer(
      {super.key,
      required this.bgcolor,
      required this.img,
      required this.titlename});
  Color bgcolor;
  String img;
  String titlename;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: ShapeDecoration(
        color: bgcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 20,
          ),
          Text(
            "  $titlename",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// Container loginFormContainer(bgcolor, Title, img) {
//   return Container(
//     width: 353,
//     height: 62,
//     decoration: ShapeDecoration(
//       color: bgcolor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30),
//       ),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           img,
//           height: 20,
//         ),
//         Text(
//           Title,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     ),
//   );
// }
