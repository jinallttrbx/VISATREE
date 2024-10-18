import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visatree/Widgets/LoadingLayout.dart';
import 'package:visatree/Widgets/snackbar.dart';
import 'package:visatree/controller/ProfileController.dart';
import 'package:visatree/screens/ProfileScreen/editprofile.dart';
import 'package:visatree/screens/ProfileScreen/uploaddocuments.dart';
import 'package:visatree/screens/authentication/loginscreen.dart';
import 'package:visatree/util/ApiUrl.dart';
import 'package:visatree/util/appcontants.dart';
import 'package:visatree/util/images.dart';
import 'package:visatree/util/session%20management.dart';
import 'package:visatree/util/viewImage.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // String studphone="";
  // String studemail="";
  // String studage="";
  // String address="";
  // String studgender="";
  // String studrefralcode="";
  // String studaddress="";
  // String image='';

  // String studprofile="";
  // String firstname="";
  // String lastname="";
  @override
  void initState() {
    super.initState();
    // setdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Scaffold(
            // appBar: AppBar(
            //   titleSpacing: 0,
            //   title: Row(
            //     children: [
            //        boldtext(Colors.white, 18, "Profile")
            //
            //     ],
            //   ),
            //   shape:  RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(10),
            //       bottomRight: Radius.circular(10),
            //     ),
            //   ),
            //   elevation: 0,
            //   backgroundColor: AppColors.primaryColor,
            // ),
              body: GetX<ProfileController>(builder: (profilecontroller) {
        return profilecontroller.isLoading.value == true
            ? const Center(
                child: Center(
                child: LoadingLayout(),
              ))
            : Container(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await Get.to(
                                EditProfile(
                                    profilecontroller.profileData!.student),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Stack(children: [
                                    Container(

                                      decoration:  BoxDecoration(
                                        color: AppColors.primaryColor,
                                          // gradient: LinearGradient(
                                          //   colors: [AppColors.primaryColor.withOpacity(0.5),AppColors.primaryColor2.withOpacity(0.5)],),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      height: 150,
                                      width: 150,
                                      child: profilecontroller.profileData
                                                  ?.student.studentProfile ==
                                              null
                                          ? ClipRRect(
                                        borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(10)),
                                              child: Center(
                                                child: Text(
                                                  profilecontroller
                                                      .profileData
                                                      ?.student
                                                      .firstname[0].capitalizeFirst ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 90,
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              )
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: Image.network(
                                                "${ApiUrl.BASEURL}admin/images/student_profile/${profilecontroller.profileData!.student.studentProfile}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 2,
                                      right: 3,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        //padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
            // gradient: LinearGradient(
            // colors: [AppColors.primaryColor,AppColors.primaryColor2],),
                                          color: AppColors.primaryColor,
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 20,
                                        )),
                                      ),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              profilecontroller
                                          .profileData?.student.firstname.capitalizeFirst ==
                                      null
                                  ? const Text("")
                                  : Text(
                                      "${profilecontroller.profileData!.student.firstname[0].toUpperCase() + profilecontroller.profileData!.student.firstname.substring(1).toLowerCase()} ${profilecontroller.profileData!.student.lastname[0].toUpperCase() + profilecontroller.profileData!.student.lastname.substring(1).toLowerCase()}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              InkWell(
                                onTap: () {
                                  Get.to( UploadDocuments());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Document Upload",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset(images.document,
                                          height: 40, width: 40),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      // ProfileText("Referral Code : ${profile.profileData!.student.referral}  "),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone_android_sharp,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ProfileText(profilecontroller
                                              .profileData?.student.phone ==
                                          null
                                      ? ""
                                      : profilecontroller
                                          .profileData?.student.phone
                                          .toString()),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email_outlined,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ProfileText(profilecontroller.profileData?.student.email==null?"":profilecontroller
                                      .profileData?.student.email),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ProfileText(profilecontroller
                                              .profileData?.student.age ==
                                          null
                                      ? ""
                                      : profilecontroller
                                          .profileData?.student.age
                                          .toString()),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.female,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ProfileText(profilecontroller
                                              .profileData?.student.gender ==
                                          null
                                      ? ""
                                      : profilecontroller
                                          .profileData?.student.gender
                                          .toString()),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  _logout(context);

                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.logout,
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ProfileText("Logout"),
                                  ],
                                ),
                              ),
                              // ProfileText("Address : ${profile.profileData!.student}"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ));
      })),
    );
  }

  void openBottomSheet(String url) {
    var controller = Get.find<ProfileController>();
    File? _image;
    String imgPath = '';
    PickedFile? pickedImage;
    final ImagePicker picker = ImagePicker();
    Get.bottomSheet(
      SizedBox(
        height: Get.height * 0.2,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                if (url ==
                    "${ApiUrl.BASEURL}admin/images/university/Amity_University_banner1700994406.jpg") {
                  Get.to(() => ViewImage(url: url));
                } else {
                  showInSnackBar('Profile Photo not available',
                      color: Colors.red);
                }
              },
              child: const Text(
                "View Image",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Divider(),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () async {
                Get.back();
                try {
                  final data = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  File image = File(data!.path);
                  setState(() {
                    _image = image;
                    imgPath = _image!.path;
                  });
                  // controller.uploadProfile(image.path.toString());
                  print(imgPath);
                } catch (e) {
                  print(e.toString());
                  showInSnackBar('No Image File Selected', color: Colors.red);
                }
              },
              child: const Text(
                "Update Image",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }

  _logout(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            insetPadding: const EdgeInsets.only(left: 10, right: 10),
            iconPadding: EdgeInsets.zero,
            content: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_rounded),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child:   Text(
                        "Are you sure you want to log out?",style: TextStyle( fontSize: 18,fontFamily: "Poppins"
                      ),
                    ),),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () async {
                            final session =
                            SessionManagement();
                            await session
                                .getAllPrefsClear();
                            Navigator.of(context)
                                .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                  const LoginScreen(),
                                ),
                                    (route) => false);
                          },
                          child:
                          Text( "Confirm logout",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: 14),),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text( "Cancel",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: 14),),
                        )
                      ],
                    )
                  ],
                )),
          );
        });
  }
}

Text ProfileText(ptxt) {
  return Text(
    ptxt,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
  );
}
