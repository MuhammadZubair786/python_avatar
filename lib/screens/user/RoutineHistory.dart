// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/global_controller.dart';
import 'package:chatbot_app/screens/user/GetRoutine.dart';

import '../../trainer/trainerhistory.dart';

class RoutineHistory extends StatefulWidget {
  const RoutineHistory({super.key});

  @override
  State<RoutineHistory> createState() => _RoutineHistoryState();
}

class _RoutineHistoryState extends State<RoutineHistory> {
  final bt = Get.put(GlobalController());

  void initState() {
    super.initState();
    getRoutineHistory();
    WidgetsBinding.instance.addPostFrameCallback((context) async {
      await getRoutineHistory();
    });
  }

  getRoutineHistory() async {
    if (bt.AllRoutine.isEmpty) {
      await ApiService().getAllRoutineHistory(context);
    } else {
      print(bt.AllRoutine.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        displacement: 250,
        backgroundColor: Color(0xffFDAA4A),
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1500));
          setState(() {
            getRoutineHistory();
          });
        },
        child: Container(
            width: 378.w,
            height: 762.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.white,
              border: Border.all(color: Color(0xffD2D2D2)),
            ),
            child: GetBuilder<GlobalController>(builder: (controller) {
              return controller.isLoding
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/Slicing/output-onlinegiftools.gif",
                            height: 125.0,
                            color: Colors.orange,
                            width: 125.0,
                          ),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 23,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${bt.AllRoutine[0].length} WorkOut",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 12.w,
                                      height: 14.h,
                                      child: Image.asset(
                                          "assets/Slicing/Android/4x/Icon metro-fire.png"),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "855 Kcal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Container(
                                    //   width: 12.w,
                                    //   height: 14.h,
                                    //   child: Image.asset(
                                    //       "assets/Slicing/Android/4x/Icon metro-home.png"),
                                    // ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    // Text(
                                    //   "2h 13min",
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.normal,
                                    //       fontSize: 14),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: bt.AllRoutine[0].length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Day1(index, bt.AllRoutine[0][index]),
                                    margin: EdgeInsets.all(10),
                                  );
                                })
                          
                          ],
                        ),
                      ),
                    );
            })));
  }

  Day1(ind, listdata) {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    var year = listdata["startDate"].toString().substring(0, 4);
    var month = listdata["startDate"].toString().substring(5, 7);
    var date = listdata["startDate"].toString().substring(8, 10);
    DateTime givenDate =
        DateTime(int.parse(year), int.parse(month), int.parse(date));

    int dayIndex = givenDate.weekday -
        1; // Adjusting the index to match the daysOfWeek list
    String dayOfWeek = daysOfWeek[dayIndex];
    // print(listdata);
    return GestureDetector(
      onTap: () {
        Get.to(() => GetRoutineScreen(
              count: listdata["routineEntries"].length,
              ListEntry: listdata["routineEntries"],
            ));
      },
      child: Container(
        width: 378.w,
        height: 87.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
          border: Border.all(color: Color(0xffD2D2D2)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Routine ${ind + 1}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayOfWeek,
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                      Text(
                        listdata["startDate"],
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        listdata["endDate"],
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      height: 16.h,
                      width: 16.w,
                      child: Image.asset(
                        "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Day2() {
    return Container(
      width: 378.w,
      height: 87.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        border: Border.all(color: Color(0xffD2D2D2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jan 01 - Jan 30",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
                Text(
                  "John Smith",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
                Text(
                  "Monthly Routine Plan",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Monday",
                      style: TextStyle(color: Color(0xFF000000)),
                    ),
                    Text(
                      "July 25, 2022",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "data",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    height: 16.h,
                    width: 16.w,
                    child: Image.asset(
                      "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
