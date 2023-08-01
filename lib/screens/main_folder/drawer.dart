import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/controllers/bottom_controller.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/trainer/CreateCustomerPlans.dart';

import 'custom_bottom_navigation.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final bottomctrl = Get.put(BottomController());

void initState(){
  super.initState();
  // //print('https://gymsta-api.jumppace.com:9000/' + userImage);
}

  @override
  Widget build(BuildContext context) {
    return Container(
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
                : Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 870.h,
                          height: 866.h,
                          width: 368.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.r),
                              bottomRight: Radius.circular(50.r),
                            ),
                          ),
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 28.w),
                                child: Row(
                                  children: [
                                    // Container(
                                    //   width: 126.w,
                                    //   height: 126.h,
                                    //   decoration: BoxDecoration(
                                    //     image: DecorationImage(image: NetworkImage('https://gymsta-api.jumppace.com:9000/' + userImage)),
                                    //     shape: BoxShape.circle,
                                    //     border: Border.all(color: bprimary, width: 3.w),
                                    //   ),
                                    // ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              username,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 49.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed('/EditMyProfileScreen');
                                              },
                                              child: Icon(
                                                Icons.create_rounded,
                                                size: 15,
                                                color: Color(0xffFD6839),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: 10.w,
                                        //     ),
                                        //     Text(
                                        //       'martin@email.com',
                                        //       style: TextStyle(
                                        //         fontSize: 13.sp,
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // if (bottomctrl.navigationBarIndexValue != 0) {
                                      //   bottomctrl.navBarChange(0);
                                      // } else {
                                      //   Get.back();
                                      // }
                                      bottomctrl.navBarChange(0);
                                      Get.to(CustomBottomNavigation());
                                      Get.back();
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Icon awesome-home.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Home",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // if (bottomctrl.navigationBarIndexValue != 1) {
                                      //   bottomctrl.navBarChange(1);
                                      // } else {
                                      //   Get.back();
                                      // }
                                      bottomctrl.navBarChange(1);
                                      Get.close(1);
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Group -2.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "My Routine",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              userType == "Instructor"
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Get.toNamed('/CreateCustomerPlansScreen');
                                            Get.to(() => CreateCustomerPlansScreen());
                                          },
                                          child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 37.w),
                                              child: Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                      'assets/Slicing/Android/4x/Group -3.png',
                                                    ),
                                                    color: bprimary,
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Text(
                                                    "Create Customer Plans",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        div(),
                                      ],
                                    )
                                  : Container(),

                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/RequestFollower');
                                            // Get.to(()=>) CustomerRequestsScreen
                                          },
                                          child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 37.w),
                                              child: Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage(
                                                      'assets/Slicing/Android/4x/Icon awesome-users.png',
                                                    ),
                                                    color: bprimary,
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Text(
                                                    "Follower Request",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        div(),
                                      ],
                                    ),
                                  
                              // userType == "Instructor"
                              //     ? Column(
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //           // GestureDetector(
                              //           //   onTap: () {
                              //           //     Get.toNamed('/CustomerRequestsScreen');
                              //           //     // Get.to(()=>) CustomerRequestsScreen
                              //           //   },
                              //           //   child: Container(
                              //           //     child: Padding(
                              //           //       padding: EdgeInsets.only(left: 37.w),
                              //           //       child: Row(
                              //           //         children: [
                              //           //           ImageIcon(
                              //           //             AssetImage(
                              //           //               'assets/Slicing/Android/4x/Icon awesome-users.png',
                              //           //             ),
                              //           //             color: bprimary,
                              //           //             size: 15,
                              //           //           ),
                              //           //           SizedBox(
                              //           //             width: 8.w,
                              //           //           ),
                              //           //           // Text(
                              //           //           //   "Customer Requests",
                              //           //           //   style: TextStyle(
                              //           //           //     color: Colors.black,
                              //           //           //     fontSize: 15.sp,
                              //           //           //     fontWeight: FontWeight.w500,
                              //           //           //   ),
                              //           //           // )
                              //           //         ],
                              //           //       ),
                              //           //     ),
                              //           //   ),
                              //           // ),
                              //           div(),
                              //         ],
                              //       )
                              //     : Container(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/ChatScreen');

                                      // Get.to(() => DateGet());
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Icon material-message.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Messages",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         Get.toNamed('/ReportDietPlan');
                              //       },
                              //       child: Container(
                              //         child: Padding(
                              //           padding: EdgeInsets.only(left: 37.w),
                              //           child: Row(
                              //             children: [
                              //               ImageIcon(
                              //                 AssetImage(
                              //                   'assets/Slicing/Android/4x/Group -3.png',
                              //                 ),
                              //                 color: bprimary,
                              //                 size: 15,
                              //               ),
                              //               SizedBox(
                              //                 width: 8.w,
                              //               ),
                              //               // Text(
                              //               //   "Diet Plan Reports",
                              //               //   style: TextStyle(
                              //               //     color: Colors.black,
                              //               //     fontSize: 15.sp,
                              //               //     fontWeight: FontWeight.w500,
                              //               //   ),
                              //               // )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     div(),
                              //   ],
                              // ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         Get.toNamed('/NutritionalReportTrackingScreen');
                              //       },
                              //       child: Container(
                              //         child: Padding(
                              //           padding: EdgeInsets.only(left: 37.w),
                              //           child: Row(
                              //             children: [
                              //               ImageIcon(
                              //                 AssetImage(
                              //                   'assets/Slicing/Android/4x/Group -3.png',
                              //                 ),
                              //                 color: bprimary,
                              //                 size: 15,
                              //               ),
                              //               SizedBox(
                              //                 width: 8.w,
                              //               ),
                              //               Text(
                              //                 "Nutritional Tracking Reports",
                              //                 style: TextStyle(
                              //                   color: Colors.black,
                              //                   fontSize: 15.sp,
                              //                   fontWeight: FontWeight.w500,
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     div(),
                              //   ],
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/ReportRoutinePlanScreen');
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Group -3.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Reports",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      userType == "Instructor" ? Get.toNamed('/trainerhistoryplans') : Get.toNamed('/HistoryScreen');
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Icon awesome-history.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "History",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // if (bottomctrl.navigationBarIndexValue != 3) {
                                      //   bottomctrl.navBarChange(3);
                                      // } else {
                                      //   Get.back();
                                      // }
                                      bottomctrl.navBarChange(3);
                                      Get.close(1);
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Icon ionic-ios-settings.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Settings",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/NotificationsScreen');
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Icon ionic-ios-notifications.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Notifications",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // sdasdsadasdasdassd

                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      userType == "Instructor" ? Get.toNamed('/SubscriptionScreen') : Get.toNamed('/SubscriptionUserScreen');
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Icon material-subscriptions.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Subscriptions",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/TermsAndConditionsScreen');
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/ic_description_-1.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Terms & Conditions",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  div(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/PrivacyPolicyScreen');
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 37.w),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                'assets/Slicing/Android/4x/Group -3.png',
                                              ),
                                              color: bprimary,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "Privacy Policy",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 45.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 38.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ApiService().logOutApi(context);
                                      },
                                      child: Container(
                                        width: 192.w,
                                        height: 56.h,
                                        decoration: BoxDecoration(
                                          gradient: kprimary,

                                          // border: Border.all(color: Colors.white, width: 3.sp),
                                          borderRadius: BorderRadius.circular(50.r),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Logout",
                                            style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              50.verticalSpace
                            ],
                          )),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }

  div() {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Container(
          width: Get.width,
          height: 0.8.h,
          color: Colors.grey,
        ),
        SizedBox(
          height: 13.27.h,
        ),
      ],
    );
  }
}
