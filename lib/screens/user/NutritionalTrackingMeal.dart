import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class NutritionalMealScreen extends StatelessWidget {
  NutritionalMealScreen({super.key});

  List items = [
    {'item': 'Set', 'Quatity': 3},
    {'item': 'Reps', 'Quatity': 15},
    {'item': 'lbs', 'Quatity': 49.5},
    {'item': 'Burned Kcal', 'Quatity': 37},
  ];
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
          "Nutritional Tracking",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 27.r),
        children: [
          10.verticalSpace,
          listCard('Meal 1', items),
          20.verticalSpace,
          listCard('Meal 2', items),
          40.verticalSpace
        ],
      ),
    );
  }

  listCard(title, lst) {
    return Column(
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
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 1))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monday 25, July 2022',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                      Text(
                        'Time: 04:00 pm To 10:00 PM',
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
                itemCount: lst.length,
                itemBuilder: (context, index) => Column(
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
                            lst[index]['item'].toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.sp),
                          ),
                          Text(
                            lst[index]['Quatity'].toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
        20.verticalSpace,
        Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 17.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(width: 1, color: Color(0xffD2D2D2))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Kcal of meal 1:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '257',
                style: GoogleFonts.barlow(
                    color: Colors.black,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
