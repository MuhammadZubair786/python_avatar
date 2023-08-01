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
import 'package:chatbot_app/screens/Routine17.dart';
import 'package:chatbot_app/screens/user/DietPlan.dart';
import 'package:http/http.dart' as http;

import '../Api.dart';
import '../constants/global.dart';
import 'CustomerRoutine.dart';
import 'NutritionTracking.dart';

class DietRequest extends StatefulWidget {
  const DietRequest({super.key});

  @override
  State<DietRequest> createState() => _DietRequestState();
}

class _DietRequestState extends State<DietRequest> {
  void initState() {
    super.initState();
    getFollowerRequest();
  }

  dynamic GetDietRequest = [];

  bool GetData = true;

  Future<void> getFollowerRequest() async {
    //print("data");
    final Url = Uri.parse('${apiGlobal}request/getRequestsList');
    var headers = {'authorization': newToken.toString()};
    http.Response response = await http.get(
      Url,
      headers: headers,
    );
    //print("jhjhjhjhhj");
    //print(response.body);

    if (response.statusCode == 200) {
      var chkRequest = false;

      var res_data = json.decode(response.body);
      //print(res_data["data"].length);
      for (var i = 0; i < res_data["data"].length; i++) {
        //print(res_data["data"][i]["requestType"]);
        if (res_data["data"][i]["requestType"] == "Diet" &&
            res_data["data"][i]["status"] == "pending") {
          //print(res_data["data"][i]);
          chkRequest = true;
          GetDietRequest.add(res_data["data"][i]);
        } else if (res_data["data"][i]["requestType"] == "Routine" &&
            res_data["data"][i]["status"] == "pending") {
          //print(res_data["data"][i]);
          chkRequest = true;
          GetDietRequest.add(res_data["data"][i]);
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
  }

  RequestUpdate(
      String resp, String Requestid, String requestType, userId) async {
    if (resp == "Accept") {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return spinkit;
          });

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

        Get.snackbar('Accept Request', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);

        Get.back();
        getFollowerRequest();
        if (requestType == "Diet") {
          dietRequestUserId = userId;
          await Get.to(() => NewDietPlanScreen());
        }
        else   if (requestType == "Routine") { 
             dietRequestUserId = userId;
          await Get.to(() => Routine17Screen());
        }

        // getFollowerRequest();
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
            : GetDietRequest.length > 0
                ? ListView.builder(
                    itemCount: GetDietRequest.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      //print(GetDietRequest[index]);
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
                                child: Image.network(
                                  "https://gymsta-api.jumppace.com:9000/" +
                                      GetDietRequest[index]['senderID']["image"]
                                          ["file"],
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    GetDietRequest[index]['senderID']
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
                                    "Request for ${GetDietRequest[index]['requestType'].toString()}",
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
                                      RequestUpdate(
                                          "Accept",
                                          GetDietRequest[index]["_id"],
                                          GetDietRequest[index]['requestType'],
                                          GetDietRequest[index]['senderID']
                                              ["_id"]);
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
                                    onTap: (){
                                          RequestUpdate(
                                        "Reject", GetDietRequest[index]["_id"], GetDietRequest[index]["requestType"], GetDietRequest[index]['senderID']
                                              ["_id"]);
                                    },
                                    child: Container(
                                      width: 78.w,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                        gradient: kprimary,
                                        borderRadius: BorderRadius.circular(50.r),
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
