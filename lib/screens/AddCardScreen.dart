import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

TextEditingController cardHolder = TextEditingController();
TextEditingController cardNumber = TextEditingController();
TextEditingController expDate = TextEditingController();
TextEditingController cvv = TextEditingController();

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Get.close(1);
            },
            child: Container(
              width: 356.w,
              height: 56.h,
              decoration: BoxDecoration(
                gradient: kprimary,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  "Add Now",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
            ),
          ),
          40.verticalSpace
        ],
      ),
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
          "Add Card",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: GestureDetector(
              onTap: () {
                // Get.toNamed("/NotificationsScreen");
              },
              child: Image.asset(
                  "assets/Slicing/Android/drawable-hdpi/Icon awesome-plus-circle@3x.png"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 50.r, horizontal: 20.r),
        children: [
          Text(
            'Select Card',
            style: TextStyle(color: Color(0xff1E1E1E), fontSize: 20.sp),
          ),
          31.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.w,
                height: 80.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD4D4D4)),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset(
                  'assets/Slicing/Android/drawable-hdpi/Group 539@3x.png',
                  width: 85.w,
                ),
              ),
              Container(
                width: 120.w,
                height: 80.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD4D4D4)),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset(
                  'assets/Slicing/paypal@3x.png',
                  width: 85.w,
                ),
              ),
              Container(
                width: 120.w,
                height: 80.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffD4D4D4)),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset(
                  'assets/Slicing/Android/drawable-hdpi/apple-pay@3x.png',
                  width: 61.5.w,
                ),
              ),
            ],
          ),
          27.verticalSpace,
          textBox(Get.width, cardHolder, 'Card Holder'),
          10.verticalSpace,
          textBox(Get.width, cardNumber, 'Card Number'),
          10.horizontalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBox(Get.width * 0.43, expDate, 'Exp Date'),
              textBox(Get.width * 0.43, cvv, 'CVV'),
            ],
          )
        ],
      ),
    );
  }

  textBox(wd, contr, title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
        Container(
          width: wd,
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
            style:
                TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 15),
            controller: contr,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 30.r),
              isDense: true,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
