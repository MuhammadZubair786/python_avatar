// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/screens/OnBoarding/Regsister/SignUp.dart';
import 'package:chatbot_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 1;
  int _currentPage = 0;

  List<String> _titles = ["Welcome", "Explore Features", "Get Started!"];

  List<String> _descriptions = [
    // "your or any celebrity's avatar (image and video).\nvoice cloning.\nreal time smart conversation.Form clever avatars for self or idols.",
    // "I'm your AI-powered avatar, enabling seamless chat, voice calls, and video conversations. Whether you need instant messaging or face-to-face interaction",
    // "I'm here to facilitate smooth and engaging communication. Let's get started on this exciting journey together!"
    "your or any celebrity's avatar (image and video).",
    "voice cloning.",
    "real time smart conversation",
    "Form clever avatars for self or idols."
  ];

  List<String> _imageList = [
    "https://i.pinimg.com/originals/03/e4/a7/03e4a717333764ff77d52848deccf625.gif",
    "assets/Slicing/Android/drawable-hdpi/Splash_2.png",
    "assets/Slicing/Android/drawable-hdpi/Splash-1.png",
  ];

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? bprimary : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),

            Expanded(
              child: PageView.builder(
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _numPages,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/Slicing/Android/drawable-hdpi/logo-5.jpg",
                            ),
                          ),
                        ),
                      ),
                      _buildPage(index),
                    ],
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: List.generate(
            //       _numPages,
            //       (index) => _buildPageIndicator(index == _currentPage),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.1),

          Text(
            _titles[index],
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 3, 67, 76)
                ),
          ),
          SizedBox(height: 42),

          // Image.network(
          //   _imageList[index],
          //   height: 200,
          // ),
          // SizedBox(height: 22),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                _descriptions[index],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 246, 246)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                _descriptions[1],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                                     color: Color.fromARGB(255, 247, 246, 246)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                _descriptions[2],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 247, 246, 246),
),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                _descriptions[3],
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 247, 246, 246)),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),

            SizedBox(height:MediaQuery.of(context).size.height*0.2),

          GestureDetector(
            onTap: () {
              Get.to(() => SignUpUser());
            },
            child: Card(
              elevation: 30,
              color: grey,
              child: Container(
                // margin: EdgeInsets.all(27),
                width: 284.w,
                height: 70.h,
                decoration: BoxDecoration(
                  // gradient: kprimary,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 253, 252, 254).withOpacity(0.5),
                      // spreadRadius: 5,
                      // blurRadius: 0,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  border: Border.all(color: bprimary, width: 0.6.sp),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 67, 76), fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                         shadows: [
              // Shadow(
              //   color: Color.fromARGB(255, 6, 140, 140),
              //   offset: Offset(1,1),
              //   blurRadius:6,
              // ),
            ],
                        ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
