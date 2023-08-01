// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/RoutineController.dart';
import 'package:chatbot_app/screens/user/Routine1.dart';

import 'Day1Routine.dart';

class GetRoutineScreen extends StatefulWidget {
  var count,ListEntry;
  GetRoutineScreen(
      {this.count,
      this.ListEntry,
      Key? key})
      : super(key: key);

 

  @override
  State<GetRoutineScreen> createState() => _GetRoutineScreenState();
}

class _GetRoutineScreenState extends State<GetRoutineScreen> {
  void initState() {
    super.initState();
    //print(widget.ListEntry);
    // getRoutine();
    // //print(widget.count);
  }

  // RotineController _routineController = Get.put(RotineController());



 

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
                      //print(widget.ListEntry[index]["totalCal"]);
                      Get.to(()=>DayRoutineScreen(
                        totalkcl:widget.ListEntry[index]["totalCal"],
                        count: index,
                        ListEntry: widget.ListEntry[index]));
                      // //print(widget.boolList![index]);
                      // if (widget.boolList![index]) {
                      
                        // Get.snackbar(
                        //     "you have already created a Routine For Day ${index + 1}",
                            // "");
                      // } else {
                      //   // widget.boolList![index] = true;
                      //   // Get.to(() => Routine1Screen(),
                      //   //     arguments: [index, widget.boolList]);
                      // }

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
              
            ],
          ),
        ),
      ),
    );
  }
}

