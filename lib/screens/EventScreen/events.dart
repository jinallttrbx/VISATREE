import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visatreenew/Widgets/LoadingLayout.dart';
import 'package:visatreenew/Widgets/const_text.dart';
import 'package:visatreenew/Widgets/signle_event_detail.dart';

import 'package:visatreenew/controller/eventController.dart';

import 'package:visatreenew/util/images.dart';

import 'package:visatreenew/util/appcontants.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventController eventcontroller = Get.find<EventController>();

  // initNotification() {
  //   FirebaseMessaging.onBackgroundMessage(
  //       (message) async => debugPrint(message.notification!.body.toString()));
  // }

  @override
  void initState() {
    super.initState();
    // initNotification();
    eventcontroller.EventList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              boldtext(Colors.white, 18, "Events"),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
        body: RefreshIndicator(
          color: AppColors.primaryColor,
          child: ListView(
            children: [
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: GetX<EventController>(
                    builder: (eventcontroller) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(const EventDetailScreen());
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    'Upcoming Event ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.28,
                                    ),
                                  ),
                                ),
                                eventcontroller.isLoading == true
                                    ? const Center(
                                    child: Center(
                                      child: LoadingLayout(),
                                    ))
                                    : eventcontroller.EventList.isEmpty?Container(
                                  height: MediaQuery.of(context).size.height/2,
                                  child: Center(
                                    child: Text("No Upcoming Events"),
                                  ),
                                ):ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: eventcontroller.EventList.length,
                                    itemBuilder: (context, index) {
                                      var inputFormat = DateFormat('dd/MM/yyyy')
                                          .format(eventcontroller
                                          .EventList[index].date);
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleEventDetailPage(
                                                    data: eventcontroller
                                                        .EventList[index],
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 15, right: 15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                              const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  child: Image.network(
                                                    eventcontroller.EventList[index].eventImage,
                                                    width: 130,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          eventcontroller
                                                              .EventList[index]
                                                              .title,
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontFamily: 'Poppins',
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            letterSpacing: 0.28,
                                                          ),
                                                        ),
                                                        const Divider(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .calendar_month_rounded,
                                                              size: 15,
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              inputFormat,
                                                              style:
                                                              const TextStyle(
                                                                color: AppColors.primaryColor,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                'Poppins',
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                letterSpacing:
                                                                0.24,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .watch_later_outlined,
                                                              size: 15,
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              eventcontroller
                                                                  .EventList[
                                                              index]
                                                                  .time,
                                                              style:
                                                              const TextStyle(
                                                                color:AppColors.primaryColor,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                'Poppins',
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                letterSpacing:
                                                                0.24,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          ));
                    },
                  )),
            ],
          ),onRefresh: ()async {
          eventcontroller.EventList;
        },
        )
      ),
    );
  }
}
