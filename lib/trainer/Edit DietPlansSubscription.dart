import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/trainer/Subscriptions.dart';

class EdidDietPlansSubscriptionScreen extends StatefulWidget {
  const EdidDietPlansSubscriptionScreen({super.key});

  @override
  State<EdidDietPlansSubscriptionScreen> createState() =>
      _EdidDietPlansSubscriptionScreenState();
}

class _EdidDietPlansSubscriptionScreenState
    extends State<EdidDietPlansSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Edit Diet Plans Subscription",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image(
                  image: AssetImage(
                      "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png")),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 356.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD4D4D4)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintText: "Basic",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 356.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD4D4D4)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintText: "\$50.00",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 356.w,
                height: 129.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                  border: Border.all(color: Color(0xffD2D2D2)),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    hintText:
                        "Lorem ipsum dolor sit amet consectetur \nLorem ipsum dolor sit amet consectetur adipiscing elit nulla enim, pharetra iaculis habitasse nunc\nadipiscing elit nulla enim, pharetra iaculis habitasse nun\nadipiscing elit nulla enim, pharetra iaculis habitasse nun",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SubscriptionScreen());
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
}
