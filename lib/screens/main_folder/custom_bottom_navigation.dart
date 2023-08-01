import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/constants/global.dart';
import 'package:chatbot_app/controllers/bottom_controller.dart';
import 'package:chatbot_app/controllers/global_controller.dart';
import 'package:chatbot_app/screens/user/EditMyProfile.dart';

import '../user/CreateNewPost.dart';
import '../home_screen.dart';
import '../user/MyProfile.dart';
import '../user/Settings.dart';
import '../myroutine.dart';
import 'drawer.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  final bt = Get.put(BottomController());

  final globalController = Get.put(GlobalController());
  dynamic screens = [
    {
      'title': "Home",
      'page': HomeScreen(),
    },
    {
      'title': "My Routine",
      'page': MyRoutineScreen(),
    },
    {
      'title': "NO",
      'page': CreateNewPostScreen(),
    },
    {
      'title': "Setting",
      'page': SettingsScreen(),
    },
    {
      'title': 'My Profile',
      'page': MyProfileScreen(),
    },
  ];

  void _onItemTaapped(int index) {
    bt.navBarChange(index);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext cont) {
    return GetBuilder<BottomController>(builder: (context) {
      return WillPopScope(
        onWillPop: () async {
         return await showDialog(
          context: cont,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('No'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              ElevatedButton(
                child: Text('Yes'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
      
      },
        child: Scaffold(
          key: _key,
          drawer: screens[bt.navigationBarIndexValue]['title'] != "NO" ? DrawerScreen() : null,
          backgroundColor: Colors.white,
          appBar: screens[bt.navigationBarIndexValue]['title'] != "NO"
              ? AppBar(
                  title: Text(
                    "${screens[bt.navigationBarIndexValue]['title']}",
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  leading: GestureDetector(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image(
                        image: AssetImage("assets/Slicing/Android/drawable-hdpi/Icon feather-menu.png"),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: bt.navigationBarIndexValue != 4
                          ? GestureDetector(
                              onTap: () {
                                Get.toNamed("/NotificationsScreen");
                              },
                              child: Image.asset("assets/Slicing/Android/drawable-hdpi/Icon ionic-ios-notifications-2.png"),
                            )
                          : GestureDetector(
                              onTap: () {
                                // Get.toNamed('/EditMyProfileScreen');
      
                                Get.to(() => EditMyProfileScreen(certificatesPaths: globalController.listImagePath));
                              },
                              child: Icon(
                                Icons.create_rounded,
                                size: 20,
                                color: Color(0xffFD6839),
                              ),
                            ),
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )
              : null,
          body: screens[bt.navigationBarIndexValue]['page'],
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            width: 70.0,
            height: 70.0,
            child: Transform.rotate(
              angle: -1.57,
              child: ClipPolygon(
                sides: 6,
                borderRadius: 5.0, // Defaults to 0.0 degrees
                rotate: 90.0, // Defaults to 0.0 degrees
                boxShadows: [PolygonBoxShadow(color: Colors.black, elevation: 1.0), PolygonBoxShadow(color: Colors.black, elevation: 5.0)],
                child: FloatingActionButton(
                    shape: StadiumBorder(),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, gradient: kprimary),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 32,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // bt.navBarChange(2);
                            Get.to(CreateNewPostScreen());
                          },
                        ),
                      ),
                    ),
                    onPressed: () {
                      // bt.navBarChange(2);
      
                      // bt.navBarChange(2);
                    }),
              ),
            ),
          ),
          bottomNavigationBar: GetBuilder<BottomController>(
            builder: (_) => Card(
              color: Colors.transparent,
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r), bottomLeft: Radius.circular(35.r), bottomRight: Radius.circular(35.r)),
                child: BottomAppBar(
                  child: Container(
                    height: 73.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff00000033).withOpacity(0.5),
                            spreadRadius: 50,
                            blurRadius: 50,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                        // color: Color(0xffFFFFFF),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _onItemTaapped(0);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/Slicing/Android/4x/Icon awesome-home-1.png",
                                  scale: 4,
                                  color: bt.navigationBarIndexValue == 0 ? Colors.orange : Colors.grey,
                                ),
                                Text(
                                  'Home'.toUpperCase(),
                                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          5.horizontalSpace,
                          InkWell(
                            onTap: () {
                              _onItemTaapped(1);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/Slicing/Android/4x/Group 241.png",
                                  scale: 4,
                                  color: bt.navigationBarIndexValue == 1 ? Colors.orange : Colors.grey,
                                ),
                                Text(
                                  'To routine'.toUpperCase(),
                                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          90.horizontalSpace,
                          InkWell(
                            onTap: () {
                              _onItemTaapped(3);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/Slicing/Android/4x/Icon ionic-ios-settings-1.png",
                                  scale: 4,
                                  color: bt.navigationBarIndexValue == 3 ? Colors.orange : Colors.grey,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          5.horizontalSpace,
                          InkWell(
                            onTap: () {
                              _onItemTaapped(4);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/Slicing/Android/4x/Icon awesome-user-alt-3.png",
                                  scale: 4,
                                  color: bt.navigationBarIndexValue == 4 ? Colors.orange : Colors.grey,
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
