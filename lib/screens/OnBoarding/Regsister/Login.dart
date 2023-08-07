// ignore_for_file: prefer_const_constructors

import 'package:chatbot_app/Api.dart';
// import 'package:chatbot_app/screens/OnBoarding/Home/Home.dart';
import 'package:chatbot_app/screens/OnBoarding/Regsister/Home/Home.dart';
import 'package:chatbot_app/screens/OnBoarding/Regsister/Login.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../export_all.dart';
import '../../../widgets/disallow_indicator_widget.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {

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
  Widget build(BuildContext context) {
 return   Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: grey
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
            body:  SingleChildScrollView(
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
                    SizedBox(height: 90.w,),
                                    // Container(
                                    //   margin: EdgeInsets.symmetric(horizontal: 119.r),
                                    //   child: Image(image: AssetImage("assets/Slicing/Android/4x/Ellipse 18.png")),
                                    // ),
                                    SizedBox(height: 30.h),
                                    Container(
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(color: bprimary, fontSize: 25.sp, fontWeight: FontWeight.w600),
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
                                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color.fromARGB(255, 235, 226, 237).withOpacity(0.3),
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderSide:  BorderSide(color: bprimary, width: 2.sp),
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: bprimary, width: 2.sp),
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: bprimary, width: 2.sp),
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: bprimary, width: 2.sp),
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
                                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                                        decoration: InputDecoration(
                                          filled: true,
                                        fillColor: Color.fromARGB(255, 235, 226, 237).withOpacity(0.3),
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderSide:  BorderSide(color: bprimary, width: 2.sp),
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: bprimary, width: 2.sp),
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: bprimary, width: 2.sp),
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: bprimary, width: 2.sp),
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
                                        Get.to(()=>CustomStepper());

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
