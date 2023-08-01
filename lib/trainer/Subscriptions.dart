import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/trainer/Edit%20DietPlansSubscription.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // actions: [Image.asset("assets/images/Icon awsome-edit.png")],
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            // width: res_width * 0.39,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4,
            ),
          ),
        ),
        title: Text(
          "Subscriptions For Diet Plans",
          style: TextStyle(color: Color(0xff212121)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              plan("Diet Plans"),
              plan("Nutritional Tracking Plans"),
              plan("Routine Plans"),
            ],
          ),
        ),
      ),
    );
  }

  plan(txt) {
    return Column(
      children: [
        Text(txt),
        SizedBox(
          height: 10.h,
        ),
        CarouselSlider.builder(
          itemCount: 6,
          options: CarouselOptions(
            height: 280.h,
            // aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            initialPage: 0,
            autoPlay: false,
            enlargeCenterPage: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayInterval: const Duration(seconds: 1),
            onPageChanged: (index, reason) {},
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: Get.width * 0.9,
              child: Column(
                children: [
                  Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.275,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 5,
                          child: Container(
                            height: 230.h,
                            width: 378.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Colors.white,
                              border: Border.all(color: Color(0xffD2D2D2)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Basic",
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Center(
                                  child: Text(
                                    "\$50.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  width: Get.width * 0.8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur adipiscing elit nostra augue imperdiet, nullam parturient faucibus fusce pharetra dapibus est congue in. Consequat tristique duis vestibulum molestie nisi nunc arcu inceptos nulla sodales maecenas fermentum dictum, proin vivamus suspendisse nostra sapien turpis bibendum nam malesuada viverra sollicitudin.",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 110,
                          bottom: 10,
                          child: Container(
                            width: 152.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              gradient: kprimary,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Buy Now",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => EdidDietPlansSubscriptionScreen());
                            },
                            child: Container(
                              child: Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
