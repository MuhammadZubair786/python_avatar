import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatbot_app/Api.dart';

import '../../constants/colors.dart';

class FollowersListScreen extends StatefulWidget {
  const FollowersListScreen({super.key});

  @override
  State<FollowersListScreen> createState() => _FollowersListScreenState();
}

class _FollowersListScreenState extends State<FollowersListScreen> {
  bool isloading = false;
  @override
  void initState() {
    getfollowers();
    isloading = true;
    // TODO: implement initState
    super.initState();
  }

  dynamic followers;
  void getfollowers() async {
    followers = await ApiService().getFollowers();
    if (followers.length > 0) {
      setState(() {
        isloading = false;
      });
    }
    //print(followers);
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
            'Followers',
            style: TextStyle(color: black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isloading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: followers["data"].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
                          leading: followers["data"][index]['profile']['image'] == null ? Icon(Icons.person) 
                          : Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1.w, color: Colors.black),
                                image: DecorationImage(
                                    image:
                                        NetworkImage("https://gymsta-api.jumppace.com:9000/${followers["data"][index]['profile']['image']['file']}"))),
                          ),
                          title: Text(
                            followers["data"][index]['profile']['fullName'].toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            followers["data"][index]["userType"].toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () async {
                              //print( followers["data"][index]["_id"]);
                              //print("test api");
                             var getstatus = await ApiService().RemoveFollower(followers["data"][index]["_id"],context);
        
                            if(getstatus){
                            getfollowers();
        
                            }
                            
                            },
                            child: Container(
                              width: 60.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                gradient: kprimary,
                              ),
                              child: Center(
                                child: Text(
                                  "Remove",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
