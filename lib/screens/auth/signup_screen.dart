import 'dart:developer';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/widgets/disallow_indicator_widget.dart';

import '../../export_all.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  para() {
    //print('deviceToken: ' + deviceToken.toString());

    if (Platform.isIOS) {
      deviceType = 'ios';
    } else {
      deviceType = 'android';
    }
    //print('deviceType: ' + deviceType);
  }

  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool showDropDownValidation = false;

  final fullNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userConfirmPassController = TextEditingController();
  String passwordChecker = "";
  String? selectedValue;
  List items = ['Customer', 'Instructor'];

  @override
  void dispose() {
    fullNameController.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
    userConfirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    para();
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Slicing/Android/drawable-hdpi/Group 240.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Form(
        key: _form,
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
          body: Padding(
            padding: const EdgeInsets.only(left: constScreenHorizontal, right: constScreenHorizontal, bottom: constScreenHorizontal),
            child: DisAllowIndicatorWidget(
              child: SingleChildScrollView(
                child: Center(child: GetBuilder<GlobalController>(
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
                              margin: EdgeInsets.symmetric(horizontal: 119.r),
                              child: Image(image: AssetImage("assets/Slicing/Android/drawable-hdpi/logo-5.png")),
                            ),
                            SizedBox(height: 30.h),
                            Container(
                              child: Text(
                                "Signup",
                                style: TextStyle(color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 26.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                controller: fullNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "* Required";
                                  }
                                },
                                maxLines: 1,
                                style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
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
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                controller: userEmailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "* Required";
                                  }
                                },
                                maxLines: 1,
                                style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
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
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 356.w,
                              height: 50,
                              decoration: BoxDecoration(
                                // gradient: kprimary,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.5),
                                //     offset: Offset(0, 0),
                                //   ),
                                // ],
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(color: Colors.white, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      7.horizontalSpace,
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 29.r,
                                      ),
                                      15.horizontalSpace,
                                      Expanded(
                                        child: Text(
                                          "I'm a ?",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Row(
                                              children: [
                                                7.horizontalSpace,
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 29.r,
                                                ),
                                                15.horizontalSpace,
                                                Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                      userType = selectedValue.toString();
                                      setState(() {
                                        showDropDownValidation = false;
                                      });
                                    });
                                  },
                                  icon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/Slicing/Android/drawable-hdpi/Icon ionic-ios-arrow-dropdown-circle.png',
                                        scale: 1.7,
                                      ),
                                      10.horizontalSpace
                                    ],
                                  ),
                                  iconSize: 14,
                                  buttonWidth: 356.w,
                                  buttonPadding: EdgeInsets.only(left: 8.r, right: 8.sp, top: 0, bottom: 0),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: bprimary,
                                  ),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(left: 8, right: 8),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 356.w,
                                  dropdownPadding: null,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                ),
                              ),
                            ),
                            if (showDropDownValidation) SizedBox(height: 12.h),
                            if (showDropDownValidation)
                              Container(
                                width: 356.w,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "* Required",
                                    style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.normal, fontSize: 12),
                                  ),
                                ),
                              ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                obscureText: true,
                                controller: userPasswordController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "* Required";
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
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
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                obscureText: true,
                                controller: userConfirmPassController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "* Required";
                                  } else if (userConfirmPassController.text.trim() != userPasswordController.text.trim()) {
                                    return 'Please Enter a Correct Password';
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
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
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            GestureDetector(
                              onTap: () async {
                                log('valud; $selectedValue');
                                if (_form.currentState!.validate() && selectedValue != null) {
                                  setState(() {
                                    showDropDownValidation = false;
                                  });
                                  var data = {
                                    "fullName": fullNameController.text.trim(),
                                    "email": userEmailController.text.trim(),
                                    "password": userPasswordController.text.trim(),
                                    "confirmpassword": userConfirmPassController.text.trim(),
                                    "userType": selectedValue.toString(),
                                    "deviceToken": deviceToken.toString(),
                                    "deviceType": deviceType
                                  };

                                  

                                  await ApiService().callRegister(context, data);
                                } else {
                                  setState(() {
                                    showDropDownValidation = true;
                                  });
                                }
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
                                        "Signup",
                                        style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            SocialMediasWidget(),
                            30.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/LoginScreen');
                              },
                              child: Container(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Already have an account?',
                                        ),
                                        TextSpan(
                                            text: ' Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                  },
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
