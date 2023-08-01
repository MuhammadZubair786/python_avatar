import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../constants/accordion.dart';

class NutritionalReportTrackingScreen extends StatefulWidget {
  const NutritionalReportTrackingScreen({super.key});

  @override
  State<NutritionalReportTrackingScreen> createState() =>
      _NutritionalReportTrackingScreenState();
}

var _iconColor = Color(0xff333333);
var _iconColor1 = Color(0xff333333);
var _iconColor2 = Color(0xff333333);
double _height = 1;
double _height1 = 1;
double _height2 = 1;
var _selectedButton = 1;
List items = [
  {'item': 'Chicken', 'Quatity': 4},
  {'item': 'Carrots', 'Quatity': 7},
  {'item': 'Rice Bowl', 'Quatity': 3},
  {'item': 'Burned Kcal', 'Quatity': 37},
];
List weeklyList = [
  Accordion(title: 'Week 1', content: items),
  Accordion(title: 'Week 2', content: items),
  Accordion(title: 'Week 3', content: items),
  Accordion(title: 'Week 4', content: items),
];
List monthlyList = [
  Accordion(title: 'Month January 2022 ', content: items),
  Accordion(title: 'Month February 2022', content: items),
  Accordion(title: 'Month March 2022', content: items),
  Accordion(title: 'Month April 2022', content: items),
  Accordion(title: 'Month May 2022', content: items),
  Accordion(title: 'Month June 2022', content: items),
  Accordion(title: 'Month July 2022', content: items),
];
List yearlyList = [
  Accordion(title: '2022 ', content: items),
  Accordion(title: '2021', content: items),
  Accordion(title: '2020', content: items),
  Accordion(title: '2019', content: items),
];

class _NutritionalReportTrackingScreenState
    extends State<NutritionalReportTrackingScreen> {
  var _selectedButton = 1;
  @override
  Widget build(BuildContext context) {
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
            width: Get.height * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Reports Nutritional Tracking",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
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
                          _iconColor = bprimary;
                          _iconColor1 = Colors.grey;
                          _iconColor2 = Colors.grey;
                          _height = _selectedButton == 1 ? 5 : 1;
                          _height1 = _selectedButton == 2 ? 1 : 1;
                          _height2 = _selectedButton == 3 ? 1 : 1;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            'Weekly ',
                            style: TextStyle(color: _iconColor),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: Get.width * 0.3,
                            height: _selectedButton == 1 ? 5 : _height,
                            color: _selectedButton == 1 ? bprimary : _iconColor,
                          )
                        ]),
                      )),
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
                      child: Container(
                        width: Get.width * 0.3,
                        child: Column(children: [
                          Text(
                            'Monthly',
                            style: TextStyle(color: _iconColor1),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: Get.width * 0.3,
                            height: _height1,
                            color: _iconColor1,
                          )
                        ]),
                      )),
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
                      child: Container(
                        width: Get.width * 0.3,
                        child: Column(children: [
                          Text(
                            'Yearly',
                            style: TextStyle(color: _iconColor2),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            width: Get.width * 0.3,
                            height: _height2,
                            color: _iconColor2,
                          )
                        ]),
                      ))
                ],
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: weeklyList.length,
            itemBuilder: (context, index) => _selectedButton == 1
                ? Column(
                    children: [weeklyList[index], 20.verticalSpace],
                  )
                : _selectedButton == 2
                    ? Column(
                        children: [monthlyList[index], 20.verticalSpace],
                      )
                    : Column(
                        children: [yearlyList[index], 20.verticalSpace],
                      ),
          )
        ],
      ),
    );
  }
}
