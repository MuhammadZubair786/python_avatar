import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/bottom_controller.dart';
import 'package:chatbot_app/screens/AddCardScreen.dart';

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  // @override
  Future<dynamic> CongratulationPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
                width: 356.w,
                height: 252.h,
                padding: EdgeInsets.symmetric(vertical: 27.r, horizontal: 28.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Congratulations',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Payment Successfully',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 24.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        final bottomctrl = Get.put(BottomController());
                        bottomctrl.navBarChange(0);
                        Get.toNamed('/NavigateScreen');
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
                            "Back To Home",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              CongratulationPopUp(context);
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
                  "Pay Now",
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
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: GestureDetector(
              onTap: () {
                Get.to(() => AddCardScreen());
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
          30.verticalSpace,
          Container(
            height: 200.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Group 651@3x.png'),
                    fit: BoxFit.fill)),
          ),
          43.verticalSpace,
          priceList('Price', '\$50'),
          priceList('Marchand Fee', '\$2.5'),
          priceList('Total', '\$52.50'),
        ],
      ),
    );
  }

  priceList(tite, price) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      decoration: BoxDecoration(
          border: tite != 'Total'
              ? Border(bottom: BorderSide(width: 1, color: Color(0xffD6DCE1)))
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tite,
            style: GoogleFonts.barlow(
                fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
          Text(
            price,
            style: GoogleFonts.barlow(
                fontWeight: FontWeight.w600, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
