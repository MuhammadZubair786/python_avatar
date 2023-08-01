import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:http/http.dart' as http;

import '../../constants/global.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // void initState() {
  //   super.initState();
  // }

  dynamic notificatio1n = [];
  var runnnotification = false;

  void initState() {
    super.initState();
    //print(notification);
    runnnotification = notification;
    switchnot = runnnotification;
  }

  Future<void> Notification(enable) async {
    final Url = Uri.parse(
        '${apiGlobal}auth/notificationUpdate');
    http.Response response = await http.post(Url,
        headers: {'authorization': newToken.toString(), 'deviceToken': 'abc'},
        body: {});
    //print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        switchnot = !switchnot;
        //print(switchnot);
      });

      Get.snackbar('succesfully', "Notification Update succesfully",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    } else {
      Get.snackbar('Error', "Notification Not Update",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  var switchnot = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 23.r,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.r),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD2D2D2)),
                ),
                width: 378.w,
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    Transform.scale(
                      scale: 0.5,
                      child: CupertinoSwitch(
                        activeColor: bprimary,
                        onChanged: (value) {
                          Notification(value);
                          //print("object${value}");
                        },
                        value: switchnot,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              settingItem(
                'Change Password',
                () {
                  Get.toNamed('/ChangePasswordScreen');
                },
              ),
              10.verticalSpace,
              settingItem('Privacy Policy', () {
                Get.toNamed("/PrivacyPolicyScreen");
              }),
              10.verticalSpace,
              settingItem('Terms & Conditions', () {
                Get.toNamed("/TermsAndConditionsScreen");
              }),
            ],
          ),
        ),
      ),
    );
  }

  settingItem(title, fun) {
    return GestureDetector(
      onTap: fun,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),
            color: Colors.white,
            border: Border.all(color: Color(0xffD2D2D2)),
          ),
          width: 378.w,
          height: 60.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23.r,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.asset(
                      "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-6.png",
                      scale: 5,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
