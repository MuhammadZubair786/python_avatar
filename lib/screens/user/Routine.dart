// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/RoutineController.dart';
import 'package:chatbot_app/screens/user/Routine1.dart';

import '../../constants/global.dart';
import 'Day1Routine.dart';

class RoutineScreen extends StatefulWidget {
  var count, day, month, year, tag;
  RoutineScreen(
      {this.count,
      this.day,
      this.month,
      this.year,
      this.tag,
      this.boolList,
      Key? key})
      : super(key: key);

  List<bool>? boolList = [];

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  void initState() {
    super.initState();
    // getRoutine();
    // //print(widget.count);
  }

  RotineController _routineController = Get.put(RotineController());

  saveApiData() {
    var totalkcl = 0;
    for (var i in _routineController.rotinedata) {
      for (var j in i["exercises"]) {
        totalkcl += int.parse(j["kcal"].toString());
      }
    }
    //print(totalkcl);
    // // _routineController.updateTotalKcl(totalkcl);
    // //print(_routineController.mainRoutine);
    // //print(_routineController.rotinedata);

    // print( _routineController.mainRoutine[0]["startDate"]);

    var instructorDietData = {
      "creatorType": "Customer",
      "createdFor": dietRequestUserId.toString(),
      "startDate": _routineController.mainRoutine[0]["startDate"],
      "endDate": _routineController.mainRoutine[0]["endDate"],
      "startTime": _routineController.mainRoutine[0]["startTime"],
      "endTime": _routineController.mainRoutine[0]["endTime"],
      "totalCal": totalkcl,
      "routineEntries": _routineController.rotinedata
    };

// data for user
    var userdieData = {
        "startDate": _routineController.mainRoutine[0]["startDate"],
      "endDate": _routineController.mainRoutine[0]["endDate"],
      "startTime": _routineController.mainRoutine[0]["startTime"],
      "endTime": _routineController.mainRoutine[0]["endTime"],
      "totalCal": totalkcl,
      "routineEntries": _routineController.rotinedata
    };
  

    if (userType == "Instructor") {
      print(instructorDietData);
      ApiService().CreateRoutine(instructorDietData, context);
    } else {
      print(userdieData);

      ApiService().CreateRoutine(userdieData, context);
    }

    // //print(MakeNewApidata);
  }

  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
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
            width: res_width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Routine",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                shrinkWrap: true,
                itemCount: widget.count,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      //print(widget.boolList![index]);
                      if (widget.boolList![index]) {
                        //print(_routineController.rotinedata);
                        Get.snackbar(
                            "you have already created a Routine For Day ${index + 1}",
                            "");
                      } else {
                        // widget.boolList![index] = true;
                        Get.to(() => Routine1Screen(),
                            arguments: [index, widget.boolList]);
                      }

                      // Get.toNamed('/Routine1Screen');
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 378.w,
                          height: 69.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                            border: Border.all(color: Color(0xffD2D2D2)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Day ${index + 1}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Image.asset(
                                  "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-4.png",
                                  scale: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  saveApiData();
                  // sendAndSaveControllerData();

                  // //print(data[1]);
                  // //print("dldldl");
                  // Navigator.push(context,MaterialPageRoute(builder: ((context) => RoutineScreen(  boolList: data[1]))));

                  // Get.to(()=>RoutineScreen(
                  //    boolList: data[1],
                  // ));
                },
                child: Container(
                  width: 356.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    gradient: kprimary,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Routine(txt, index, list) {
  return GestureDetector(
    onTap: () {
      //print(list[index]);

      // Get.toNamed('/Routine1Screen');
      Get.to(() => Routine1Screen(), arguments: [txt.toString()]);
    },
    child: Column(
      children: [
        Container(
          width: 378.w,
          height: 69.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
            border: Border.all(color: Color(0xffD2D2D2)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  txt,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Image.asset(
                  "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-4.png",
                  scale: 3,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    ),
  );
}
