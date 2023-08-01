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

class AllRequest extends StatefulWidget {
  const AllRequest({super.key});

  @override
  State<AllRequest> createState() => _AllRequestState();
}

class _AllRequestState extends State<AllRequest> {
  void initState() {
    super.initState();
    getFollowerRequest();
  }

  dynamic GetAllRequest = [];

  //For check data get or not
  bool GetData = true;

  Future<void> getFollowerRequest() async {
    GetAllRequest = [];

    //print("data");
    final Url = Uri.parse('${apiGlobal}request/getRequestsList');
    var headers = {'authorization': newToken.toString()};
    http.Response response = await http.get(
      Url,
      headers: headers,
    );

    //print(response.statusCode);
    if (response.statusCode == 200) {
      var res_data = json.decode(response.body);

      var chkRequest=false;

      for (var i = 0; i < res_data["data"].length; i++) {
        //print(res_data["data"][i]["requestType"]);
        if (res_data["data"][i]["status"] == "pending") {
          chkRequest=true;
          GetAllRequest.add(res_data["data"][i]);
        }
      }

      if(!chkRequest){
          GetData = false;
      setState(() {});

      }
      setState(() {});

      // GetAllRequest = res_data["data"];
      // setState(() {});
    } else {
      GetData = false;
      setState(() {});
    }
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
      print(jsonBody);

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
    return GetData == false
        ? Center(child: Text("No request found"))
        : GetAllRequest.length > 0
            ? Container(
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: GetAllRequest.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
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
                                                                  GetAllRequest[index]['senderID']["image"]["file"],
                                                              
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
                                  GetAllRequest[index]['senderID']['fullName'],
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
                                  "Request for ${GetAllRequest[index]['requestType'].toString()}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    RequestUpdate(
                                        "Accept", GetAllRequest[index]["_id"]);
                                    // //print(GetAllRequest[index]["_id"]);
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
                                    RequestUpdate(
                                        "Reject", GetAllRequest[index]["_id"]);
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
                ))
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
              );
  }
}
