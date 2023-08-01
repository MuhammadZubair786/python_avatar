import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/screens/user/DietPlan1.dart';

class DietPlanDays extends StatefulWidget {
  var count, day, month, year, tag;

  List<bool>? boolList = [];

  DietPlanDays({this.count, this.day, this.month, this.year, this.tag, this.boolList, Key? key}) : super(key: key);

  @override
  State<DietPlanDays> createState() => _DietPlanDaysState();
}

class _DietPlanDaysState extends State<DietPlanDays> {
  var creaetdDietDay;
  var dayCount;
  @override
  void initState() {
    super.initState();
    print(startDate);
    print(endDate);
  }

  @override
  Widget build(BuildContext context) {
    //print(dietEntries.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Diet Plan",
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
              child: Image(image: AssetImage("assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png")),
            ),
          ),
        ),
      ),
      body: Container(
          width: double.infinity,
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
                  : Column(
                      children: [
                        // Container(
                        //   width: 378.w,
                        //   padding: EdgeInsets.symmetric(vertical: 20.r),
                        //   // height: 194.h,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(10.r),
                        //     ),
                        //     color: Colors.white,
                        //     border: Border.all(color: Color(0xffD2D2D2)),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Stack(children: [
                        //         Container(
                        //           child: CircleAvatar(
                        //             child: Image(image: AssetImage("assets/Slicing/Android/4x/Ellipse -3.png")),
                        //             radius: 40,
                        //           ),
                        //           decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             border: Border.all(
                        //               color: Colors.white,
                        //               width: 2.5,
                        //             ),
                        //           ),
                        //         ),
                        //         Positioned(
                        //           right: -2,
                        //           left: 40,
                        //           top: 50,
                        //           child: RawMaterialButton(
                        //             onPressed: () {},
                        //             elevation: 2.0,
                        //             child: Container(
                        //               child: Image.asset(
                        //                 "assets/Slicing/Android/4x/verify-1.png",
                        //                 scale: 4,
                        //               ),
                        //             ),
                        //             padding: EdgeInsets.all(2),
                        //             shape: CircleBorder(),
                        //           ),
                        //         ),
                        //       ]),
                        //       SizedBox(
                        //         height: 10.h,
                        //       ),
                        //       Text(
                        //         "John Smith",
                        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        //       ),
                        //       Text(
                        //         "Trainer",
                        //         style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                        //       ),
                        //       SizedBox(
                        //         height: 10.h,
                        //       ),
                        //       Text(
                        //         "Diet Plan1",
                        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: 10.h,
                        ),
                        // Get.to(DietPlan1Screen());
                        Column(
                          children: [
                            Container(
                              height: 0.46.sh,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.count,
                                itemBuilder: (context, index) {
                                  dayCount = index + 1;

                                  return GestureDetector(
                                    onTap: () {
                                      var _index = index - 1;
                                      //print(widget.boolList?[_index]);

                                      if (widget.boolList?[_index] == false) {
                                        //print(widget.boolList);

                                        // widget.boolList?[_index] = true;
                                        // setState(() {});

                                        Get.to(
                                          () => DietPlan1Screen(
                                            dayName: "${index}",
                                            ind:index,
                                            count: widget.count,
                                            day: widget.day,
                                            month: widget.month,
                                            year: widget.year,
                                            tag: widget.boolList?[_index],
                                            booList: widget.boolList,
                                          ),
                                        );
                                      } else {
                                        Get.snackbar("you have already created a diet", "");
                                      }
                                    },
                                    //  i have list of count now i want to ensure that if user skip the count value
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
                                                  "",
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
                                                      "",
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
                                                      "",
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
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                //print("dasdasdsad${widget.boolList}");
                                if (widget.boolList!.every((element) => element == true)) {
                                  //print('All values are false.');
                                  if (dietEntries.isNotEmpty) {
// pending

// data for instructor
                                    var instructorDietData = {
                                      "creatorType": "Customer",
                                      "createdFor": dietRequestUserId.toString(),
                                      "startDate": "$startDate",
                                      "endDate": "$endDate",
                                      "dietEntries": dietEntries,
                                    };

// data for user
                                    var userdieData = {
                                      "startDate": "$startDate",
                                      "endDate": "$endDate",
                                      "dietEntries": dietEntries,
                                    };

                                    if (userType == "Instructor") {
                                      print(instructorDietData);
                                      ApiService().createDiet(context, instructorDietData);
                                    } else {
                                      print(userdieData);

                                      ApiService().createDiet(context, userdieData);
                                    }
                                    // startDate = "";
                                    // endDate = "";
                                  } else {
                                    Get.snackbar("You have not seleted any day", "");
                                  }
                                } else {
                                  Get.snackbar("Create meal first", "");
                                }
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
                                        "Create Diet",
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
                        )
                      ],
                    );
            },
          )),
    );
  }
}

//  Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.count,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Day2(widget.count, widget.startDate);
//                 },
//               ),
//             )

//             // Container(
//             //   width: 378.w,
//             //   height: 87.h,
//             //   decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.all(
//             //       Radius.circular(10),
//             //     ),
//             //     color: Colors.white,
//             //     border: Border.all(color: Color(0xffD2D2D2)),
//             //   ),
//             //   child: Padding(
//             //     padding: EdgeInsets.symmetric(
//             //       horizontal: 30.w,
//             //     ),
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: [
//             //         Column(
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: [
//             //             Text(
//             //               "Day 1",
//             //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             //             ),
//             //             Text(
//             //               "Meal 1",
//             //               style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
//             //             ),
//             //           ],
//             //         ),
//             //         SizedBox(
//             //           height: 10.h,
//             //         ),
//             //         Row(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               mainAxisAlignment: MainAxisAlignment.center,
//             //               children: [
//             //                 Text(
//             //                   "Monday",
//             //                   style: TextStyle(color: Color(0xFF000000)),
//             //                 ),
//             //                 Text(
//             //                   "July 25, 2022",
//             //                   style: TextStyle(color: Colors.black),
//             //                 ),
//             //                 Text(
//             //                   "data",
//             //                   style: TextStyle(color: Colors.black),
//             //                 ),
//             //               ],
//             //             ),
//             //             Padding(
//             //               padding: const EdgeInsets.only(top: 12),
//             //               child: Container(
//             //                 height: 16.h,
//             //                 width: 16.w,
//             //                 child: Image.asset(
//             //                   "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
//             //                 ),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: 15.h,
//             // ),
//             // Container(
//             //   width: 378.w,
//             //   height: 87.h,
//             //   decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.all(
//             //       Radius.circular(10),
//             //     ),
//             //     color: Colors.white,
//             //     border: Border.all(color: Color(0xffD2D2D2)),
//             //   ),
//             //   child: Padding(
//             //     padding: EdgeInsets.symmetric(
//             //       horizontal: 30.w,
//             //     ),
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: [
//             //         Column(
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: [
//             //             Text(
//             //               "Day 1",
//             //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             //             ),
//             //             Text(
//             //               "Meal 1",
//             //               style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
//             //             ),
//             //           ],
//             //         ),
//             //         SizedBox(
//             //           height: 10.h,
//             //         ),
//             //         Row(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               mainAxisAlignment: MainAxisAlignment.center,
//             //               children: [
//             //                 Text(
//             //                   "Monday",
//             //                   style: TextStyle(color: Color(0xFF000000)),
//             //                 ),
//             //                 Text(
//             //                   "July 25, 2022",
//             //                   style: TextStyle(color: Colors.black),
//             //                 ),
//             //                 Text(
//             //                   "data",
//             //                   style: TextStyle(color: Colors.black),
//             //                 ),
//             //               ],
//             //             ),
//             //             Padding(
//             //               padding: const EdgeInsets.only(top: 12),
//             //               child: Container(
//             //                 height: 16.h,
//             //                 width: 16.w,
//             //                 child: Image.asset(
//             //                   "assets/Slicing/Android/4x/Icon awesome-check-circle-5.png",
//             //                 ),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),

//             // SizedBox(height: 15.h),
//             // Day2(),
//             // SizedBox(height: 15.h),
//             // Day2(),
//             // SizedBox(height: 15.h),
//             // Day2(),
//             // SizedBox(height: 15.h),
//             // Day2(),
//             // SizedBox(height: 15.h),
//             // Day2(),
//             // SizedBox(height: 15.h),
//             // Day2(),
//           ],
//         )

Day2(
  dayName,
  date,
  count,
) {}
