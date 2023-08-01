import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/screens/main_folder/custom_bottom_navigation.dart';
import 'package:chatbot_app/screens/search_screen.dart';
import 'package:chatbot_app/widgets/homesFeedList.dart';
import 'package:chatbot_app/widgets/videoPlayer.dart';

import '../../../screens/main_folder/drawer.dart';
import '../../constants/global.dart';
import 'package:path/path.dart' as p;

import '../../Api.dart';
import '../../controllers/bottom_controller.dart';

class TrainerProfileScreen extends StatefulWidget {
  final data;
  const TrainerProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  State<TrainerProfileScreen> createState() => _TrainerProfileScreenState();
}

class _TrainerProfileScreenState extends State<TrainerProfileScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final bottomctrl = Get.put(BottomController());
  // List dietEntries = [];

  String? selectedValuemT1;

  void initState() {
    super.initState();
    dropdownValue();
  }

  List dropvalue = [];

  dropdownValue() {
    print(widget.data["diet"]);
    widget.data["diet"] == false || widget.data["diet"] == "rejected" ? dropvalue.add("Diet") : null;
    widget.data["nutrition"] == false || widget.data["nutrition"] == "rejected"  ? dropvalue.add("Nutrition") : null;
    widget.data["routine"] == false || widget.data["routine"] == "rejected"  ? dropvalue.add("Routine") : null;

    //print("data");
    //print(dropvalue);
  }

  SendREQUEST() async {
    var data = {
      "receiverType": widget.data["userType"].toString(),
      "receiverID": widget.data["_id"].toString(),
      "requestType": selectedValuemT1,
    };
    //print(data);

    var getdata = await ApiService().SendRequest(data, context);
    
    bottomctrl.navBarChange(0);
    Get.offAll(() => CustomBottomNavigation());
  }

  @override
  Widget build(BuildContext context) {
    //print(dietEntries);
    return Scaffold(
      key: _key,
      drawer: DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.data["fullName"],
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // _key.currentState!.openDrawer();
            Navigator.pop(context);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.arrow_back_ios,
                color: bprimary,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: GestureDetector(
              onTap: () {
                Get.toNamed("/NotificationsScreen");
              },
              child: Image.asset(
                  "assets/Slicing/Android/drawable-hdpi/Icon ionic-ios-notifications-2.png"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        children: [
          SizedBox(height: 40.h),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 137.w,
                  height: 137.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.r,
                        color: Color(0xffFD6839),
                      ),
                      image: widget.data['image'].isEmpty
                          ? DecorationImage(
                              image: AssetImage(
                                'assets/Slicing/Android/4x/Ellipse -2.png',
                              ),
                              fit: BoxFit.fill)
                          : DecorationImage(
                              image: NetworkImage(
                                  'https://gymsta-api.jumppace.com:9000/' +
                                      widget.data['image']['file']),
                            )),
                ),
                Positioned(
                  bottom: 0,
                  right: -16,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    // fillColor: Colors.orange,
                    child: Container(
                      child: Image.asset(
                        "assets/Slicing/Android/4x/verify-1.png",
                        scale: 2,
                      ),
                    ),

                    padding: EdgeInsets.all(2),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.data["fullName"],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.data["userType"],
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.white,
              border: Border.all(color: Color(0xffD2D2D2)),
            ),
            // height: 67.h,
            padding: EdgeInsets.symmetric(vertical: 10.r),
            width: 378.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      widget.data['post'].length.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Post",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.grey[300],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      //   widget.data["follower"].toString(),
                      widget.data['follower'].length.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.grey[300],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      // widget.data["following"].toString(),
                      widget.data['following'].length.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          widget.data["follow"] == "accepted"
              ? Row(children: [
                  Container(
                    height: 53.h,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                      buttonWidth: 20,
                      buttonHeight: 53.h,
                      hint: Text(
                        'Select Plan',
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                      value: selectedValuemT1,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedValuemT1 = value as String?;
                          },
                        );
                      },
                      items: dropvalue
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.grey),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      SendREQUEST();
                    },
                    child: Container(
                      width: 55.w,
                      height: 30.w,
                      child: Icon(
                        Icons.add_box_rounded,
                        color: Colors.orange,
                        size: 25,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      // SendREQUEST();
                      print(widget.data);

                      var data ={"receiverId":widget.data["_id"]};

                      var res =await  ApiService().createConservation(data);
                      print(res["data"]);
                      Get.toNamed("/MessagesScreeen",arguments: [
                        res["data"]
              ]);
                    },
                    child: Container(
                      width: 50.w,
                      height: 30.w,
                      // child:Row(
                      //   children: [
                      //     //  Icon(Icons,color: Colors.white,),
                      //     Icon(Icons.messenger_outline_sharp,color: Colors.white,),
                      //   ],
                      // ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://www.iconsdb.com/icons/preview/orange/messenger-xxl.png",
                              ),
                              scale: 3)),
                    ),
                  ),
                ])
              : Container(),

          widget.data["follow"] == false
              ? GestureDetector(
                  onTap: () async {
                    //print(widget.data["userType"]);
                    var data = {
                      "receiverType": widget.data["userType"].toString(),
                      "receiverID": widget.data["_id"].toString(),
                      "requestType": "Follow",
                    };
                    //print(data);
                    var getdata = await ApiService().SendRequest(data, context);
                    //print(getdata);
                    widget.data["follow"] = "pending";
                    setState(() {});
                    // Get.to(()=>SearchScreen());
                  },
                  child: Container(
                      width: Get.width * 0.75,
                      height: 58.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          border: Border.all(color: Color(0xffD2D2D2)),
                          color: bprimary),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30.w,
                            ),
                            Text(
                              "Follow",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ])),
                )
              : widget.data["follow"] == "rejected"
                  ? GestureDetector(
                      onTap: () async {
                        //print(widget.data["userType"]);
                        var data = {
                          "receiverType": widget.data["userType"].toString(),
                          "receiverID": widget.data["_id"].toString(),
                          "requestType": "Follow",
                        };
                        //print(data);
                        var getdata =
                            await ApiService().SendRequest(data, context);
                        //print(getdata);
                        widget.data["follow"] = "pending";
                        setState(() {});
                        // Get.to(()=>SearchScreen());
                      },
                      child: Container(
                          width: Get.width * 0.75,
                          height: 58.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Color(0xffD2D2D2)),
                              color: bprimary),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30.w,
                                ),
                                Text(
                                  "Follow",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ])),
                    )
                  : widget.data["follow"] == "pending"
                      ? GestureDetector(
                          onTap: () async {
                            //print(widget.data["userType"]);
                            var data = {
                              "receiverType":
                                  widget.data["userType"].toString(),
                              "receiverID": widget.data["_id"].toString(),
                              "requestType": "Follow",
                            };
                            //print(data);
                            var getdata =
                                await ApiService().SendRequest(data, context);
                            //print(getdata);
                            widget.data["follow"] = "cancel";
                            setState(() {});
                          },
                          child: Container(
                            width: Get.width * 0.75,
                            height: 58.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: Color(0xffD2D2D2)),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: bprimary),
                              ),
                            ),
                          ),
                        )
                      : Container(),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         width: Get.width * 0.75,
          //         height: 58.h,
          //         decoration: BoxDecoration(
          //             borderRadius:
          //                 BorderRadius.all(Radius.circular(6)),
          //             border: Border.all(color: Color(0xffD2D2D2)),
          //             color: Colors.white),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Container(
          //               width: 30.w,
          //             ),

          //             // Icon(
          //             //   Icons.arrow_drop_down,
          //             //   color: Colors.black,
          //             // ),
          //           ],
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           Get.toNamed("/ChatScreen");
          //         },
          //         child: Container(
          //           width: 65.w,
          //           height: 53.w,
          //           decoration: BoxDecoration(
          //               gradient: kprimary,
          //               borderRadius: BorderRadius.all(
          //                 Radius.circular(8),
          //               ),
          //               image: DecorationImage(
          //                   image: AssetImage(
          //                     "assets/Slicing/Android/4x/Icon ionic-ios-chatbubbles.png",
          //                   ),
          //                   scale: 3)),
          //         ),
          //       ),
          //     ],
          //   ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            // height: 130.h,
            padding: EdgeInsets.symmetric(vertical: 10.r),
            width: 378.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.white,
              border: Border.all(color: Color(0xffD2D2D2)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.data['bio'].toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              widget.data['userType'] == 'Instructor'
                  ? Container(
                      child: widget.data['certificate'].length > 0
                          ? Text(
                              "Certifications",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          : Container(),
                    )
                  : Container(),
              SizedBox(
                height: 10.h,
              ),
              widget.data['userType'] == 'Instructor'
                  ? Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      children: List.generate(
                          widget.data['certificate'].length,
                          (index) => Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 117.w,
                                    height: 87.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://gymsta-api.jumppace.com:9000/' +
                                              widget.data['certificate'][index]
                                                  ['file'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 2, color: Color(0xffD2D2D2)),
                                    ),
                                  ),
                                  Positioned(
                                    child: Image.asset(
                                      "assets/Slicing/Android/4x/Icon awesome-certificate-1.png",
                                      scale: 4,
                                    ),
                                  ),
                                ],
                              )))
                  : Container(),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          widget.data["follow"] == false
              ? Container()
              : widget.data["follow"] == "accepted"
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount: widget.data['post'].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (BuildContext context, postIndex) {
                        widget.data['post'][postIndex]['postMedia'].length;
                        var postLength =
                            widget.data['post'][postIndex]['postMedia'].length;
                        if (postLength > 1) {
                          postLength = 1;
                        }

                        return Row(
                            children: List.generate(postLength, (medialIndex) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(
                              //   () => UserFeeddList(postList: widget.data['post'], post: widget.data['post'][postIndex], userData: widget.data),
                              // );
                            },
                            child: Container(
                                width: 122.w,
                                height: 121.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: Color(0xffD2D2D2),
                                      width: 2.w,
                                    )),
                                child: ".mp4" ==
                                        p.extension(widget.data['post']
                                                [postIndex]['postMedia']
                                            [medialIndex]['file'])
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(9.r),
                                        child: VideoPlayerWidget(
                                            videoUrl:
                                                "https://gymsta-api.jumppace.com:9000/" +
                                                    widget.data['post']
                                                                [postIndex]
                                                            ['postMedia']
                                                        [medialIndex]['file']))
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(9.r),
                                        child: Image(
                                          image: NetworkImage(
                                              'https://gymsta-api.jumppace.com:9000/${widget.data['post'][postIndex]['postMedia'][0]['file']}'),
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                          );
                        }));
                      })
                  : Container(),
          40.verticalSpace
        ],
      ),
    );
  }
}
