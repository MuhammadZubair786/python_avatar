import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldpwd = TextEditingController();
  TextEditingController newpwd = TextEditingController();
  TextEditingController confpwd = TextEditingController();

  check_validate() {
    if (oldpwd.text.isEmpty) {
      Get.snackbar('Error', "Enter Old Password",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    } else if (newpwd.text.isEmpty) {
      Get.snackbar('Error', "Enter New Password",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    } else if (confpwd.text.isEmpty) {
      Get.snackbar('Error', "Enter Confirm Password",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    } else if (confpwd.text != newpwd.text) {
      Get.snackbar('Error', "Mismatch Password & Confirm Password",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    } else {
      var data = {"oldPassword": oldpwd.text, "newPassword": newpwd.text};

      ApiService().updatePassword(context, data);
    }
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
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              textBox('Old Password', oldpwd),
              10.verticalSpace,
              textBox('New Password', newpwd),
              10.verticalSpace,
              textBox('Confirm Password', confpwd),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  check_validate();
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
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

  textBox(hintTxt, contr) {
    return Container(
      width: 356.w,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.white,
        border: Border.all(color: Color(0xffD4D4D4)),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 15),
        controller: contr,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 30.r),
          isDense: true,
          hintText: hintTxt,
          hintStyle:
              TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
