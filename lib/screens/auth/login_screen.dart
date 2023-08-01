

import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';

import '../../export_all.dart';
import '../user_selection_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final globalController = Get.put(GlobalController());
  bool showPwd = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        key: _formKey,
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed("/SignupScreen");
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
                            text: 'Dont have an account ?',
                          ),
                          TextSpan(
                              text: '  Signup Today',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              40.verticalSpace
            ],
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                // Get.back();
                Get.to(() => UserSelectionScreen());
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
          body: SingleChildScrollView(
            child: Center(
              child: GetBuilder<GlobalController>(
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
                          SizedBox(height: 20.h),
                          Container(
                            // width: 196.w,
                            // height: 158.h,
                            margin: EdgeInsets.symmetric(horizontal: 116.r),
                            child: Image(image: AssetImage("assets/Slicing/Android/drawable-hdpi/logo-5.png")),
                          ),
                          SizedBox(height: 48.h),
                          Container(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 25.sp),
                            ),
                          ),
                          SizedBox(height: 26.h),
                          Container(
                            width: 356.w,
                            // height: 56.h,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white, fontSize: 15.sp),
                              controller: userEmailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "* Required";
                                }
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  contentPadding: EdgeInsets.only(bottom: 0, top: 0),
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 23.r,
                                  ),
                                  // prefixIconConstraints: BoxConstraints(),
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
                                  )),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            width: 356.w,
                            // height: 56.h,
                            child: TextFormField(
                              obscureText: showPwd,
                              controller: userPasswordController,
                              style: TextStyle(color: Colors.white, fontSize: 15.sp),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "* Required";
                                }
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  contentPadding: EdgeInsets.symmetric(vertical: 13.r),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 23.r,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        showPwd = !showPwd;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 21.r,
                                    ),
                                  ),
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
                                  )),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            width: 356.w,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ForgotPasswordScreen());
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(decoration: TextDecoration.underline, color: Colors.white, fontSize: 17.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              final bt = Get.put(GlobalController());
                              bt.DietData.clear();
                              if (_formKey.currentState!.validate()) {
                                var data = {
                                  "email": userEmailController.text.trim(), // "customer321@yopmail.com",
                                  "password": userPasswordController.text.trim(), //"123456",
                                  "deviceType": deviceType.toString(),
                                  "deviceToken": deviceToken.toString(),
                                };

                                globalController.DietData;

                                ApiService().callLogin(context, data);
                              }
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
                                "Login",
                                style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          SocialMediasWidget()
                        ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
