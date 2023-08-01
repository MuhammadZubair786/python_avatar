import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:chatbot_app/screens/user/MyProfile.dart';
import 'package:chatbot_app/screens/user/TrainerProfile.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static Future start(BuildContext context) {
    if (Platform.isIOS) {
      return Navigator.push(context, CupertinoPageRoute(builder: (context) => SearchScreen()));
    } else {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
    }
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  List userData = [];
  bool apiLoading = false;



  Future searchByUsername(String username) async {
    // http.Response response = await http.get(Uri.parse('https://api.example.com/search?username=$username'));

    setState(() {
      apiLoading = true;
    });

    final uri = Uri.parse('${apiGlobal}user/searchInstructor/?userName=$username');
    final headers = {'Content-Type': 'application/json', 'authorization': newToken.toString()};

    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());

    //print(res_data);

    if (res_data['status']) {
       userData = [];
      setState(() {
        apiLoading = false ;
      });
      return userData= res_data['data'];
    } else {
       userData = [];
      setState(() {
        apiLoading = false;
      });
      //print(res_data);
      Get.snackbar("{$res_data['message]}", "");
    }
  }

  void _handleSearch(String val) async {
    // String username = _searchController.text;
    if (val.isNotEmpty) {
      searchByUsername(val).then((user) {
        setState(() {
          userData = user;
        });
        //print(userData);
      }).catchError((error) {
        //print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: bprimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Search',
            style: TextStyle(color: black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: constScreenHorizontal, vertical: constScreenHorizontal),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        onChanged: (value) {
                          //print(value);
                          _handleSearch(value);
                        },
                        onSubmitted: (value) {},
                        controller: _searchController,
                        cursorColor: bprimary,
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          hintStyle: TextStyle(
                            color: grey,
                          ),
                          contentPadding: EdgeInsets.only(top: 10, left: 15),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: borderGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1.5, color: borderGrey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  15.horizontalSpace,
                  SpringWidget(
                    onTap: () {
                      // _handleSearch();
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: bprimary),
                      child: Text(
                        'Search',
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                ],
              ),
              apiLoading == true && userData.isEmpty
                  ? Center(
                      child: Image.asset(
                        "assets/Slicing/output-onlinegiftools.gif",
                        height: 125.0,
                        color: Colors.orange,
                        width: 125.0,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                      itemCount: userData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 300,
                          height: 180.h,
                          padding: new EdgeInsets.all(10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.orange[900],
                            elevation: 20,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    // userData[index]['_id'];

                                    Get.to(() => TrainerProfileScreen(
                                          data: userData[index],
                                        ));
                                  },
                                  child: ListTile(
                                    // leading: userData[index]["image"].isEmpty || userData[index]["image"] == null
                                    //     ? Container(
                                    //         width: 50,
                                    //         height: 50,
                                    //         child: Image.asset(
                                    //           "assets/images/user_image.jpg",
                                    //         ))
                                    //     : Image.network(
                                    //         userData[index]["image"]["file"],
                                    //         errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                    //       ),
                                    title: Text('${userData[index]["fullName"]}', style: TextStyle(color: Colors.white, fontSize: 30.0)),
                                    subtitle: Text('${userData[index]["userType"]}',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Text(
                                            "Follower: ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            userData[index]["follower"].length.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Wrap(
                                        children: [
                                          Text(
                                            "Following: ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            userData[index]["following"].length.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                    //  userData[index]["follow"] == false? GestureDetector(
                                    //     onTap: () async {
                                    //       //print(userData[index]);
                                    //       // if (userData[index]["userType"] == 'Instructor' && userData[index]["requestType"] == "Diet") {

                                    //       // } else {
                                    //       //   Get.snackbar("Sorry", 'Request cant sent');
                                    //       // }
                                    //       var data = {
                                    //         "receiverType": userData[index]["userType"].toString(),
                                    //         "receiverID": userData[index]["_id"].toString(),
                                    //         "requestType": "Follow",
                                    //       };
                                    //       //print(data);
                                    //       //print(_searchController.text);
                                    //       // ApiService().makePostRequest(context, data);
                                    //      var checkstatus = await ApiService().SendRequest(data, context);
                                    //      if(checkstatus){
                                    //     searchByUsername(_searchController.text);
                                    //      }
                                          
                                    //     },
                                    //     child: Icon(
                                    //       Icons.person_add_alt,
                                    //       color: white,
                                    //     ),
                                    //   )
                                    //   :Container()
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                        );

                        //  ListTile(
                        //   title: Text('${userData[index]["fullName"]}'),
                        //   trailing: Column(
                        //     children: [
                        //       Row(
                        //         children: [
                        //           Expanded(child: Text("Follower: ")),
                        //           Expanded(child: Text("${userData[index]["follower"]}")),
                        //         ],
                        //       ),
                        //       Wrap(
                        //         children: [
                        //           Text("Following: "),
                        //           Text("${userData[index]["following"]}"),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        //   leading: userData[index]["image"].isEmpty
                        //       ? Container(
                        //           width: 50,
                        //           height: 50,
                        //           child: Image.asset(
                        //             "assets/images/user_image.jpg",
                        //           ))
                        //       : Image.network(userData[index]["image"][0]),
                        // );
                      },
                    ))
            ],

            // how to check if map is empty
          ),
        ),
      ),
    );
  }
}
