import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/global.dart';
import 'package:http/http.dart' as http;

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  void initState() {
    _isLoading = true;
    gettermsandconditionss();

    super.initState();
  }

  dynamic gettermsandconditions = [];
  bool _isLoading = false;

  void gettermsandconditionss() async {
    final Url = Uri.parse('https://gymsta-api.jumppace.com:9000/api/v1/user/terms');
    final headers = {'Content-Type': 'application/json', 'authorization': newToken.toString()};

    http.Response response = await http.get(
      Url,
      headers: headers,
      // body: jsonBody,
    );
    setState(() {
      _isLoading = true;
    });
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var res_data = json.decode(response.body);
      gettermsandconditions = res_data;
      setState(() {
        _isLoading = false;
      });
    }

    //print('Response ${gettermsandconditions['data']['termscondition']}');
  }

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
                scale: 4,
              ),
            ),
          ),
          title: Text(
            "Terms & Conditions",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: res_width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(
                          height: res_height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.white,
                            border: Border.all(color: Color(0xffD2D2D2)),
                          ),
                          width: res_width * 0.9,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: _isLoading == true
                                    ? CircularProgressIndicator()
                                    : Text(gettermsandconditions['data']['termscondition'], style: TextStyle(color: Colors.black, fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
