import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/screens/user/messages.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket _socket;

  //connect socket func
  _connectSocket() {
    _socket = IO.io('https://gymsta-api.jumppace.com:9000/',
        IO.OptionBuilder().setTransports(["websocket"]).build());
    _socket.onConnect((data) => print("Connection Established"));
    _socket.onConnectError((data) => print("Connection Error ${data}"));
    _socket.onDisconnect((data) => print("Connection Discconected"));
  }

  _sendMessage() {
    //test socket
    _socket.emit("message", {
      "message": "hello",
      "conversation": "6427476d6fbb6d5c867afac2",
    });
  }

  List chatlistdata =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _connectSocket();
    getchatConservationList();
  }


  getchatConservationList() async {
    var res = await ApiService().getChatListApi(context);
    print(res["data"]);
    for(var i=0;i<res["data"].length;i++){
      chatlistdata.add(res["data"][i]);
    }
    // chatlistdata.add(res["data"]);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;

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
            width: res_width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Chats",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            shrinkWrap: true,
            itemCount: chatlistdata.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Get.to());
                  Get.toNamed("/MessagesScreeen",arguments: [
                       chatlistdata[index]
              ]);
                },
                child: Column(
                  children: [
                    chat(chatlistdata[index]),
                    // chat(),
                    // chat2(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  chat(chatlistdata) {

    return Column(
      children: [
        Container(
          width: 378.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            color: Colors.white,
            border: Border.all(color: Color(0xffD2D2D2)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              children: [
                Container(
                  width: 66.w,
                  height: 66.h,
                  child:
                    chatlistdata["user"]["image"]["file"] == null ?
                   Image.asset(
                    "assets/Slicing/Android/4x/Ellipse 11.png",
                  ):
                  Image.network( 'https://gymsta-api.jumppace.com:9000/'+ chatlistdata["user"]["image"]["file"].toString())
                  ,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                      width: 253.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chatlistdata["user"]["fullName"],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                          Container(
                            width: 29.w,
                            height: 29.h,
                            decoration: BoxDecoration(
                                gradient: kprimary, shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        "Lorem ipsum dolor sit amet consectetur",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 15.h,
                  width: 8.w,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  chat2() {
    return Column(
      children: [
        Container(
          width: 378.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            color: Colors.white,
            border: Border.all(color: Color(0xffD2D2D2)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 66.w,
                      height: 66.h,
                      child: Image.asset(
                        "assets/Slicing/Android/4x/Ellipse -7.png",
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.w,
                        ),
                        Text(
                          "Sarah Smith",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
                        ),
                        SizedBox(
                          width: 220.w,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Lorem ipsum dolor sit amet consectetur",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Container(
                  height: 15.h,
                  width: 8.w,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
