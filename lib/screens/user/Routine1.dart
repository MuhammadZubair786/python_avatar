import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/constants/global.dart';
import 'package:chatbot_app/controllers/RoutineController.dart';
import 'package:chatbot_app/screens/user/Routine.dart';

import '../myroutine.dart';

class Routine1Screen extends StatefulWidget {
  const Routine1Screen({super.key});

  @override
  State<Routine1Screen> createState() => _Routine1ScreenState();
}

class _Routine1ScreenState extends State<Routine1Screen> {
  String? selectedValuer;
  String? selectedValuer2;
  String? selectedValuer3;
  List items2 = [];
  List Maindata = [];
  List item1 = [];

  List LblsList = ["5", "10", "15", "20", "25", "30", "35"];

  int Kcl1 = 0;
  int Kcl2 = 0;
  int Kcl3 = 0;

  var lbs1 = 0;
  var lbs2 = 0;
  var lbs3 = 0;

  int counterR = 1;
  int counter = 1;
  int counterR2 = 1;
  int counter2 = 1;
  int counterR3 = 1;
  int counter3 = 1;

  int MainTotalKcl = 0;

  var checktest = false;

  checkfilldataComplete() {
    var complettest = true;

    for (var i in MainList) {
      if (i["exercise"] == "" ||
          i["lbs"] == 0 ||
          i["kcal"] == 0 ||
          i["tkcal"] == 0) {
        complettest = false;
        checktest = false;
        return false;
      }
    }
    if (complettest) {
      return true;
    }
  }

  calculateVal() {
    var totalkcl = 0;

    for (var i in MainList) {
      totalkcl = totalkcl +
          (int.parse((i["tkcal"].toString())) *
              int.parse(i["lbs"].toString()) *
              int.parse(i["set"].toString()) *
              int.parse(i["reps"].toString()));
    }
    //print(totalkcl);
    MainTotalKcl = totalkcl;
  }

  var MainList = [
    {"exercise": "", "set": 1, "reps": 1, "lbs": 0, "kcal": 0, "tkcal": 0},
  ];

  calcualteAll(index) {
    print("p ${int.parse(MainList[index]["lbs"].toString())}");
    print("p1 ${int.parse(MainList[index]["set"].toString())}");
    print("p2 ${int.parse(MainList[index]["reps"].toString())}");
    print("p3 ${int.parse(MainList[index]["tkcal"].toString())}");

    int lbls = int.parse(MainList[index]["lbs"].toString());
    int set = int.parse(MainList[index]["set"].toString());
    int reps = int.parse(MainList[index]["reps"].toString());
    int kcal = int.parse(MainList[index]["tkcal"].toString());

    var res = lbls * set * reps * kcal;
    print(res);
    MainList[index]["kcal"] = res;

    setState(() {});
  }

  ApiService apiService = ApiService();

  RotineController _routineController = Get.put(RotineController());

  sendAndSaveControllerData() async {
    //print(MainList);

    var data = Get.arguments;

    var makedata = {
      "exercises": MainList,
      "day": data[0].toString(),
      "totalCal": MainTotalKcl
    };

    await _routineController.addRotineData(makedata);

    data[1][data[0]] = true;

    Navigator.pop(context);
    // //print(_routineController.rotinedata);
  }

  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => getExercise());
  }

  dynamic excrcise;

  getExercise() async {
    var data = Get.arguments;
    //print(data[1]);
    var res = await ApiService().getExercises(context);
    if (res['status'] != null) {
      for (var i in res['data']) {
        //print(i["title"]);
        items2.add(i["title"]);
        Maindata.add(i);
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            width: Get.width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Routine",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: MainList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exercise ${index + 1}",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    height: 53.h,
                                    width: 165.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: DropdownButtonFormField2(
                                      // dropdownWidth: 315.w,
                                      dropdownDecoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      buttonPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      icon: Icon(
                                        Icons.arrow_drop_down_circle,
                                        size: 24.h,
                                      ),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        // alignLabelWithHint: true,
                                        // contentPadding:
                                        //     EdgeInsets.symmetric(
                                        //         horizontal: 20.w),
                                        disabledBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                      isExpanded: true,
                                      iconEnabledColor: Colors.black,
                                      buttonWidth: 165.w,
                                      buttonHeight: 53.h,
                                      hint: Text(
                                        'Exercise ${index + 1}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp),
                                      ),
                                      value: selectedValuer2,
                                      onChanged: (value) {
                                        //print(value);
                                        for (var i in Maindata) {
                                          if (i["title"] == value) {
                                            MainList[index]["tkcal"] =
                                                i["kCal"];
                                          }
                                        }

                                        setState(
                                          () {
                                            MainList[index]["exercise"] =
                                                (value as String?)!;
                                          },
                                        );
                                        calcualteAll(index);
                                        calculateVal();
                                      },
                                      items: items2
                                          .map(
                                            (item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Set",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    height: 53.h,
                                    width: 102.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            height: 28.h,
                                            width: 28.w,
                                            decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      if (int.parse(
                                                              MainList[index]
                                                                      ["set"]
                                                                  .toString()) >
                                                          0) {
                                                        MainList[index]
                                                            ["set"] = int.parse(
                                                                MainList[index]
                                                                        ["set"]
                                                                    .toString()) -
                                                            1;
                                                      }
                                                    },
                                                  );
                                                  calcualteAll(index);
                                                  calculateVal();
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            MainList[index]["set"].toString(),
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Container(
                                            height: 28.h,
                                            width: 28.w,
                                            decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  // //print(int.parse(
                                                  //     MainList[index]["set"]
                                                  //         .toString()));
                                                  setState(
                                                    () {
                                                      MainList[index]
                                                          ["set"] = int.parse(
                                                              MainList[index]
                                                                      ["set"]
                                                                  .toString()) +
                                                          1;
                                                    },
                                                  );
                                                  calcualteAll(index);
                                                  calculateVal();
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Reps",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    height: 53.h,
                                    width: 102.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            height: 30.h,
                                            width: 30.w,
                                            decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      if (int.parse(
                                                              MainList[index]
                                                                      ["reps"]
                                                                  .toString()) >
                                                          0) {
                                                        MainList[index][
                                                            "reps"] = int.parse(
                                                                MainList[index]
                                                                        ["reps"]
                                                                    .toString()) -
                                                            1;
                                                      }
                                                    },
                                                  );
                                                  calcualteAll(index);
                                                  calculateVal();
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            MainList[index]["reps"].toString(),
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Container(
                                            height: 28.h,
                                            width: 28.w,
                                            decoration: BoxDecoration(
                                              gradient: kprimary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.r,
                                              ),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 12.sp,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      MainList[index]
                                                          ["reps"] = int.parse(
                                                              MainList[index]
                                                                      ["reps"]
                                                                  .toString()) +
                                                          1;
                                                    },
                                                  );
                                                  calcualteAll(index);
                                                  calculateVal();
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 53.h,
                                width: 165.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: DropdownButtonFormField2(
                                  // dropdownWidth: 315.w,
                                  dropdownDecoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  buttonPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle,
                                    size: 24.h,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                  isExpanded: true,
                                  iconEnabledColor: Colors.black,
                                  buttonWidth: 165.w,
                                  buttonHeight: 53.h,
                                  hint: Text(
                                    'lbs',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.sp),
                                  ),
                                  value: selectedValuer2,
                                  onChanged: (value) {
                                    //print(value);
                                    MainList[index]["lbs"] = value!;
                                    calcualteAll(index);
                                    calculateVal();
                                    print(value);
                                  },
                                  items: LblsList.map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item.toString() + " lbs",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ).toList(),
                                ),
                              ),
                              SizedBox(
                                width: 29.w,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Burned Kcal:",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      MainList[index]["kcal"].toString(),
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 11.h,
                ),
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 56.h,
                  width: 375.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      "Total burned Kcal of routine 1: ${MainTotalKcl}",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    // sendAndSaveControllerData();
                    MainList.add(
                      {
                        "exercise": "",
                        "set": 1,
                        "reps": 1,
                        "lbs": 0,
                        "kcal": 0
                      },
                    );
                    setState(() {});
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
                            "Add More",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    var getresult = checkfilldataComplete();
                    print(getresult);
                    if (getresult == false) {
                      Get.snackbar('Error', "Please Enter All Correct Data",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          colorText: Colors.black);
                    }
                    else{
                      sendAndSaveControllerData();
                    }
                    // 

                    // //print(data[1]);
                    // //print("dldldl");
                    // Navigator.push(context,MaterialPageRoute(builder: ((context) => RoutineScreen(  boolList: data[1]))));

                    // Get.to(()=>RoutineScreen(
                    //    boolList: data[1],
                    // ));
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
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
