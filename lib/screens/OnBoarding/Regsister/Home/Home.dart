// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';

import 'package:chatbot_app/export_all.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  File? imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: grey,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Make Avatar',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //let's add some padding press alt enter
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: 0,
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                        _pageController.jumpToPage(0);
                      },
                    ),
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: 1,
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                        _pageController.jumpToPage(1);
                      },
                    ),
                    StepperComponent(
                      currentIndex: _currentIndex,
                      index: 2,
                      isLast: true,
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                        _pageController.jumpToPage(2);
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                  child: PageView.builder(
                      //only scroll with bubbles
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? SelectImage(_currentIndex)
                            : index == 1
                                ? SelectAudio()
                                : index == 2
                                    ? SelectVideo(index)
                                    : Center(
                                        child: Text('Page ${index}'),
                                      );
                      })),
            ],
          ),
        ));
  }

  Center SelectVideo(index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Select Video',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 3, 67, 76),
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 200.r,
            height: 180.r,
            child: Icon(
              Icons.video_camera_back_outlined,
              size: 100,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.5),
              border: Border.all(
                color: Color.fromARGB(255, 8, 211, 238),
                width: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              // setState(() {
              //   index=index+1;
              // });
              // Get.to(()=>LoginUser());

              // Get.to(() => CustomStepper());
            },
            child: Container(
              width: 356.w,
              height: 65.h,
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
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center SelectAudio() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Select Audio',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 3, 67, 76),
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 200.r,
            height: 180.r,
            child: imageFile == null
                ? Icon(
                    Icons.audio_file,
                    size: 100,
                    color: Colors.white,
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(imageFile!),
                  ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.5),
              border: Border.all(
                color: Color.fromARGB(255, 8, 211, 238),
                width: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                _currentIndex = _currentIndex + 1;
              });
              _pageController.jumpToPage(2);

              // Get.to(()=>LoginUser());

              // Get.to(() => CustomStepper());
            },
            child: Container(
              width: 356.w,
              height: 65.h,
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
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center SelectImage(index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Select Image',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 3, 67, 76),
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 200.r,
            height: 200.r,
            child: imageFile == null
                ? Image(
                    image: AssetImage(
                      "assets/Slicing/Android/drawable-hdpi/Icon awesome-user-alt-1.png",
                    ),
                    width: 90.w,
                    height: 190,
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(imageFile!),
                  ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.5),
              border: Border.all(
                color: Color.fromARGB(255, 8, 211, 238),
                width: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                _currentIndex = _currentIndex + 1;
              });
              _pageController.jumpToPage(1);
            },
            child: Container(
              width: 356.w,
              height: 65.h,
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
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;

  bool isLast;
  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //this is the bubble
                  GestureDetector(
                    // onTap: onTap,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == currentIndex
                            ? Color.fromARGB(255, 242, 242, 243)
                            : Color.fromARGB(255, 7, 173, 195),
                        border: Border.all(
                            color: currentIndex >= index
                                ? Color.fromARGB(255, 2, 90, 59)
                                : Colors.black12),
                      ),
                    ),
                  ),
                  //this the ligne
                  Container(
                    height: 2,
                    //why index+1 we want to turn the ligne orange that precede the active bubble
                      color: currentIndex >= index + 1
                          ? Color.fromARGB(255, 0, 174, 255)
                          : Colors.grey,
                  ),
                ],
              ),
              //index+1 we dont wanna show 0 in the screen since our index will start at 0
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Form ${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //this is the bubble
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: index == currentIndex
                              ? Color.fromARGB(255, 242, 242, 243)
                              : Color.fromARGB(255, 7, 173, 195),
                          border: Border.all(
                              color: currentIndex >= index
                                  ? Color.fromARGB(255, 2, 90, 59)
                                  : Colors.black12),
                        ),
                      ),
                    ),
                    //this the ligne
                    Expanded(
                        child: Container(
                      height: 2,
                      //why index+1 we want to turn the ligne orange that precede the active bubble
                      color: currentIndex >= index + 1
                          ? Color.fromARGB(255, 0, 174, 255)
                          : Colors.grey,
                    )),
                  ],
                ),
                //index+1 we dont wanna show 0 in the screen since our index will start at 0
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Form ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
  }
}
