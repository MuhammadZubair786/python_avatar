// ignore_for_file: prefer_const_constructors, unused_local_variable, empty_catches, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:chatbot_app/screens/OnBoarding/Regsister/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../export_all.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool showDropDownValidation = false;

  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();

  String passwordChecker = "";
  String? selectedValue;
  List items = ['Customer', 'Instructor'];

  userLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (userEmailController.text == "") {
      Get.snackbar(
        'Error',
        "Enter Email Address",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else if (userPasswordController.text == "") {
      Get.snackbar(
        'Error',
        "Enter Password Controller",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else {
      try {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return spinkit;
            });
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: userEmailController.text,
            password: userPasswordController.text);
        String User_Uid = userCredential.user!.uid;
        Get.back();
        Get.snackbar(
          'Success',
          "User Login Success",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
        Get.to(() => CustomStepper());
      } catch (e) {
         Get.back();
        Get.snackbar(
          'Error',
         e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: grey
            // image: DecorationImage(
            //   image: AssetImage("assets/Slicing/Android/4x/Ellipse 24.png"),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: Form(
          key: _form,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: grey,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/Slicing/Android/drawable-hdpi/logo-5.jpg",
                            ),
                          ),
                        ),
                      ),
                      Column(children: [
                        SizedBox(
                          height: 90.w,
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 119.r),
                        //   child: Image(image: AssetImage("assets/Slicing/Android/4x/Ellipse 18.png")),
                        // ),
                        SizedBox(height: 30.h),
                        Container(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: bprimary,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 26.h),
                        // Container(
                        //   width: 356.w,
                        //   child: TextFormField(
                        //     controller: fullNameController,
                        //     validator: (value) {
                        //       if (value!.isEmpty) {
                        //         return "* Required";
                        //       }
                        //     },
                        //     maxLines: 1,
                        //     style: TextStyle(color: Colors.black, fontSize: 15.sp),
                        //     decoration: InputDecoration(
                        //       filled: true,
                        //       fillColor: Color.fromARGB(255, 235, 226, 237).withOpacity(0.3),
                        //       contentPadding: EdgeInsets.zero,
                        //       border: OutlineInputBorder(
                        //         borderSide:  BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       errorBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       hintText: 'Full Name',
                        //       hintStyle: TextStyle(color: Colors.black),
                        //       prefixIcon: Icon(
                        //         Icons.person,
                        //         color: bprimary,
                        //         size: 27.r,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 235, 226, 237)
                                  .withOpacity(0.3),
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.email,
                                color: bprimary,
                                size: 27.r,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),

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
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.sp),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 235, 226, 237)
                                  .withOpacity(0.3),
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: bprimary, width: 2.sp),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: bprimary,
                                size: 27.r,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // Container(
                        //   width: 356.w,
                        //   child: TextFormField(
                        //     obscureText: true,
                        //     controller: userConfirmPassController,
                        //     validator: (value) {
                        //       if (value!.trim().isEmpty) {
                        //         return "* Required";
                        //       } else if (userConfirmPassController.text.trim() != userPasswordController.text.trim()) {
                        //         return 'Please Enter a Correct Password';
                        //       }
                        //       return null;
                        //     },
                        //     maxLines: 1,
                        //     style: TextStyle(color: Colors.purple, fontSize: 15.sp),
                        //     decoration: InputDecoration(
                        //       filled: true,
                        //    fillColor: Color.fromARGB(255, 235, 226, 237).withOpacity(0.3),
                        //       contentPadding: EdgeInsets.zero,
                        //       border: OutlineInputBorder(
                        //         borderSide:  BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       errorBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(color: bprimary, width: 2.sp),
                        //         borderRadius: BorderRadius.circular(50.r),
                        //       ),
                        //       hintText: 'Confirm Password',
                        //       hintStyle: TextStyle(color: Colors.black),
                        //       prefixIcon: Icon(
                        //         Icons.lock,
                        //         color: bprimary,
                        //         size: 27.r,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          onTap: () async {
                            // Get.to(()=>LoginUser());
                            // log('valud; $selectedValue');
                            // if (_form.currentState!.validate() && selectedValue != null) {
                            //   setState(() {
                            //     showDropDownValidation = false;
                            //   });
                            //   var data = {
                            //     "fullName": fullNameController.text.trim(),
                            //     "email": userEmailController.text.trim(),
                            //     "password": userPasswordController.text.trim(),
                            //     "confirmpassword": userConfirmPassController.text.trim(),
                            //     "userType": selectedValue.toString(),
                            //     "deviceToken": deviceToken.toString(),
                            //     "deviceType": deviceType
                            //   };

                            //   await ApiService().callRegister(context, data);
                            // } else {
                            //   setState(() {
                            //     showDropDownValidation = true;
                            //   });
                            // }
                            userLogin();
                            // Get.to(() => CustomStepper());
                          },
                          child: Container(
                            width: 356.w,
                            height: 65.h,
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
                                    "Log In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
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
                            color: bprimary,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        SocialMediasWidget(),
                        30.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed('/LoginScreen');
                            // Get.to(()=>CustomStepper());
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
                      ]),
                    ],
                  ),
                )),
          ),
        ));
  }
}
