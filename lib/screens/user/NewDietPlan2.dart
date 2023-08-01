import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatbot_app/constants/colors.dart';

class NewDietPlanScreen2 extends StatefulWidget {
  var userDietDataList;
  var day;

  NewDietPlanScreen2({this.userDietDataList, this.day, Key? key}) : super(key: key);

  @override
  State<NewDietPlanScreen2> createState() => _NewDietPlanScreen2State();
}

class _NewDietPlanScreen2State extends State<NewDietPlanScreen2> {
  List items = [
    {'item': 'Chicken', 'Quatity': 4},
    {'item': 'Carrots', 'Quatity': 7},
    {'item': 'Rice Bowl', 'Quatity': 3},
    {'item': 'Burned Kcal', 'Quatity': 37},
  ];

  var mealData = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.userDietDataList);
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
              width: Get.width * 0.9,
              child: Image.asset(
                "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
                scale: 4.5,
              ),
            ),
          ),
          title: Text(
            "Diet Plan",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: widget.userDietDataList.length,
            itemBuilder: (context, index) {
              mealData = widget.userDietDataList[index]['mealdata'];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
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
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, spreadRadius: 1, offset: Offset(0, 1))]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Meal ${widget.userDietDataList[index]['meal']}",
                                style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          // padding:
                          //      EdgeInsets.symmetric(vertical: 5.r),
                          constraints: BoxConstraints(maxHeight: Get.height * 0.3),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: mealData.length,
                            itemBuilder: (context, nextIndex) => Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(18.r),
                                  decoration: BoxDecoration(border: mealData.length - index != 1 ? Border(bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.4))) : null),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        mealData[nextIndex]['meal'].toString(),
                                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                                      ),
                                      Text(
                                        mealData[nextIndex]['qty'].toString(),
                                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 17.r),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), border: Border.all(width: 1, color: Color(0xffD2D2D2))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Kcal of meal:' + " " + widget.userDietDataList[index]['meal'].toString(),
                                style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.userDietDataList[index]['totalmeal'].toString(),
                                style: GoogleFonts.barlow(color: Colors.black, fontSize: 32.sp, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              );
            }));
  }
}
