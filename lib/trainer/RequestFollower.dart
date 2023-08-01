import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/trainer/AllRequest.dart';
import 'package:chatbot_app/trainer/DietRequest.dart';
import 'package:chatbot_app/trainer/FollowRequest.dart';
import 'package:http/http.dart' as http;
import '../constants/global.dart';

class RequestFollower extends StatefulWidget {
  const RequestFollower({super.key});

  @override
  State<RequestFollower> createState() => _RequestFollowerState();
}

class _RequestFollowerState extends State<RequestFollower> {


  void initState() {
    super.initState();
    getFollowerRequest();
  }

  Future<void> getFollowerRequest() async {
    //print("data");
    final Url = Uri.parse('${apiGlobal}request/getRequestsList');
    var headers = {'authorization': newToken.toString()};
    http.Response response = await http.get(
      Url,
      headers: headers,
    
    );
 
    if (response.statusCode == 200) {
      var res_data = json.decode(response.body);

      // GetRequest = res_data["data"];
      //print("data : ${res_data["data"]}");
      // setState(() {
      //   _isLoading = false;
      // });
    }

    // //print('Response ${GetRequest}');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Requests",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: bprimary,
              indicatorColor: bprimary,
              indicatorWeight: 5,
              tabs: [
               
                Tab(
                  child: Text("Follow Request"),
                ),
                   Tab(
                  child: Text("Plan Request"),
                ),
              ]),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Image.asset(
                "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
                scale: 4,
              ),
            ),
          ),
        ),
        body: TabBarView(
            children: [FollowRequest(), DietRequest(),]),
      ),
    );
  }
}
