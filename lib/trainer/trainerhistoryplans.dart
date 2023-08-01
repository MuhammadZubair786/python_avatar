import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';

class trainerhistoryplans extends StatefulWidget {
  const trainerhistoryplans({super.key});

  @override
  State<trainerhistoryplans> createState() => _trainerhistoryplansState();
}

class _trainerhistoryplansState extends State<trainerhistoryplans> {
  bool Saved = true;
  bool cusplans = false;
  var _iconColor = Color(0xff333333);
  var _iconColor1 = Color(0xff333333);
  var _iconColor2 = Color(0xff333333);
  double _height = 1;
  double _height1 = 1;
  double _height2 = 1;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        Saved = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'My Plans',
                          style: TextStyle(
                              fontSize: 15,
                              color: Saved ? bprimary : Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 165.w,
                          height: 5.h,
                          color: Saved ? bprimary : Colors.grey,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        Saved = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Customer Plans',
                          style: TextStyle(
                              fontSize: 15,
                              color: !Saved ? bprimary : Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 165.w,
                          height: 5.h,
                          color: !Saved ? bprimary : Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Saved == true
                  ? Column(children: [
                      myplan(),
                      SizedBox(
                        height: Get.height * 0.0125,
                      ),
                    ])
                  : Column(
                      children: [
                        cusplan(),
                        SizedBox(
                          height: Get.height * 0.0125,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

cusplan() {
  return Column(
    children: [
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 23,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 29.h,
              ),
              Container(
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.white,
                  border: Border.all(color: Color(0xffD4D4D4)),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color(0xffFD6839),
                    ),
                    contentPadding: EdgeInsets.all(16),
                    hintText: "Search by name...",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 15.sp),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
              SizedBox(
                height: 10.h,
              ),
              Cus(),
            ],
          ),
        ),
      ),
    ],
  );
}

Cus() {
  return Container(
    width: 378.w,
    height: 128.h,
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
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
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ],
            ),
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
                  Text(
                    "04:00 PM",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "\$50.00",
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

myplan() {
  return Column(
    children: [
      SizedBox(
        height: 29.h,
      ),
      Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jan 01 - Jan 07",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                              fontWeight: FontWeight.normal, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "7 Workout",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
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
                              fontWeight: FontWeight.normal, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
                SizedBox(
                  height: 10.h,
                ),
                Day1(),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
