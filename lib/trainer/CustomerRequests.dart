import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/global_controller.dart';
import 'package:chatbot_app/screens/NewDietPlan.dart';
import 'package:http/http.dart' as http;

import '../Api.dart';
import '../constants/global.dart';
import 'CustomerRoutine.dart';
import 'NutritionTracking.dart';

class CustomerRequestsScreen extends StatefulWidget {
  const CustomerRequestsScreen({super.key});

  @override
  State<CustomerRequestsScreen> createState() => _CustomerRequestsScreenState();
}

class _CustomerRequestsScreenState extends State<CustomerRequestsScreen> {
  final bt = Get.put(GlobalController());

  @override
  void initState() {
    RequestAPI();
    super.initState();
  }

  bool _isLoading = false;
  dynamic GetRequest = [];

  Future<void> RequestAPI() async {
    final Url = Uri.parse('${apiGlobal}request/getRequestsList');
    var headers = {'authorization': newToken.toString()};
    http.Response response = await http.get(
      Url,
      headers: headers,
      // body: jsonBody,
    );
    setState(() {
      _isLoading = true;
    });
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var res_data = json.decode(response.body);

      GetRequest = res_data["data"];
      // setState(() {
      //   _isLoading = false;
      // });
    }

    //print('Response ${GetRequest}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Customer Requests",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  GetRequest.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: GetRequest.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 378.w,
                              height: 87.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.white,
                                border: Border.all(color: Color(0xffD2D2D2)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/Slicing/Android/4x/Ellipse -5.png",
                                      scale: 5,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          GetRequest[index]['senderID']['fullName'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Request for ${GetRequest[index]['requestType'].toString()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (bt.DietData.isEmpty) {
                                              if (GetRequest[index]['requestType'].toString() == "Diet") {
                                                dietRequestUserId = "";
                                                dietRequestUserType = "";
                                                dietRequestUserType = GetRequest[index]["senderType"];
                                                Get.to(() => NewDietPlanScreen());
                                                dietRequestUserId = GetRequest[index]["senderID"]["_id"];

                                                // Get.to(() => TrainerDietPlan1Screen(
                                                //       userName: GetRequest[index]['senderID']['fullName'],
                                                //       userType: GetRequest[index]['senderType'],
                                                //     ));
                                              } else if (GetRequest[index]['requestType'].toString() == "Nutrition") {
                                                Get.to(() => NutritionTrackingScreen());
                                              } else {
                                                Get.to(() => CustomerRoutine());
                                              }
                                            } else {
                                              Get.snackbar("Diet Alreadyn Created", "");
                                            }
                                          },
                                          child: Container(
                                            width: 78.w,
                                            height: 35.h,
                                            decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius: BorderRadius.circular(50.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Accept",
                                                style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: 78.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            gradient: kprimary,
                                            borderRadius: BorderRadius.circular(50.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Reject",
                                              style: TextStyle(color: Colors.white, fontSize: 12.sp),
                                            ),
                                          ),
                                        ),

                                        // Text(
                                        //   "Request a Diet Plan",
                                        //   style: TextStyle(
                                        //     fontWeight: FontWeight.normal,
                                        //     color: Colors.black,
                                        //     fontSize: 12,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : CircularProgressIndicator()
                ],
              ),

              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Customer(),
            ],
          ),
        ),
      ),
    );
  }
}

Customer() {
  return Container(
    width: 378.w,
    height: 87.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      color: Colors.white,
      border: Border.all(color: Color(0xffD2D2D2)),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Image.asset(
            "assets/Slicing/Android/4x/Ellipse -5.png",
            scale: 5,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Martin Smith",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Request a Diet Plan",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 78.w,
                height: 35.h,
                decoration: BoxDecoration(
                  gradient: kprimary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    "Accept",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),

              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 78.w,
                height: 35.h,
                decoration: BoxDecoration(
                  gradient: kprimary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    "Reject",
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              // Text(
              //   "Request a Diet Plan",
              //   style: TextStyle(
              //     fontWeight: FontWeight.normal,
              //     color: Colors.black,
              //     fontSize: 12,
              //   ),
              // )
            ],
          ),
        ],
      ),
    ),
  );
}
