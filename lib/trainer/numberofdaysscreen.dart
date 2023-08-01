import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:intl/intl.dart';

import '../screens/user/DietPlan1.dart';

class NumberOfdaysforDiet extends StatefulWidget {
  final userName;
  final userType;
  var count, day, month, year, tag, datetime;
  NumberOfdaysforDiet({
    this.userName,
    this.userType,
    this.count,
    this.day,
    this.month,
    this.year,
    this.datetime,
    super.key,
  });

  @override
  State<NumberOfdaysforDiet> createState() => _NumberOfdaysforDietState();
}

class _NumberOfdaysforDietState extends State<NumberOfdaysforDiet> {
  var creaetdDietDay;
  var dayCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Diet Plan",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 378.w,
                padding: EdgeInsets.symmetric(vertical: 20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD2D2D2)),
                ),
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        child: CircleAvatar(
                          child: Image(image: AssetImage("assets/Slicing/Android/4x/Ellipse -3.png")),
                          radius: 40,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.5,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -2,
                        left: 40,
                        top: 50,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          child: Container(
                            child: Image.asset(
                              "assets/Slicing/Android/4x/verify-1.png",
                              scale: 4,
                            ),
                          ),
                          padding: EdgeInsets.all(2),
                          shape: CircleBorder(),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      widget.userName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.userType,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Diet Plan1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.count,
                    itemBuilder: (BuildContext, index) {
                      dayCount = index + 1;
                      String formateddate = widget.datetime.toString();
                      DateTime now = DateTime.parse(formateddate);
                      formateddate = DateFormat('EEEE').format(now);
                      //print("Faiz + ${formateddate}");
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => DietPlan1Screen());
                            },
                            child: Container(
                              width: 378.w,
                              height: 87.h,
                              margin: EdgeInsets.all(8),
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
                                          "Day $dayCount",
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
                                              "${widget.day + index++}",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                            // Text(
                                            //   "July 25, 2022",
                                            //   style: TextStyle(color: Colors.black),
                                            // ),
                                            Text(
                                              "${widget.year}-${widget.month}-${widget.day + index++}",
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
                          ),
                        ],
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
