import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

import 'TrainerDietPlan1Screen.dart';

class CreateCustomerPlansScreen extends StatefulWidget {
  const CreateCustomerPlansScreen({super.key});

  @override
  State<CreateCustomerPlansScreen> createState() => _CreateCustomerPlansScreenState();
}

class _CreateCustomerPlansScreenState extends State<CreateCustomerPlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Create Customer Plans",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image(
              image: AssetImage(
                "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-13.png",
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed('/CustomerRoutine');
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
                          "Customer Routine",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/NutritionTrackingScreen');
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
                          "Customer Nutritional Tracking",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => TrainerDietPlan1Screen());
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
                          "Customer Diet Plan",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
