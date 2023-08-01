import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/export_all.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

final emailController = TextEditingController();
bool checker = true;

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    emailController.clear();
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
          body: SingleChildScrollView(
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
                        Container(
                          // width: 196.w,
                          // height: 158.h,
                          margin: EdgeInsets.symmetric(horizontal: 119.r),
                          child: Image(image: AssetImage("assets/Slicing/Android/drawable-hdpi/logo-5.png")),
                        ),
                        SizedBox(height: 30.h),
                        Container(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 26.h),
                        Container(
                          width: 356.w,
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white, fontSize: 15.sp),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              hintText: "Email Address",
                              hintStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 27.r,
                              ),
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
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: () {
                            var data = {"email": emailController.text.trim()};
                            ApiService().forgetPasswordCallApi(context, data);

                            // Get.toNamed('/OtpScreen');
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
                            alignment: Alignment.center,
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(),
                        ),
                      ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
