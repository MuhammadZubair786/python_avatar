import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/controllers/global_controller.dart';
import 'package:chatbot_app/screens/NewDietPlan.dart';
import 'package:http/http.dart' as http;

import '../Api.dart';
import '../constants/global.dart';
import 'CustomerRoutine.dart';
import 'NutritionTracking.dart';

class FollowRequest extends StatefulWidget {
  const FollowRequest({super.key});

  @override
  State<FollowRequest> createState() => _FollowRequestState();
}

class _FollowRequestState extends State<FollowRequest> {
  void initState() {
    super.initState();
    getFollowerRequest();
  }

  dynamic GetFollowRequest = [];

  bool GetData = true;

  Future<void> getFollowerRequest() async {
    //print("data");
    final Url = Uri.parse('${apiGlobal}request/getRequestsList');
    var headers = {'authorization': newToken.toString()};
    http.Response response = await http.get(
      Url,
      headers: headers,
    );

    //print(response.body);

    if (response.statusCode == 200) {
      var chkRequest = false;

      var res_data = json.decode(response.body);
      //print(res_data["data"].length);
      for (var i = 0; i < res_data["data"].length; i++) {
        //print(res_data["data"][i]["requestType"]);
        if (res_data["data"][i]["requestType"] == "Follow" &&
            res_data["data"][i]["status"] == "pending") {
              // //print(re)
          GetFollowRequest.add(res_data["data"][i]);
          chkRequest=true;
        }
      }
      setState(() {});

      if (!chkRequest) {
        GetData = false;
        setState(() {});
      }
    } else {
      GetData = true;
      setState(() {});
    }

    // //print('Response ${GetRequest}');
  }

  RequestUpdate(String resp, String Requestid) async {
    if (resp == "Accept") {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return spinkit;
          });

      // //print("Request Update");
      // //print(Requestid);

      Map data = {"requestId": Requestid};
      String jsonBody = json.encode(data);
      //print(jsonBody);

      final uri = Uri.parse('${apiGlobal}request/acceptRequest');
      //print(uri);
      var headers = {
        'authorization': newToken.toString(),
        'Content-Type': 'application/json'
      };

      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status']) {
        //print("Request Accept");

    

        Get.back();
            Get.snackbar('Accept Request', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
        getFollowerRequest();
        //  Get.back();
      } else {
        Get.back();
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return spinkit;
          });

      // //print("Request Reject");
      // //print(Requestid);

      Map data = {"requestId": Requestid};
      String jsonBody = json.encode(data);
      //print(jsonBody);

      final uri = Uri.parse('${apiGlobal}request/rejectRequest');
      //print(uri);
      // final headers = {'Content-Type': 'application/json'};
      var headers = {
        'authorization': newToken.toString(),
        'Content-Type': 'application/json'
      };

      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status']) {
        //print("Request Reject");
        Get.back();

        getFollowerRequest();
      } else {
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: GetData == false
            ? Center(child: Text("No request found"))
            : GetFollowRequest.length > 0
                ? ListView.builder(
                    itemCount: GetFollowRequest.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      //print(GetFollowRequest[index]);
                      return Container(
                        width: 378.w,
                        height: 87.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD2D2D2)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                            CircleAvatar(
                                    child: Image.network("https://gymsta-api.jumppace.com:9000/" + 
                                                                  GetFollowRequest[index]['senderID']["image"]["file"],
                                                              
                                ),),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    GetFollowRequest[index]['senderID']
                                        ['fullName'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Request for ${GetFollowRequest[index]['requestType'].toString()}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      RequestUpdate("Accept",
                                          GetFollowRequest[index]["_id"]);
                                    },
                                    child: Container(
                                      width: 78.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                        gradient: kprimary,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      RequestUpdate("Reject",
                                          GetFollowRequest[index]["_id"]);
                                    },
                                    child: Container(
                                      width: 78.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                        gradient: kprimary,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Text(
                                  //   "Request a Diet Plan",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.normal,
                                  //     color: Colors.black,
                                  //     fontSize: 12,
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.all(5),
                          child: CircularProgressIndicator(
                            strokeWidth: 4.0,
                            valueColor: AlwaysStoppedAnimation(bprimary),
                          ),
                        ),
                      ),
                    ],
                  ));
  }
}
