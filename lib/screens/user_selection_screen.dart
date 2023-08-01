import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:chatbot_app/export_all.dart';

class UserSelectionScreen extends StatelessWidget {
  UserSelectionScreen({super.key});

  final globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/Slicing/Android/drawable-hdpi/Group 240.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 72.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 97.h),
                Container(
                  width: 196.w,
                  height: 158.h,
                  child: Image.asset(
                    "assets/Slicing/Android/drawable-hdpi/logo-5.png",
                  ),
                ),
                SizedBox(height: 45.h),
                Text(
                  "Please select one option",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 45.h),
                SpringWidget(
                  onTap: () {
                    log('onTapped');

                    userType = "Customer";

                    Get.toNamed("/LoginScreen");
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 110.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            width: 4,
                            color: bprimary,
                          ),
                          image: DecorationImage(
                            image: AssetImage(userTypeImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 25.w),
                      Expanded(
                        child: Text(
                          "USER",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45.h),
                SpringWidget(
                  onTap: () {
                    log('onTapped');

                    userType = "Instructor";

                    // globalController.selectedUser.value = USERTYPE.instructor;
                    Get.toNamed("/LoginScreen");
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 110.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            width: 4,
                            color: bprimary,
                          ),
                          image: DecorationImage(
                            image: AssetImage(trainerImageGirl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 25.w),
                      Expanded(
                        child: Text(
                          "TRAINER",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
