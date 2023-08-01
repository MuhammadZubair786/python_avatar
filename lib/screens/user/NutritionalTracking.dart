import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/global.dart';
import 'NutritionalTrackingMeal.dart';
import 'package:http/http.dart' as http;

class NutritionalTrackingScreen extends StatefulWidget {
  const NutritionalTrackingScreen({Key? key}) : super(key: key);

  @override
  State<NutritionalTrackingScreen> createState() => _NutritionalTrackingScreenState();
}

class _NutritionalTrackingScreenState extends State<NutritionalTrackingScreen> {
  @override
  void initState() {
    Nutrition();
    super.initState();
  }

  bool _isLoading = false;
  dynamic getNutrition = [];
  Future<void> Nutrition() async {
    final Url = Uri.parse('https://gymsta-api.jumppace.com:9000/api/v1/user/getnutrition');
    final headers = {'Content-Type': 'application/json', 'authorization': newToken.toString()};

    http.Response response = await http.get(
      Url,
      headers: headers,
      // body: jsonBody,
    );
    setState(() {
      _isLoading = true;
    });
    //print(response.statusCode);
    if (response.statusCode == 201) {
      var res_data = json.decode(response.body);
      getNutrition = res_data;
      setState(() {
        _isLoading = false;
      });
    }

    //print('Response ${getNutrition['data']['nutritionEntries']}');
  }

  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: res_width * 0.9,
              child: Image.asset(
                "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
                scale: 4.5,
              ),
            ),
          ),
          title: Text(
            "Nutritional Tracking",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: Nutrition(),
              builder: (context, snapshot) {
                return userType == 'Instructor'
                    ? Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  DayMealCheckedCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCheckedCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DayMealCard(),
                                ],
                              );
                            },
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          getNutrition.length > 0
                              ? ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                                  itemCount: getNutrition['data']['nutritionEntries'].length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    String formateddate = getNutrition['data']['nutritionEntries'][index]['createdAt'];
                                    DateTime now = DateTime.parse(formateddate);
                                    formateddate = DateFormat('MMMM').format(now);
                                    String formateddate2 = getNutrition['data']['nutritionEntries'][index]['createdAt'];

                                    formateddate2 = DateFormat.yMMMMd('en_US').format(now);
                                    return Column(
                                      children: [
                                        Container(
                                          width: 378.w,
                                          height: 87.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                            border: Border.all(color: Color(0xffD2D2D2)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 30.w,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Day",
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                                        ),
                                                        3.horizontalSpace,
                                                        Text(
                                                          getNutrition['data']['nutritionEntries'][index]['day'].toString(),
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      getNutrition['data']['nutritionEntries'][index]['title'].toString(),
                                                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          formateddate,
                                                          style: TextStyle(color: Colors.black),
                                                        ),
                                                        // Text(
                                                        //   "July 25, 2022",
                                                        //   style: TextStyle(color: Colors.black),
                                                        // ),
                                                        Text(
                                                          formateddate2,
                                                          style: TextStyle(color: Colors.black),
                                                        ),
                                                        Text(
                                                          "data",
                                                          style: TextStyle(color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Container(
                                                        height: 16.h,
                                                        width: 16.w,
                                                        // child: Image.asset(
                                                        //   "",
                                                        // ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        10.verticalSpace,
                                      ],
                                    );
                                  })
                              : CircularProgressIndicator(),
                        ],
                      );
              },
            ),
          ),
        ));
  }

  DayMealCheckedCard() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => NutritionalMealScreen());
          },
          child: Container(
            width: 378.w,
            height: 87.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
              border: Border.all(color: Color(0xffD2D2D2)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Day 1",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Meal 1",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Monday",
                            style: TextStyle(color: Color(0xFF000000)),
                          ),
                          Text(
                            "July 25, 2022",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "data",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              height: 16.h,
              width: 16.w,
              child: Image.asset(
                "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
              ),
            ),
          ),
        )
      ],
    );
  }
}

DayMealCard() {
  return InkWell(
    onTap: () {
      Get.to(() => NutritionalMealScreen());
    },
    child: Container(
      width: 378.w,
      height: 87.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        border: Border.all(color: Color(0xffD2D2D2)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Day 1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Meal 1",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Monday",
                      style: TextStyle(color: Colors.black),
                    ),
                    // Text(
                    //   "July 25, 2022",
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    Text(
                      "July 25, 2022",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "data",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    height: 16.h,
                    width: 16.w,
                    // child: Image.asset(
                    //   "",
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
