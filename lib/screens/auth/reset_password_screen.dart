import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/global_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

GlobalKey<FormState> _form = GlobalKey<FormState>();
final userPasswordController = TextEditingController();
final userConfirmPassController = TextEditingController();
var passwordChecker = '';

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Slicing/Android/drawable-hdpi/Group 240.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Image(
                  image: AssetImage(
                    "assets/Slicing/Android/drawable-hdpi/Icon ionic-ios-arrow-back-1.png",
                  ),
                ),
              ),
            ),
          ),
          body: Form(
            key: _form,
            child: SingleChildScrollView(child: GetBuilder<GlobalController>(
              builder: (controller) {
                return controller.isLoding
                    ? Center(
                        child: Image.asset(
                          "assets/Slicing/output-onlinegiftools.gif",
                          height: 125.0,
                          color: Colors.orange,
                          width: 125.0,
                        ),
                      )
                    : Column(children: [
                        Container(
                          // width: 196.w,
                          // height: 158.h,
                          margin: EdgeInsets.symmetric(horizontal: 119.r),
                          child: Image(image: AssetImage("assets/Slicing/Android/drawable-hdpi/logo-5.png")),
                        ),
                        SizedBox(height: 30.h),
                        Container(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 26.h),
                        Container(
                          width: 356.w,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 15.sp),
                            validator: (value) {
                              passwordChecker = value.toString();
                              if (value == "") return "* Required";
                              // else if (value!.length < 9)
                              //   return 'Password is too short atleast 8 characters';
                              // else if (!validateStructure(value))
                              //   return 'Must be include atleast one Special Character, Number and Uppercase letter e.g(Vignesh123!)';
                              return null;
                            },
                            controller: userPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter New Password",
                              hintStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 29.r, vertical: 0),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          width: 356.w,
                          height: 56.h,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white, fontSize: 15.sp),
                            validator: (value) {
                              if (value == "") {
                                return "* Required";
                              } else if (value != passwordChecker) {
                                return 'Please Enter a Correct Password';
                              } else
                                return null;
                            },
                            controller: userConfirmPassController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 29.r, vertical: 0),
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: () {
                            var data = {
                              "password": userPasswordController.text,
                            };

                            ApiService().resetPasswordApi(context, data);
                          },
                          child: Container(
                            width: 356.w,
                            height: 56.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: kprimary,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(),
                        ),
                      ]);
              },
            )),
          ),
        ),
      ),
    );
  }
}
