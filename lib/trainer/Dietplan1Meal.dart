import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

import '../screens/main_folder/custom_bottom_navigation.dart';

class DietPlan1MEalScreen extends StatefulWidget {
  const DietPlan1MEalScreen({super.key});

  @override
  State<DietPlan1MEalScreen> createState() => _DietPlan1MEalScreenState();
}

class _DietPlan1MEalScreenState extends State<DietPlan1MEalScreen> {
  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;
  final List<String> items = [
    'chiken',
    'Carrot',
    'Rice Bowl',
  ];
  int counter = 1;
  int counter2 = 1;
  int counter3 =1;

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
            width: Get.width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Diet Plan ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                Container(
                  height: 135.h,
                  width: 378.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      5.r,
                    ),
                    border: Border.all(
                      color: Color(0xffD2D2D2),
                      width: 1.w,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Diet Plan1",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Day 1",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Monday: July 25, 2022",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Time: 04:00 PM",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    Text(
                      "Meal 1",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 53.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField2(
                        // dropdownWidth: 315.w,
                        dropdownDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        buttonPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          size: 24.h,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          // alignLabelWithHint: true,
                          // contentPadding:
                          //     EdgeInsets.symmetric(
                          //         horizontal: 20.w),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        isExpanded: true,
                        iconEnabledColor: Colors.black,
                        buttonWidth: 165.w,
                        buttonHeight: 53.h,
                        hint: Text(
                          'Chicken',
                          style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue = value as String?;
                            },
                          );
                        },
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      height: 53.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                gradient: kprimary,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 12.sp,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                  });
                                },
                              ),
                            ),
                            Text(
                              counter.toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                gradient: kprimary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 12.sp,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (counter > 0) {
                                        counter--;
                                      }
                                    });
                                  },
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 53.h,
                      width: 214.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "4pcs Of Chicken",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 29.w,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Kcal:",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "600",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 53.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField2(
                        // dropdownWidth: 315.w,
                        dropdownDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        buttonPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          size: 24.h,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          // alignLabelWithHint: true,
                          // contentPadding:
                          //     EdgeInsets.symmetric(
                          //         horizontal: 20.w),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        isExpanded: true,
                        iconEnabledColor: Colors.black,
                        buttonWidth: 165.w,
                        buttonHeight: 53.h,
                        hint: Text(
                          'Carrot',
                          style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        value: selectedValue2,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue2 = value as String?;
                            },
                          );
                        },
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      height: 53.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                gradient: kprimary,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 12.sp,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    counter2++;
                                  });
                                },
                              ),
                            ),
                            Text(
                              counter2.toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                gradient: kprimary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 12.sp,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        if (counter2 > 0) {
                                          counter2--;
                                        }
                                      },
                                    );
                                  },
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 53.h,
                      width: 214.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "1pcs Of Carrot",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 29.w,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Kcal:",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "10",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 53.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField2(
                        // dropdownWidth: 315.w,
                        dropdownDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        buttonPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          size: 24.h,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          // alignLabelWithHint: true,
                          // contentPadding:
                          //     EdgeInsets.symmetric(
                          //         horizontal: 20.w),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        isExpanded: true,
                        iconEnabledColor: Colors.black,
                        buttonWidth: 165.w,
                        buttonHeight: 53.h,
                        hint: Text(
                          'Rice Bowl',
                          style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        value: selectedValue3,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue3 = value as String?;
                            },
                          );
                        },
                        items: items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                        height: 53.h,
                        width: 165.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 34.h,
                                width: 34.w,
                                decoration: BoxDecoration(
                                  gradient: kprimary,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 12.sp,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      counter3++;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                counter3.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                height: 34.h,
                                width: 34.w,
                                decoration: BoxDecoration(
                                  gradient: kprimary,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 12.sp,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (counter3 > 0) {
                                          counter3--;
                                        }
                                      });
                                    },
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 53.h,
                      width: 214.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          "1 bowl Of Rice",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 29.w,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Kcal:",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "80",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 56.h,
                  width: 375.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      "Total Kcal of meal 1: 690",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CustomBottomNavigation());
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
                            "Done",
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
      ),
    );
  }
}
