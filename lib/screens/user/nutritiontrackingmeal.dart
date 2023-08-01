import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

import '../main_folder/custom_bottom_navigation.dart';

class NutritiontrackingMealScreen extends StatefulWidget {
  const NutritiontrackingMealScreen({super.key});

  @override
  State<NutritiontrackingMealScreen> createState() =>
      _NutritiontrackingMealScreenState();
}

class _NutritiontrackingMealScreenState
    extends State<NutritiontrackingMealScreen> {
  bool timezone = false;
  final List time1 = [
    '04:00',
    '05:00',
    '06:00',
  ];
  final List<String> itemsmeal = [
    'Chicken',
    'Carrots',
    'Rice Bowl',
  ];

  String? selectedValuem1c;
  String? selectedValuem1v;
  String? selectedValuem1r;
  String? selectedValuemT1;
  int counterm1c = 0;
  int counterm1v = 0;
  int counterm1r = 0;
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
          "Nutritional Tracking",
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
                10.verticalSpace,
                meal("Meal 1"),
                SizedBox(
                  height: 14.h,
                ),
                meal("Meal 2"),
                SizedBox(
                  height: 13.h,
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(DietPlanScreen());
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
                            "Add More",
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
                SizedBox(
                  height: 13.h,
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(MyRoutineScreen());
                  },
                  child: GestureDetector(
                    onTap: () {
                      // Get.toNamed("/MyRoutineScreen");
                      Get.to(() => CustomBottomNavigation());
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
                ),
                SizedBox(
                  height: 13.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  meal(meal) {
    return Column(
      children: [
        SizedBox(
          height: 17.h,
        ),
        Row(
          children: [
            Text(
              meal,
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
                value: selectedValuem1c,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValuem1c = value as String?;
                    },
                  );
                },
                items: itemsmeal
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
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 12.sp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (counterm1c > 0) {
                                counterm1c--;
                              }
                            });
                          },
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Text(
                      counterm1c.toString(),
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
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 12.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            counterm1c++;
                          });
                        },
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
                  'Carrots',
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
                value: selectedValuem1v,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValuem1v = value as String?;
                    },
                  );
                },
                items: itemsmeal
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
                                if (counterm1v > 0) {
                                  counterm1v--;
                                }
                              },
                            );
                          },
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Text(
                      counterm1v.toString(),
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
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 12.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            counterm1v++;
                          });
                        },
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
                value: selectedValuem1r,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValuem1r = value as String?;
                    },
                  );
                },
                items: itemsmeal
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
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 12.sp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (counterm1r > 0) {
                                counterm1r--;
                              }
                            });
                          },
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Text(
                      counterm1r.toString(),
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
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 12.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            counterm1r++;
                          });
                        },
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
          height: 17.h,
        ),
        Row(
          children: [
            Text(
              "Start Time",
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
                  '04:00',
                  style: TextStyle(color: Colors.black, fontSize: 15.sp),
                ),
                value: selectedValuemT1,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValuemT1 = value as String?;
                    },
                  );
                },
                items: time1
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          timezone = true;
                        });
                      },
                      child: Container(
                        width: 54.w,
                        height: 34.h,
                        decoration: BoxDecoration(
                          color: timezone ? Color(0xffFD6839) : Colors.white,
                          borderRadius: BorderRadius.circular(
                            17.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "AM",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          timezone = false;
                        });
                      },
                      child: Container(
                        width: 54.w,
                        height: 34.h,
                        decoration: BoxDecoration(
                          color: timezone ? Colors.white : Color(0xffFD6839),
                          borderRadius: BorderRadius.circular(
                            17.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "PM",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
