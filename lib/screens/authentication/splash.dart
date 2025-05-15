import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visatreenew/screens/authentication/loginscreen.dart';
import 'package:visatreenew/screens/homeScrenn/curvedbutton.dart';
import 'package:visatreenew/util/appcontants.dart';

import 'package:visatreenew/util/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // getTime();
    screen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          // gradient: LinearGradient(
          //   begin: Alignment(0.17, -0.98),
          //   end: Alignment(-0.17, 0.98),
          //   colors: [AppColors.primaryColor2, AppColors.primaryColor2, AppColors.primaryColor],
          // ),
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                width: MediaQuery.of(context).size.height * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: Image.asset(
                    images.appicon,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'VisaTree',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                letterSpacing: 0.80,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  screen() async {
    SharedPreferences pres = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2), () {
      if (pres.getBool("login") == null) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const RootWidget());
      }
    });
  }

  // void getTime() async {
  //   Timer(Duration(seconds: 2), () async {
  //     bool islogin = await sp.isLoggedIn();
  //     if (islogin) {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => CurvedBottom(),
  //       ));
  //     } else {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => LoginForm1(),
  //       ));
  //     }
  //   });
  // }
}
