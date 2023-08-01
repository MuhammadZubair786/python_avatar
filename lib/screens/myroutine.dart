import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/screens/NewDietPlan.dart';
import 'package:chatbot_app/screens/user/GetRoutine.dart';
import 'package:chatbot_app/screens/user/userDiets.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyRoutineScreen extends StatefulWidget {
  const MyRoutineScreen({Key? key}) : super(key: key);

  @override
  State<MyRoutineScreen> createState() => _MyRoutineScreenState();
}

class _MyRoutineScreenState extends State<MyRoutineScreen> {
  final bt = Get.put(GlobalController());

 List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  @override
  void initState() {
    getDiest();
    getRoutine();
    WidgetsBinding.instance.addPostFrameCallback((context) async {
      await getDiest();
      await getRoutine();
    });

    // getDiest();
    super.initState();
  }

  getDiest() async {
    if (bt.DietData.isEmpty) {
      await ApiService().getDietsApi(context);
    } else {
      null;
    }
  }

  getRoutine() async {
    if (bt.RoutineData.isEmpty) {
      await ApiService().getRoutineApi(context);
    } else {
      null;
    }
  }

  var _iconColor = Color(0xff333333);
  var _iconColor1 = Color(0xff333333);
  var _iconColor2 = Color(0xff333333);
  double _height = 1;
  double _height1 = 1;
  double _height2 = 1;
  var _selectedButton = 1;
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
          getDiest();
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(child: GetBuilder<GlobalController>(
            builder: (controller) {
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
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 315.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                buttonPadding: EdgeInsets.all(0),
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.all(0)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _selectedButton = 1;
                                          _iconColor = bprimary;
                                          _iconColor1 = Colors.grey;
                                          _iconColor2 = Colors.grey;
                                          _height =
                                              _selectedButton == 1 ? 5 : 1;
                                          _height1 =
                                              _selectedButton == 2 ? 1 : 1;
                                          _height2 =
                                              _selectedButton == 3 ? 1 : 1;
                                        });
                                      },
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Today',
                                              style:
                                                  TextStyle(color: _iconColor),
                                            ),
                                            SizedBox(height: 10.h),
                                            Container(
                                              width: 78,
                                              height: _height,
                                              color: _iconColor,
                                            )
                                          ])),
                                  TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.all(0)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _selectedButton = 2;
                                          _iconColor = Colors.grey;
                                          _iconColor1 = bprimary;
                                          _iconColor2 = Colors.grey;
                                          _height =
                                              _selectedButton == 1 ? 1 : 1;
                                          _height1 =
                                              _selectedButton == 2 ? 5 : 1;
                                          _height2 =
                                              _selectedButton == 3 ? 1 : 1;
                                        });
                                      },
                                      child: Column(children: [
                                        Text(
                                          'Week',
                                          style: TextStyle(color: _iconColor1),
                                        ),
                                        SizedBox(height: 10.h),
                                        Container(
                                          width: 78,
                                          height: _height1,
                                          color: _iconColor1,
                                        )
                                      ])),
                                  TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.all(0)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _selectedButton = 3;
                                          _iconColor = Colors.grey;
                                          _iconColor1 = Colors.grey;
                                          _iconColor2 = bprimary;
                                          _height =
                                              _selectedButton == 1 ? 1 : 1;
                                          _height1 =
                                              _selectedButton == 2 ? 1 : 1;
                                          _height2 =
                                              _selectedButton == 3 ? 5 : 1;
                                        });
                                      },
                                      child: Column(children: [
                                        Text(
                                          'Month',
                                          style: TextStyle(color: _iconColor2),
                                        ),
                                        SizedBox(height: 10.h),
                                        Container(
                                          width: 78,
                                          height: _height2,
                                          color: _iconColor2,
                                        )
                                      ]))
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: 190.w,
                          // height: 190.h,

                          child: CircularPercentIndicator(
                            startAngle: 90.0,
                            animationDuration: 3000,
                            animation: true,
                            arcBackgroundColor: Colors.grey,
                            arcType: ArcType.HALF,
                            radius: 60.0,
                            lineWidth: 5.0,
                            percent: 0.5,
                            center: Column(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 20.h),
                                CircularPercentIndicator(
                                  animationDuration: 3000,
                                  startAngle: 90.0,
                                  curve: Curves.easeInOut,
                                  animation: true,
                                  arcBackgroundColor: Colors.grey,
                                  arcType: ArcType.HALF,
                                  radius: 40.0,
                                  lineWidth: 1.0,
                                  percent: 0.5,
                                  center: Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      gradient: kprimary,
                                      border: Border.all(
                                          color: Colors.grey, width: 1.w),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.0),
                                          spreadRadius: 6,
                                          blurRadius: 30,
                                          offset: Offset(0,
                                              6), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "50%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp),
                                        ),
                                        Text(
                                          "Today",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  progressColor: bprimary,
                                ),
                              ],
                            ),
                            progressColor: bprimary,
                          ),
                        ),
                        // how yto check
                        Text(
                          'Kcal:80',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        SizedBox(height: 36.h),
                        controller.DietData.isEmpty
                            ? Container()
                            :
                            controller.DietData.length>0 ?
                             Column(
                                children: List.generate(
                                    controller.DietData.length, (index) {
                                //print(controller.DietData.length);
                                 var item = controller.DietData[index];
                                 //print(item["startDate"]);

                                var year = item[0]["startDate"].toString().substring(0,4);
                                var month = item[0]["startDate"].toString().substring(5,7);
                                var date = item[0]["startDate"].toString().substring(8,10);
                                  DateTime givenDate = DateTime(int.parse(year), int.parse(month), int.parse(date));
                                    
                                    int dayIndex = givenDate.weekday - 1; // Adjusting the index to match the daysOfWeek list
                                    String dayOfWeek = daysOfWeek[dayIndex];

                                    //print(dayOfWeek);

                                return Dismissible(
                                  key: Key(''),
                                  background: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          Text('Delete Diet',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          Text('Delete Diet',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) {
                                    print(controller.DietData[index][0]["_id"]);
                                    ApiService().deleteDietsApi(context,controller.DietData[index][0]["_id"]);
                                    controller.deleteDiet(index);
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => LastExampleScreen());
                                    },
                                    child: Container(
                                      width: 378.w,
                                      height: 87.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xffD2D2D2)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Diet Plan",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                  dayOfWeek,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    // Text(
                                                    //   "July 25, 2022",
                                                    //   style: TextStyle(color: Colors.black),
                                                    // ),
                                                    Text(
                                                    controller.DietData[index][0]["startDate"].toString().substring(0,10),
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      TimeConverter.convertTo12HourFormat(item[0]["createdAt"].toString().substring(11,16)),
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12),
                                                  child: Container(
                                                    height: 16.h,
                                                    width: 16.w,
                                                    // child: Image.asset(
                                                    //   "",
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })):Container(),
                        SizedBox(height: 20.h),
                        controller.RoutineData.isEmpty
                            ? Container()
                            : Column(
                                children: List.generate(
                                   controller.RoutineData.length, (index) {
                                //print( controller.RoutineData.length);
                                var item = controller.RoutineData[index];
                                var year = item[0]["startDate"].toString().substring(0,4);
                                var month = item[0]["startDate"].toString().substring(5,7);
                                var date = item[0]["startDate"].toString().substring(8,10);
                                  DateTime givenDate = DateTime(int.parse(year), int.parse(month), int.parse(date));
                                    
                                    int dayIndex = givenDate.weekday - 1; // Adjusting the index to match the daysOfWeek list
                                    String dayOfWeek = daysOfWeek[dayIndex];

                                    // //print(dayOfWeek);
  
                                //print(year);
                                //print(month);
                                return Dismissible(
                                  key: Key(''),
                                  background: Container(
                                    // color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          Text('Delete Routine',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                          Text('Delete Routine',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) {
                                    ApiService().deleteRoutineApi(context,controller.RoutineData[index][0]["_id"]);
                                    controller.deletRoutine(index);
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => GetRoutineScreen(
                                            count: item[0]["routineEntries"]
                                                .length,
                                            ListEntry: item[0]
                                                ["routineEntries"],
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
                                        border: Border.all(
                                            color: Color(0xffD2D2D2)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Routine Plan",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                  dayOfWeek.toString(),
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      item[0]["startDate"],
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      item[0]["startTime"],
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12),
                                                  child: Container(
                                                    height: 16.h,
                                                    width: 16.w,
                                                    // child: Image.asset(
                                                    //   "",
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),

                        SizedBox(height: 10.h),

                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/NutritionalTrackingScreen');
                          },
                          child: routinebox('Nutrional Tracking'),
                        ),
                        SizedBox(height: 20.h),
                        controller.DietData.isNotEmpty
                            ? Transform.scale(
                              scale: 0.91,
                              child: GestureDetector(
                                  onTap: null,
                                  // i have custom comtainer now i want to slid right the container to delete the item
                                  child: Container(
                                    
                                    width: 356.w,
                                    height: 56.h,
                                    decoration: BoxDecoration(
                                      
                                      color: Color.fromARGB(255, 244, 244, 241),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        " Diet Plan Already Created",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 129, 20, 20), fontSize: 20.sp),
                                      ),
                                    ),
                                  ),
                                ),
                            )
                            : GestureDetector(
                                onTap: () {
                                  // Get.toNamed("/NewDietPlanScreen");

                                  if (bt.DietData.isNotEmpty) {
                                    Get.snackbar("Diet Already Created", "");
                                  } else {
                                    Get.to(() => NewDietPlanScreen());
                                  }
                                },
                                // i have custom comtainer now i want to slid right the container to delete the item
                                child: Container(
                                  width: 356.w,
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    gradient: kprimary,
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Create New Diet Plan",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ),
                                ),
                              ),
                        10.verticalSpace,
                        controller.RoutineData.isNotEmpty
                            ? Transform.scale(
                              scale: 0.91,
                              child: GestureDetector(
                                  onTap: null,
                                  // i have custom comtainer now i want to slid right the container to delete the item
                                  child: Container(
                                    
                                    width: 356.w,
                                    height: 56.h,
                                    decoration: BoxDecoration(
                                      
                                      color: Color.fromARGB(255, 244, 244, 241),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Routine Plan Already Created ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 129, 20, 20), fontSize: 20.sp),
                                      ),
                                    ),
                                  ),
                                ),
                            )
                            :    GestureDetector(
                          onTap: () {
                            Get.toNamed("/Routine17Screen");
                          },
                          child: Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              gradient: kprimary,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text(
                                "Create New Routine",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/Routine19Screen");
                          },
                          child: Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              gradient: kprimary,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text(
                                "Create Nutritional Tracking",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 140.h),
                      ],
                    );
            },
          )),
        ),
      ),
    );
  }

  routinebox(txt) {
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
            Text(
              txt,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Day 1",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            //     ),
            //     Text(
            //       "Meal 1",
            //       style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            //     ),
            //   ],
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Monday",
                      style: TextStyle(color: Colors.black),
                    ),
                    // Text(
                    //   "July 25, 2022",
                    //   style: TextStyle(color: Colors.black),
                    // ),
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
                    // child: Image.asset(
                    //   "",
                    // ),
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
class TimeConverter {
  static String convertTo12HourFormat(String time24) {
    final format = DateFormat('H:mm');
    final time24Obj = format.parse(time24);
    final format12 = DateFormat('h:mm a');
    final time12 = format12.format(time24Obj);
    return time12;
  }
}
