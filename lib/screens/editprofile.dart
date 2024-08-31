import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:visatree/ApiUrl.dart';
import '/const_text.dart';
import '/controller/ProfileController.dart';
import '/model/profilemodel.dart';
import '/screens/Widgets/button.dart';
import '/screens/appcontants.dart';

class EditProfile extends StatefulWidget {
  Student? student;

  EditProfile(this.student);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var profile = Get.find<ProfileController>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  final picker = ImagePicker();
  File? _image;
  String monumber = "";
  String ageno = "";
  String selectedGender = 'male';

  void initState() {
    super.initState();

    setState(() {
      firstname.text = widget.student?.firstname ?? '';
      lastname.text = widget.student?.lastname ?? '';
      email.text = widget.student?.email ?? '';

     // DateTime AGE=DateTime.parse(widget.student?.age);
      age.text =
          widget.student!.age == null ? '' : widget.student!.age;
      selectedGender = widget.student!.gender == null
          ? 'male'
          : widget.student!.gender.toString();
      phone.text =
          widget.student!.phone == null ? '' : widget.student!.phone.toString();
      // _image=widget.student.studentProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            boldtext(Colors.white, 18, "Edit Profile"),
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width, alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(EditProfile(firstname,lastname,studemail,studage,studgender,image));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _modalBottomSheetMenu(context);
                      },
                      child: Stack(
                        children: [
                          _image == null
                              ? Container(
                                  decoration:  BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [AppColors.primaryColor.withOpacity(0.5),AppColors.primaryColor2.withOpacity(0.5)],),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 150,
                                  width: 150,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: profile.profileData!.student
                                                .studentProfile ==
                                            null
                                        ?Center(
                                      child: Text(
                                        profile.profileData!.student
                                            .firstname[0].capitalizeFirst??"",

                                        style: const TextStyle(
                                            fontSize: 90,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                        : Image.network(
                                            "${ApiUrl.BASEURL}admin/images/student_profile/${profile.profileData!.student.studentProfile}",
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 150,
                                  width: 150,
                                  child: ClipRRect(

                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          // _image==null?
                          // Padding(padding: EdgeInsets.only(top: 20),child:  ClipRRect(
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          //   child: Image.network("${ApiUrl.BASEURL}admin/images/student_profile/${profile.profileData!.student.studentProfile}",width: 100,),
                          // )): Padding(padding: EdgeInsets.only(top: 20),child:  ClipRRect(
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          //   child:  Image.file(_image!,width: 100,),
                          // )),

                          Positioned(
                            bottom: 2,
                            right: 3,
                            child: Container(
                              height: 40,
                              width: 40,
                              //padding: EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [AppColors.primaryColor,AppColors.primaryColor2],),),
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Edittxt("Name"),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child: SizedBox(
                      height: 51,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      // alignment: Alignment.center,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: firstname,
                        keyboardType: TextInputType.text,

                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(6.0),),
                          counterText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),

                          hintText: 'Firstname',
                          border: InputBorder.none,

                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Edittxt("Lastname"),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child: SizedBox(
                      height: 51,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      // alignment: Alignment.center,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: lastname,
                        keyboardType: TextInputType.text,

                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(6.0),),
                          counterText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),

                          hintText: 'Lastname',
                          border: InputBorder.none,

                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Edittxt("Email"),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child: SizedBox(
                      height: 51,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      // alignment: Alignment.center,
                      child: TextFormField(
                        readOnly: true,
                        controller: email,
                        keyboardType: TextInputType.text,

                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(6.0),),
                          counterText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),

                          hintText: 'Email',
                          border: InputBorder.none,

                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Edittxt("Mobile Number"),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child: SizedBox(
                      height: 51,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      // alignment: Alignment.center,
                      child: TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        maxLength: 10,

                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(6.0),),
                          counterText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),

                          hintText: 'Mobile Number',
                          border: InputBorder.none,

                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            monumber = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // customTFF("Phone", false,phone),
                  const SizedBox(
                    height: 10,
                  ),
                  Edittxt("Birth Date"),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child: SizedBox(
                      height: 51,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      // alignment: Alignment.center,
                      child: TextFormField(
                        controller: age,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        readOnly: true,
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(6.0),),
                          counterText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),

                          hintText: 'Select Your Birth Date',

                          border: InputBorder.none,

                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.25),
                          ),
                        ),
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1947, 8),
                              lastDate: DateTime.now());
                          if (picked != null && picked != DateTime.now()) {
                            setState(() {
                              age.text =
                                  DateFormat('dd-MM-yyyy').format(picked);
                            });
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            ageno = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Edittxt("Gender"),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          groupValue: selectedGender,
                          value: 'male',
                          title: const Text('Male'),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          groupValue: selectedGender,
                          value: 'female',
                          title: const Text('Female'),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  // Container(
                  //   decoration: ShapeDecoration(
                  //     color: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     shadows: const [
                  //       BoxShadow(
                  //         color: Color(0x3F43749E),
                  //         blurRadius: 4,
                  //         offset: Offset(0, 2),
                  //         spreadRadius: 0,
                  //       ),
                  //       BoxShadow(
                  //         color: Color(0x3F43749E),
                  //         blurRadius: 4,
                  //         offset: Offset(2, 0),
                  //         spreadRadius: 0,
                  //       ),
                  //       BoxShadow(
                  //         color: Color(0x3F43749E),
                  //         blurRadius: 4,
                  //         offset: Offset(2, 0),
                  //         spreadRadius: 0,
                  //       )
                  //     ],
                  //   ),

                  //   child: SizedBox(
                  //     height: 51,
                  //     //padding: EdgeInsets.symmetric(horizontal: 10),
                  //     // alignment: Alignment.center,
                  //     child:
                  //     TextFormField(
                  //       controller: gender,
                  //       keyboardType: TextInputType.text,

                  //       // textAlign: TextAlign.center,
                  //       decoration: InputDecoration(
                  //         filled: true,
                  //         fillColor: Colors.white,
                  //         // focusedBorder: OutlineInputBorder(
                  //         //   borderRadius: BorderRadius.circular(6.0),),
                  //         counterText: '',
                  //         contentPadding: const EdgeInsets.symmetric(
                  //             vertical: 18, horizontal: 10),

                  //         hintText: 'Gender',
                  //         border: InputBorder.none,

                  //         disabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: const BorderSide(
                  //               color: Colors.grey, width: 0.25),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //           borderSide: const BorderSide(
                  //               color: Colors.grey, width: 0.25),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Edittxt("Referral Code"),
                  //  customTFF("Referral Code", true,text5),
                  // Edittxt("Password"),
                  // customTFF("Password", true,text6),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    bool emailaddress =
                        RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(email.text);
                    //Navigator.of(context).pop();
                    if (firstname.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Firstname "),
                        duration: Duration(seconds: 2),
                      ));
                    } else if (lastname.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Lastname "),
                        duration: Duration(seconds: 2),
                      ));
                    } else if (email.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Email "),
                        duration: Duration(seconds: 2),
                      ));
                    } else if (emailaddress == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Valid Email "),
                        duration: Duration(seconds: 2),
                      ));
                    } else if(phone.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Mobile Number "),
                        duration: Duration(seconds: 2),
                      ));
                    }else if(phone.text.length != 10){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Valid Mobile Number"),
                        duration: Duration(seconds: 2),
                      ));
                    }else if(phone.text.length < 10){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Valid Mobile Number"),
                        duration: Duration(seconds: 2),
                      ));
                    }
                    else if (age.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Birth Date"),
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      profile.EditProfile(
                        firstname.text,
                        lastname.text,
                        email.text,
                        phone.text,
                        age.text,
                        selectedGender,
                        _image,
                        // _image == null
                        //     ? "${ApiUrl.BASEURL}admin/images/student_profile/${profile.profileData!.student.studentProfile}"
                        //     : _image!.path.toString(),
                        context,
                      );
                    }
                  },
                  child: Button("Save")),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(
    context,
  ) {
    showModalBottomSheet(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width -
              20, // here increase or decrease in width
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5))),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor2,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.4, 0.7],
                    tileMode: TileMode.repeated,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              height: 100,
              // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            openGallary();
                          },
                          child: const Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.white,
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            openCamera();
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  // void _modalBottomSheetMenu(){
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder){
  //         return new Container(
  //           height: 100,
  //           decoration: new BoxDecoration(
  //               color: Colors.green,
  //               borderRadius: new BorderRadius.only(
  //                   topLeft: const Radius.circular(20.0),
  //                   topRight: const Radius.circular(20.0))),
  //           child: new Container(
  //               decoration: new BoxDecoration(
  //                 color: Colors.green,
  //                   borderRadius: new BorderRadius.only(
  //                       topLeft: const Radius.circular(20.0),
  //                       topRight: const Radius.circular(20.0))),
  //               child: new Center(
  //                 child: new Text("data")
  //               )),
  //         );
  //       }
  //   );
  // }

  Future openGallary() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    Navigator.pop(context);
  }

  void openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    Navigator.pop(context);
  }
}

Padding Edittxt(txt) {
  return Padding(
    padding: const EdgeInsets.only(left: 0),
    child: Text(
      txt,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );
}
