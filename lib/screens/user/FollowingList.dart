import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatbot_app/Api.dart';

import '../../constants/colors.dart';

class FollowingList extends StatefulWidget {
  const FollowingList({super.key});

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  bool isloading = false;
  void initState() {
    getFollowing();
    isloading = true;
    // TODO: implement initState
    super.initState();
  }

  dynamic following;
  void getFollowing() async {
    following = await ApiService().getFollowing();
    if (following.length > 0) {
      setState(() {
        isloading = false;
      });
      //print(following);
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
            'Following',
            style: TextStyle(color: black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isloading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: following["data"].length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
                          leading:  following["data"][index]['profile']['image'] == null ? Icon(Icons.person): Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1.w, color: Colors.black),
                                image: DecorationImage(
                                    image:
                                        NetworkImage("https://gymsta-api.jumppace.com:9000/${following["data"][index]['profile']['image']['file']}"))),
                          )
                          ,
                          title: Text(
                            following["data"][index]['profile']['fullName'].toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            following["data"][index]["userType"].toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Container(
                            width: 60.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              gradient: kprimary
                            ),
                            child: Center(
                              child: Text(
                                "Following",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
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
