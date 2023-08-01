import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bubble/bubble.dart';
import 'package:chatbot_app/Api.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chatbot_app/constants/colors.dart';

class MessagesScreeen extends StatefulWidget {
  var username;
  MessagesScreeen({super.key, required this.username});

  @override
  State<MessagesScreeen> createState() => _MessagesScreeenState();
}

class _MessagesScreeenState extends State<MessagesScreeen> {






  late IO.Socket _socket;

  //connect socket func
  _connectSocket() {
    _socket = IO.io(
        'https://gymsta-api.jumppace.com:9000/',
        IO.OptionBuilder()
            .setQuery({"username": widget.username}).setTransports(
                ["websocket"]).build());
    _socket.onConnect((data) => print("Connection Established"));
    _socket.onConnectError((data) => print("Connection Error ${data}"));
    _socket.onDisconnect((data) => print("Connection Discconected"));
  }

  _sendMessage(){
    //test socket
    _socket.emit("message",{
      "message":"hello",
     "conversation":"6427476d6fbb6d5c867afac2",
    });
  }

  @override
  void initState() {
    super.initState();
    _connectSocket();

      var data = Get.arguments;
      print("pass data");
      print(data[0]);
      
    // getMessageChatList();
  }

  // getMessageChatList()async{
  // var res = await ApiService().getChatListApi(BuildContext);
  // print(res);

  // }

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
              scale: 4,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "John Smith",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: Get.width * 0.9,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD2D2D2)),
                      ),
                      height: 0.83.sh,
                      width: Get.width * 0.9,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 22.h),
                            child: Container(
                              height: 640.h,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    msg("Lorem ipsum dolor sit amet consectetur adipiscing, elit nulla dictum molestie egestas facilisir"),
                                    msg('Lorem ipsum dolor sit amet consectetur'),
                                    msg2(
                                        'Lorem ipsum dolor sit amet consectetur'),
                                    msg("Lorem ipsum dolor sit amet consectetur adipiscing, elit nulla dictum molestie egestas facilisir"),
                                    msg('Lorem ipsum dolor sit amet consectetur'),
                                    msg2(
                                        'Lorem ipsum dolor sit amet consectetur'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          txtfeild("Write a message..."),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget txtfeild(hint) {
    return Container(
      height: 60.h,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: Color(
            0xffD1D1D1,
          ),
        ),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        cursorColor: Color(0xff888888),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: (){
              print("test");
              _sendMessage();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 43.h,
                width: 43.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: kprimary,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/Slicing/Android/4x/Icon awesome-paper-plane.png',
                    scale: 5,
                  ),
                ),
              ),
            ),
          ),
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff888888), fontSize: 12.sp),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  msg(txt) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 26.w,
              ),
              Text(
                "John Smith",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: 10,
                  maxWidth: 290.w,
                  // minHeight: 30.h,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0xffEFEFEF,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                "12:35",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 26.h,
            width: 26.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(
              //   color: Color(0xffDDC6B6),
              //   width: 2.w,
              // ),
            ),
            child: Image.asset('assets/Slicing/Android/4x/Ellipse -5.png'),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  msg2(txt) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Martin Smith",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                width: 26.w,
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "12:35",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                constraints: BoxConstraints(
                  minWidth: 10,
                  maxWidth: 290.w,
                  // minHeight: 30.h,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0xffA8A8A8F,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 26.h,
            width: 26.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(
              //   color: Color(0xffDDC6B6),
              //   width: 2.w,
              // ),
            ),
            child: Image.asset('assets/Slicing/Android/4x/Ellipse -5.png'),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
