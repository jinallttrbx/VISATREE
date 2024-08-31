import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visatree/LoadingLayout.dart';
import 'package:visatree/controller/eventController.dart';
import 'package:visatree/screens/appcontants.dart';
import 'package:visatree/util/images.dart';

import 'Widgets/signle_event_detail.dart';

class EventList extends StatefulWidget {
  EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  EventController eventController = Get.find<EventController>();

  @override
  void initState() {
    super.initState();
    eventController.EventList;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<EventController>(builder: (eventcontroller) {
      return eventcontroller.isLoading.value == true
          ? const Center(
              child: Center(
              child: LoadingLayout(),
            ))
          : eventController.EventList.isEmpty?Container(
        height: MediaQuery.of(context).size.height/3,
        child: Center(
          child: Text("No Upcoming Events "),
        ),
      ):ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: eventController.EventList.length,
              itemBuilder: (context, index) {
                var inputFormat = DateFormat('dd/MM/yyyy ')
                    .format(eventcontroller.EventList[index].date);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SingleEventDetailPage(
                          data: eventcontroller.EventList[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            images.crad, height: 100, width: 100,
                            // height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              eventcontroller.EventList[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.28,
                              ),
                            ),
                            const Divider(
                              color: AppColors.primaryColor,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  size: 15,
                                  color: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  inputFormat,
                                  style: const TextStyle(
                                    color: Color(0xFF27AC2C),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.24,
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
                                  Icons.watch_later_outlined,
                                  size: 15,
                                  color: AppColors.primaryColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  eventcontroller.EventList[index].time,
                                  style: const TextStyle(
                                    color: Color(0xFF27AC2C),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              });
    });
  }
}
