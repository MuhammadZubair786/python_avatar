import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

import '../SelectPaymentScreen.dart';

class SubscriptionUserScreen extends StatefulWidget {
  const SubscriptionUserScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionUserScreen> createState() => _SubscriptionUserScreenState();
}

class _SubscriptionUserScreenState extends State<SubscriptionUserScreen> {
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
            // width: Get.width * 0.39,
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
              // SizedBox(
              //   height: 10.h,
              // ),
              // plans("Basic"), plans("Advance"), plans("premium"),
              Card('Basic'),
              Card('Advance'),
              Card('premium'),
            ],
          ),
        ),
      ),
    );
  }

  plans(txt) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: Get.width * 0.9,
          child: Column(
            children: [
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.3,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        // height: 230.h,
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
                              padding: EdgeInsets.only(top: 10.r, bottom: 40.r),
                              child: Text(
                                txt,
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
                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit est eleifend ut nec risus, nunc velit dignissim dapibus primis commodo purus non nascetur et tincidunt. Iaculis nunc orci pharetra porttitor nullam eu litora.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
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
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }

  Container Card(String txt) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.r),
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Stack(

          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   txt,
            //   style: TextStyle(fontSize: 20.sp),
            // ),
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 378.w,
              height: 232.h,
              decoration: BoxDecoration(),
              child: Stack(children: [
                Container(
                  width: 378.w,
                  height: 220.h,
                  // padding: EdgeInsets.only(top: 21.sp),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(width: 1, color: Color(0xffD2D2D2))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        txt,
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                      10.verticalSpace,
                      Text(
                        '\$50.00',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 18.sp,
                        ),
                      ),
                      Divider(
                          thickness: 1,
                          indent: 100,
                          endIndent: 100,
                          color: Color(0xffD2D2D2)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur adipiscing elit est eleifend ut nec risus, nunc velit dignissim dapibus primis commodo purus non nascetur et tincidunt. Iaculis nunc orci pharetra porttitor nullam eu litora.',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 13.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      20.verticalSpace
                    ],
                  ),
                ),
              ]),
            ),
            Positioned(
                bottom: 0.sp,
                left: 10.3.sp,
                right: 10.3.sp,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => SelectPaymentScreen());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 152.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          gradient: kprimary),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )),
          ]),
    );
  }
}
