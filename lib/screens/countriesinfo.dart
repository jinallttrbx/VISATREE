import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visatree/const_text.dart';
import 'package:visatree/controller/homeController.dart';
import 'package:visatree/screens/appcontants.dart';

import 'homeScrenn/homeUni.dart';

class CountriesInfo extends StatefulWidget {
  const CountriesInfo({super.key});

  @override
  State<CountriesInfo> createState() => _CountriesInfoState();
}

class _CountriesInfoState extends State<CountriesInfo> {
  allExtraexpemcesController countrycontroller = Get.find<allExtraexpemcesController>();
  @override
  void initState() {
    super.initState();
    countrycontroller.getCountry();
    countrycontroller.courseList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              boldtext(Colors.white, 18, "Countries"),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        body: RefreshIndicator(
            color: AppColors.primaryColor,
          onRefresh: ()async{
          await  countrycontroller.getCountry();
          // await  countrycontroller.courseList;
          },
          child:   GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: countrycontroller.CountryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(HomeUniversityList(
                    isDashBoard: false,
                    countryId: countrycontroller.CountryList[index].id.toString(),
                  ));
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(
                                "${countrycontroller.CountryList[index].image}/${countrycontroller.CountryList[index].flag}"),
                            fit: BoxFit.cover,
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(3, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      countrycontroller.CountryList[index].country,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              );
            },
          )
          )

      ),
    );
  }
}
