import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/global.dart';
import 'package:http/http.dart' as http;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {


  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(
                height: 0.2.h,
              ),
              Container(
                width: res_width * 0.9,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      width: 378.w,
                      height: 87.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 49.w,
                            height: 49.h,
                            child: Image.asset(
                              "assets/Slicing/Android/4x/Ellipse 21.png",
                              // scale: 3,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Sarah Doe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                  text:
                                      '  Lorem ipsum dolor sit amet \nconsectetur adipiscing elit sodales',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: res_width * 0.9,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      width: 378.w,
                      height: 87.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 49.w,
                            height: 49.h,
                            child: Image.asset(
                              "assets/Slicing/Android/4x/Ellipse 22.png",
                              // scale: 3,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'John Doe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                  text:
                                      '  Lorem ipsum dolor sit amet \nconsectetur adipiscing elit sodales',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: res_width * 0.9,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      width: 378.w,
                      height: 87.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 49.w,
                            height: 49.h,
                            child: Image.asset(
                              "assets/Slicing/Android/4x/Ellipse 23.png",
                              // scale: 3,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Amy Jackson',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                  text:
                                      '  Lorem ipsum dolor sit amet \nconsectetur adipiscing elit sodales',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      width: 378.w,
                      height: 87.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 49.w,
                            height: 49.h,
                            child: Image.asset(
                              "assets/Slicing/Android/4x/Ellipse 21.png",
                              // scale: 3,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Sarah Doe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                  text:
                                      '  Lorem ipsum dolor sit amet \nconsectetur adipiscing elit sodales',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    msg(),
                    msg(),
                    msg(),
                    msg(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      width: 378.w,
                      height: 87.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 49.w,
                            height: 49.h,
                            child: Image.asset(
                              "assets/Slicing/Android/4x/Ellipse 21.png",
                              // scale: 3,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Sarah Doe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                  text:
                                      '  Lorem ipsum dolor sit amet \nconsectetur adipiscing elit sodales',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  msg() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.white,
            border: Border.all(color: Color(0xffD2D2D2)),
          ),
          width: 378.w,
          height: 87.h,
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Container(
                width: 340.w,
                child: Text(
                    "Lorem ipsum dolor sit amet consectetur adipiscing elit sodales"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
