import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/screens/auth/login_screen.dart';
import 'package:chatbot_app/constants/colors.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  bool? p_checked = false;
  bool? is_checked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<dynamic> AgreementPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          bool isChecked1 = false;
          bool isChecked2 = false;
          return StatefulBuilder(
            builder: (context, setState) {
              final theme = Theme.of(context);
              final oldCheckboxTheme = theme.checkboxTheme;
              final newCheckBoxTheme = oldCheckboxTheme.copyWith(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(MaterialState.pressed)) {
                    return bprimary;
                  }
                  return Colors.black;
                }),
                checkColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(MaterialState.pressed)) {
                    return bprimary;
                  }
                  return Colors.grey;
                }),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              );

              return Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Colors.white),
                      // width: Get.width * 0.85,
                      width: 356.w,
                      height: 351.h,
                      // padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          10.verticalSpace,
                          Text(
                            "Agreement",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                30.h.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.r),
                                  child: Text(
                                    'I have read and agreed with:',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                  ),
                                ),
                                20.verticalSpace,
                                Container(
                                  width: Get.width * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Theme(
                                          data: ThemeData(
                                              // unselectedWidgetColor: Colors.red,
                                              checkboxTheme: newCheckBoxTheme),
                                          child: Checkbox(
                                            value: isChecked1,
                                            visualDensity: VisualDensity(
                                                horizontal: 0.0, vertical: -4),
                                            activeColor: bprimary,
                                            // activeColor: isChecked1 ? Colors.white: Colors.grey ,
                                            checkColor: Colors.white,
                                            focusColor: Colors.grey,
                                            tristate: false,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked1 = !isChecked1;
                                              });
                                            },
                                          )),
                                      Text(
                                        'Term & Conditions',
                                        style: TextStyle(fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Theme(
                                          data: ThemeData(
                                              // unselectedWidgetColor: Colors.red,
                                              checkboxTheme: newCheckBoxTheme),
                                          child: Checkbox(
                                            visualDensity: VisualDensity(
                                                horizontal: 0.0, vertical: 0.0),
                                            value: isChecked2,
                                            tristate: false,
                                           activeColor: bprimary,
                                            // activeColor: isChecked1 ? Colors.white: Colors.grey ,
                                            checkColor: Colors.white,
                                            focusColor: Colors.grey,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked2 = !isChecked2;
                                              });
                                            },
                                          )),
                                      Text(
                                        'Privacy Policy',
                                        style: TextStyle(fontSize: 16.sp),
                                      )
                                    ],
                                  ),
                                ),
                                10.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.r),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Get.toNamed("/CreateProfileScreen");
                                            // Get.toNamed('/SelectUserScreen');
                                            // Navigator.of(context).pop();
                                          }
                                        },
                                        child: Container(
                                          width: 154.w,
                                          height: 55.h,
                                          decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(29.r),
                                                      right: Radius.circular(
                                                          29.r))),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Accept',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // Do something like updating SharedPreferences or User Settings etc.
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Container(
                                          width: 154.w,
                                          height: 55.h,
                                          decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(29.r),
                                                      right: Radius.circular(
                                                          29.r))),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Decline',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ) // 50.h.verticalSpace,
                        ],
                      )),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage("assets/Slicing/Android/drawable-hdpi/Group 240.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [
        SizedBox(height: 97.h),
        Container(
          width: 196.w,
          height: 158.h,
          child: Image(
              image: AssetImage(
                  "assets/Slicing/Android/drawable-hdpi/logo-5.png")),
        ),
        SizedBox(height: 97.h),
        GestureDetector(
          onTap: () {
            Get.toNamed('/LoginScreen');
          },
          child: Container(
            width: 400.w,
            height: 60.h,
            decoration: BoxDecoration(
              gradient: kprimary,
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 5,
                  // blurRadius: 0,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              // border: Border.all(color: Colors.white, width: 3.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    "Login with Email",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        GestureDetector(
          onTap: () {
            AgreementPopUp(context);
          },
          child: Container(
            width: 400.w,
            height: 60.h,
            decoration: BoxDecoration(
              gradient: kprimary2,
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 5,
                  // blurRadius: 0,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              // border: Border.all(color: Colors.white, width: 3.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    "Login with Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        GestureDetector(
          onTap: () {
            AgreementPopUp(context);
          },
          child: Container(
            width: 400.w,
            height: 60.h,
            decoration: BoxDecoration(
              gradient: kprimary3,
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 5,
                  // blurRadius: 0,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              // border: Border.all(color: Colors.white, width: 3.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                              'assets/Slicing/Icon simple-google.svg',
                              width: 23.r,
                              color: Colors.white,
                            ),
                  SizedBox(width: 4.w),
                  Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        GestureDetector(
          onTap: () {
           AgreementPopUp(context);
          },
          child: Container(
            width: 400.w,
            height: 60.h,
            decoration: BoxDecoration(
              // gradient: kprimary3,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // spreadRadius: 5,
                  // blurRadius: 0,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              // border: Border.all(color: Colors.white, width: 3.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    "Login with Apple",
                    style: TextStyle(color: Colors.black, fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 232.h),
        GestureDetector(
          onTap: () {
            Get.toNamed('/SignupScreen');
          },
          child: Container(
            child: Center(
              child: RichText(
                text:  TextSpan(
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Dont have an account ?',
                        ),
                    TextSpan(
                        text: '  Signup',
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
    ));
  }

  
}
