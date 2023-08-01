import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/screens/user/DeitHistory.dart';
import 'package:chatbot_app/screens/user/RoutineHistory.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var _iconColor = Color(0xff333333);
  var _iconColor1 = bprimary;
  var _iconColor2 = Color(0xff333333);
  var _iconColor3 = Color(0xff333333);
  double _height = 1;
  double _height1 = 1;
  double _height2 = 1;
  double _height3 = 1;

  var _selectedButton = 1;
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
                width: 415.w,
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
                                _selectedButton = 1;
                                _iconColor1 = bprimary;
                                _iconColor2 = Colors.grey;
                                _iconColor3 = Colors.grey;
                              });
                            },
                            child: Column(children: [
                              Text(
                                'Deit',
                                style:
                                    TextStyle(color: _iconColor1, fontSize: 16),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
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
                                _selectedButton = 2;
                                _iconColor = Colors.grey;
                                _iconColor1 = Colors.grey;
                                _iconColor2 = bprimary;
                                _iconColor3 = Colors.grey;
                              });
                            },
                            child: Column(children: [
                              Text(
                                'Routine',
                                style:
                                    TextStyle(color: _iconColor2, fontSize: 16),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: _height2,
                                color: _iconColor2,
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
                                _iconColor2 = Colors.grey;
                                _iconColor3 = bprimary;
                              });
                            },
                            child: Column(children: [
                              Text(
                                'Nutritional',
                                style:
                                    TextStyle(color: _iconColor3, fontSize: 16),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: _height1,
                                color: _iconColor3,
                              )
                            ])),
                      ],
                    ),
                  ],
                ),
              ),
              _selectedButton == 1
                  ? DeitHistory()
                  : _selectedButton == 2
                      ? RoutineHistory()
                      : Text("Nurtients"),
            ],
          ),
        ),
      ),
    );
  }
}

Day1() {
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
                "",
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
