import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class DayRoutineScreen extends StatefulWidget {
   var count,ListEntry,totalkcl;
  DayRoutineScreen({this.count,this.ListEntry,this.totalkcl,super.key});

  @override
  State<DayRoutineScreen> createState() => _DayRoutineScreenState();
}

class _DayRoutineScreenState extends State<DayRoutineScreen> {
  final argument = Get.arguments;

  // List items = [
  //   {'item': 'Set', 'Quatity': 3},
  //   {'item': 'Reps', 'Quatity': 15},
  //   {'item': 'lbs', 'Quatity': 49.5},
  //   {'item': 'Burned Kcal', 'Quatity': 37},

  void initState(){
    super.initState();
    //print("data"+widget.ListEntry.toString());
  }
  // ];

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
     "Routine :" + (widget.count+1).toString(),
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: widget.ListEntry["exercises"].length,
              itemBuilder: (context,index){
                //print( widget.ListEntry["exercises"][index]["exercise"]);
                return listCard(widget.ListEntry["exercises"][index]["exercise"], widget.ListEntry["exercises"][index]);
              },
              padding: EdgeInsets.symmetric(horizontal: 27.r),
              // children: [
                // 10.verticalSpace,
                // listCard('Benchpress', items),
                // 20.verticalSpace,
                // listCard('Legpress', items),
                // 20.verticalSpace,
                // listCard('Shoulder Lateral Raise', items),
                // 20.verticalSpace,
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20.r),
                //       border: Border.all(width: 1, color: Color(0xffD2D2D2))),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 60.r),
                //         child: Text(
                //           'Total burned Kcal of routine 1:',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 22.sp,
                //               fontWeight: FontWeight.bold),
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //       20.verticalSpace,
                //       Text(
                //         '257',
                //         style: GoogleFonts.barlow(
                //             color: Colors.black,
                //             fontSize: 32.sp,
                //             fontWeight: FontWeight.bold),
                //       )
                //     ],
                //   ),
                // ),
              //   40.verticalSpace
              // ],
            ),
             Container(
              margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(width: 1, color: Color(0xffD2D2D2))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.r),
                        child: Text(
                          'Total burned Kcal of routine 1:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                                20.verticalSpace,
                      Text(
                  widget.totalkcl.toString(),
                        style: GoogleFonts.barlow(
                            color: Colors.black,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                40.verticalSpace
                    
          ],
        ),
      ));
        
  }

  listCard(title, lst) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        border: Border.all(width: 0.5, color: Color(0xffD2D2D2)),
      ),
      child: Column(children: [
        Container(
         
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.r),
              ),
              gradient: kprimary,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 1))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          padding:
               EdgeInsets.symmetric(vertical: 5.r),
          constraints: BoxConstraints(maxHeight: Get.height * 0.3),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                          border: lst.length - index != 1
                              ? Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.4)))
                              : null),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                       "Set",
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18.sp),
                          ),
                              Text(
                         lst["set"].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                          // Text(
                          //   "lst[index]['Quatity'].toString()",
                          //   style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                          border: lst.length - index != 1
                              ? Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.4)))
                              : null),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                       "Reps",
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                              Text(
                         lst["reps"].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                          // Text(
                          //   "lst[index]['Quatity'].toString()",
                          //   style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                          border: lst.length - index != 1
                              ? Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.4)))
                              : null),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                       "lbs",
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                              Text(
                         lst["lbs"].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                          // Text(
                          //   "lst[index]['Quatity'].toString()",
                          //   style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18.r),
                      // decoration: BoxDecoration(
                      //     border: lst.length - index != 1
                      //         ? Border(
                      //             bottom: BorderSide(
                      //                 width: 1,
                      //                 color: Colors.grey.withOpacity(0.4)))
                      //         : null),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                       "kcal",
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                              Text(
                         lst["kcal"].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                          // Text(
                          //   "lst[index]['Quatity'].toString()",
                          //   style: TextStyle(color: Colors.black, fontSize: 18.sp),
                          // )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
