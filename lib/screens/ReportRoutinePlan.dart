import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/controllers/global_controller.dart';
import 'package:chatbot_app/screens/user/Day1Routine.dart';
import 'package:chatbot_app/screens/user/GetRoutine.dart';

import '../constants/accordion.dart';
import '../constants/colors.dart';

class ReportRoutinePlanScreen extends StatefulWidget {
  const ReportRoutinePlanScreen({super.key});

  @override
  State<ReportRoutinePlanScreen> createState() =>
      _ReportRoutinePlanScreenState();
}

var _iconColor = Color(0xff333333);
var _iconColor1 = Color(0xff333333);
var _iconColor2 = Color(0xff333333);
double _height = 1;
double _height1 = 1;
double _height2 = 1;
var _selectedButton = 1;
List items = [
  {'item': 'Chicken', 'Quatity': 4},
  {'item': 'Carrots', 'Quatity': 7},
  {'item': 'Rice Bowl', 'Quatity': 3},
  {'item': 'Burned Kcal', 'Quatity': 37},
  {'item': 'Chicken', 'Quatity': 4},
  {'item': 'Carrots', 'Quatity': 7},
  {'item': 'Rice Bowl', 'Quatity': 3},
  {'item': 'Burned Kcal', 'Quatity': 37},
  {'item': 'Chicken', 'Quatity': 4},
  {'item': 'Carrots', 'Quatity': 7},
  {'item': 'Rice Bowl', 'Quatity': 3},
  {'item': 'Burned Kcal', 'Quatity': 37},
];
List weeklyList = [
  Accordion(title: 'Day 1', content: items),
  Accordion(title: 'Day 2', content: items),
  Accordion(title: 'Day 3', content: items),
  Accordion(title: 'Day 4', content: items),
  Accordion(title: 'Day 1', content: items),
  Accordion(title: 'Day 2', content: items),
  Accordion(title: 'Day 3', content: items),
  Accordion(title: 'Day 4', content: items),
  Accordion(title: 'Day 1', content: items),
  Accordion(title: 'Day 2', content: items),
  Accordion(title: 'Week 3', content: items),
  Accordion(title: 'Week 4', content: items),
];
List monthlyList = [
  Accordion(title: 'Month January 2022 ', content: items),
  Accordion(title: 'Month February 2022', content: items),
  Accordion(title: 'Month March 2022', content: items),
  Accordion(title: 'Month April 2022', content: items),
  Accordion(title: 'Month May 2022', content: items),
  Accordion(title: 'Month June 2022', content: items),
  Accordion(title: 'Month July 2022', content: items),
];
List yearlyList = [
  Accordion(title: '2022 ', content: items),
  Accordion(title: '2021', content: items),
  Accordion(title: '2020', content: items),
  Accordion(title: '2019', content: items),
];

class _ReportRoutinePlanScreenState extends State<ReportRoutinePlanScreen> {
  final bt = Get.put(GlobalController());

  @override
  void initState() {
    getRoutinePlane();
    WidgetsBinding.instance.addPostFrameCallback((context) async {
      await getRoutinePlane();
    });
    // getDiest();
    super.initState();
  }

  getRoutinePlane() async {
    //print(bt.RoutineData);
    if (bt.RoutineData1.isEmpty) {
      await ApiService().getRoutineApi1(context);
    } else {
      null;
    }
  }

  var _selectedButton = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: Get.height * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Reports Routine",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.start,
                buttonPadding: EdgeInsets.all(0),
                children: [
                  TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0)),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedButton = 1;
                          _iconColor = bprimary;
                          _iconColor1 = Colors.grey;
                          _iconColor2 = Colors.grey;
                          _height = _selectedButton == 1 ? 5 : 1;
                          _height1 = _selectedButton == 2 ? 1 : 1;
                          _height2 = _selectedButton == 3 ? 1 : 1;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            'Diet ',
                            style: TextStyle(color: _iconColor),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: Get.width * 0.3,
                            height: _selectedButton == 1 ? 5 : _height,
                            color: _selectedButton == 1 ? bprimary : _iconColor,
                          )
                        ]),
                      )),
                  TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0)),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedButton = 2;
                          _iconColor = Colors.grey;
                          _iconColor1 = bprimary;
                          _iconColor2 = Colors.grey;
                          _height = _selectedButton == 1 ? 1 : 1;
                          _height1 = _selectedButton == 2 ? 5 : 1;
                          _height2 = _selectedButton == 3 ? 1 : 1;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        child: Column(children: [
                          Text(
                            'Routine',
                            style: TextStyle(color: _iconColor1),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: Get.width * 0.3,
                            height: _height1,
                            color: _iconColor1,
                          )
                        ]),
                      )),
                  TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(0)),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedButton = 3;
                          _iconColor = Colors.grey;
                          _iconColor1 = Colors.grey;
                          _iconColor2 = bprimary;
                          _height = _selectedButton == 1 ? 1 : 1;
                          _height1 = _selectedButton == 2 ? 1 : 1;
                          _height2 = _selectedButton == 3 ? 5 : 1;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        child: Column(children: [
                          Text(
                            'Nutritional',
                            style: TextStyle(color: _iconColor2),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: Get.width * 0.3,
                            height: _height2,
                            color: _iconColor2,
                          )
                        ]),
                      ))
                ],
              ),
            ],
          ),
          _selectedButton == 1
              ? Container(
                  child: GetBuilder<GlobalController>(builder: (controller) {
                  return controller.isLoding
                      ? Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.all(5),
                            child: CircularProgressIndicator(
                              strokeWidth: 4.0,
                              valueColor: AlwaysStoppedAnimation(bprimary),
                            ),
                          ),
                        )
                      : controller.DietData.length != 0
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.DietData.length,
                              itemBuilder: (context, index) {
                                //print(controller.DietData);
                                //print("length:" +
                                    // controller
                                    //     .RoutineData[0][0]["routineEntries"]
                                    //     .length
                                    //     .toString());
                                return Container(
                                  child: Column(
                                    children: [
                                     Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(18.r),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(10.r),
                                                  ),
                                                  gradient: kprimary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        blurRadius: 10,
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 1))
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Day ${index + 1}",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        //        setState(() {
                                                        //   _showContent = !_showContent;
                                                        // });
                                                      },
                                                      child: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 33.r,
                                                        color: Colors.white,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            20.verticalSpace
                                          ],
                                        ),
                                      ),
                                      20.verticalSpace
                                    ],
                                  ),
                                );
                              })
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "No Report Found",
                                  style: TextStyle(color: bprimary),
                                ),
                              ],
                            );
                }))
              : _selectedButton == 2
                  ? Container(child:
                      GetBuilder<GlobalController>(builder: (controller) {
                      return controller.isLoding
                          ? Center(
                              child: Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.all(5),
                                child: CircularProgressIndicator(
                                  strokeWidth: 4.0,
                                  valueColor: AlwaysStoppedAnimation(bprimary),
                                ),
                              ),
                            )
                          : controller.RoutineData1.length != 0
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .RoutineData1[0][0]["routineEntries"]
                                      .length,
                                  itemBuilder: (context, index) {
                                    //print(controller.RoutineData1[0][0]
                                        // ["routineEntries"][index]);
                                    return GestureDetector(
                                      onTap: () {
                                        //print(controller.RoutineData1[0][0]
                                            //     ["routineEntries"][index]
                                            // ["exercises"]);
                                        Get.to(() => DayRoutineScreen(
                                            totalkcl: controller.RoutineData1[0]
                                                    [0]["routineEntries"][index]
                                                ["totalCal"],
                                            count: index,
                                            ListEntry:
                                                controller.RoutineData1[0][0]
                                                    ["routineEntries"][index]));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(18.r),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(10.r),
                                                  ),
                                                  gradient: kprimary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        blurRadius: 10,
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 1))
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Day ${index + 1}",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        //        setState(() {
                                                        //   _showContent = !_showContent;
                                                        // });
                                                      },
                                                      child: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 33.r,
                                                        color: Colors.white,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            20.verticalSpace
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No Report Found",
                                      style: TextStyle(color: bprimary),
                                    ),
                                  ],
                                );
                    }))
                  : Text("Nutritional Report")
        ],
      ),
    );
  }
}
