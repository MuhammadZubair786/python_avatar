import 'package:flutter/material.dart';

import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final int userType;
  const OtpScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

OtpFieldController otpController = OtpFieldController();

class _OtpScreenState extends State<OtpScreen> {
 
  var code;
  @override
   void initState() {
    // ignore: avoid_prin
    var data = Get.arguments;
    //print("verify $data");
  }

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/Slicing/Android/drawable-hdpi/Group 240.png"),
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
                        SizedBox(height: 50.h),
                        Container(
                          width: 196.w,
                          height: 158.h,
                          child: Image(
                              image: AssetImage(
                                  "assets/Slicing/Android/drawable-hdpi/logo-5.png")),
                        ),
                        SizedBox(height: 62.h),
                        Container(
                          child: Text(
                            "Enter OTP",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 26.h),
                        OTPTextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: otpController,
                          otpFieldStyle: OtpFieldStyle(
                            borderColor: Colors.white,
                            enabledBorderColor: Colors.white,
                            focusBorderColor: Colors.white,
                            disabledBorderColor: Colors.white,
                            errorBorderColor: Colors.red,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                          // obscureText: true,
                          length: 6,
                          width: Get.width * 0.9,
                          fieldWidth: 55,
                          style: TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            //print("Completed: " + pin);
                            setState(() {
                              code = pin;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final userrouter = await Get.arguments;
                            print(userrouter);
                          

                            if (code != null) {
                              if (userrouter[0] == "VerifyUser" &&
                                  code != null) {
                                //print("account email verify");
                                // print(code);
                                print(widget.userType);

                                var data = {
                                  "email": userrouter[1],
                                  "otp": code,
                                  "deviceToken": deviceToken,
                                  "deviceType": deviceType
                                };
                                print(data);

                                ApiService().verifyUserCallApi(context, data,widget.userType);
                              } else {
                                //print("password otp verify");
                                var data = {
                                  "otp": code,
                                  "deviceToken": deviceToken,
                                  "deviceType": deviceType
                                };
                                print(data);

                                ApiService()
                                    .otpVerificationCallApi(context, data);
                              }
                            }

                            // //print()
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
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final userrouter = await Get.arguments;
                            print(userrouter[2]["email"]);
                            // print(userrouter[2]["email"]);

                            // //print()
                            // // if (userrouter[0] == "VerifyUser") {
                            // //   //print("account email verify");

                            // //       var data = {
                            // //       "email":userrouter[1],
                            // //     "otp": code,
                            // //     "deviceToken": deviceToken,
                            // //     "deviceType": deviceType
                            // //   };

                             var data = {"email":userrouter[2]["email"]};
                            ApiService().forgetPasswordCallApi(context, data);

                            // // } else {
                            // //   //print("password otp verify");
                            // //   var data = {
                            // //     "otp": code,
                            // //     "deviceToken": deviceToken,
                            // //     "deviceType": deviceType
                            // //   };
                            // //   ApiService()
                            // //       .otpVerificationCallApi(context, data);
                            // }
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
                                    "Resend Otp",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                ],
                              ),
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
