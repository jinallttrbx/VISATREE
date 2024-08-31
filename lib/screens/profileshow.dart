import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/ApiUrl.dart';
import 'package:visatree/LoadingLayout.dart';
import 'package:visatree/controller/ProfileController.dart';
import 'package:visatree/screens/appcontants.dart';

class Profiledata extends StatefulWidget {
  const Profiledata({super.key});

  @override
  State<Profiledata> createState() => _ProfiledataState();
}

class _ProfiledataState extends State<Profiledata> {
  ProfileController eventController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    eventController.profileData;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(builder: (profilecontroller) {
      return profilecontroller.isLoading.value == true
          ? const Center(
              child: Center(
              child: LoadingLayout(),
            ))
          : Container(
              padding: const EdgeInsets.only(left: 20, right: 50, top: 20),
              child: Row(
                children: [
                  profilecontroller.profileData?.student.studentProfile == null
                      ? Expanded(flex: 2,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppColors.primaryColor.withOpacity(0.5),AppColors.primaryColor2.withOpacity(0.5)],),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                              child: Text(
                                profilecontroller
                                    .profileData
                                    ?.student
                                    .firstname[0].capitalizeFirst ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 70,
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.w900),
                              ),
                            ),
                          )
                        )
                      ))
                      : Expanded(flex: 2,
                    child: SizedBox(
                    width: 100,
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        "${ApiUrl.BASEURL}admin/images/student_profile/${profilecontroller.profileData!.student.studentProfile}",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                      child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          profilecontroller.profileData?.student.lastname == null
                              ? const SizedBox.shrink()
                              : Text(
                            "${profilecontroller.profileData!.student.firstname[0].toUpperCase() + profilecontroller.profileData!.student.firstname.substring(1)} ${profilecontroller.profileData!.student.lastname[0].toUpperCase() + profilecontroller.profileData!.student.lastname.substring(1)}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )),
                      )
                ],
              ),
            );
    });
  }
}
