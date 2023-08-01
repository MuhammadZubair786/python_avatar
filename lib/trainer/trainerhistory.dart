import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

class TrainerHistoryScreen extends StatefulWidget {
  const TrainerHistoryScreen({super.key});

  @override
  State<TrainerHistoryScreen> createState() => _TrainerHistoryScreenState();
}

class _TrainerHistoryScreenState extends State<TrainerHistoryScreen> {
  var _iconColor = Color(0xff333333);
  var _iconColor1 = Color(0xff333333);
  var _iconColor2 = Color(0xff333333);
  double _height = 1;
  double _height1 = 1;
  double _height2 = 1;
  var _selectedButton = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "History",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image(
                  image: AssetImage(
                      "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png")),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 315.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      buttonPadding: EdgeInsets.all(0),
                      children: [
                        TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(0)),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedButton = 2;
                                _iconColor = Colors.grey;
                                _iconColor1 = bprimary;
                                _iconColor2 = Colors.grey;
                                _height = _selectedButton == 1 ? 1 : 1;
                                _height1 = _selectedButton == 2 ? 5 : 1;
                                _height2 = _selectedButton == 3 ? 1 : 1;
                              });
                            },
                            child: Column(children: [
                              Text(
                                'Diet',
                                style: TextStyle(color: _iconColor1),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: 78,
                                height: _height1,
                                color: _iconColor1,
                              )
                            ])),
                        TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(0)),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedButton = 3;
                                _iconColor = Colors.grey;
                                _iconColor1 = Colors.grey;
                                _iconColor2 = bprimary;
                                _height = _selectedButton == 1 ? 1 : 1;
                                _height1 = _selectedButton == 2 ? 1 : 1;
                                _height2 = _selectedButton == 3 ? 5 : 1;
                              });
                            },
                            child: Column(children: [
                              Text(
                                'Month',
                                style: TextStyle(color: _iconColor2),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: 78,
                                height: _height2,
                                color: _iconColor2,
                              )
                            ]))
                      ],
                    ),
                  ],
                ),
              ),
              _selectedButton == 2
                  ? Container(
                      width: 378.w,
                      height: 762.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 23,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Jan 01 - Jan 07",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12.w,
                                        height: 14.h,
                                        child: Image.asset(
                                            "assets/Slicing/Android/4x/Icon metro-fire.png"),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "855 Kcal",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "7 Workout",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12.w,
                                        height: 14.h,
                                        child: Image.asset(
                                            "assets/Slicing/Android/4x/Icon metro-home.png"),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "2h 13min",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(0),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(1),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(2),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(3),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(4),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(5),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(6),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day1(7),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 378.w,
                      height: 762.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 23,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Day2(),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Day1(ind) {
  return Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  height: 16.h,
                  width: 16.w,
                  child: Image.asset(
                    "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Day2() {
  return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jan 01 - Jan 30",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "7 Workout",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              Text(
                "John Smith",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              Text(
                "Monthly Routine Plan",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
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
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  height: 16.h,
                  width: 16.w,
                  child: Image.asset(
                    "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
