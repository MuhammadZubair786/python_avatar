import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:gymsta/constants/colors.dart';

import '../controllers/LikeController.dart';

class PostLikes extends StatefulWidget {
  var postid;
  PostLikes({super.key, required this.postid});

  @override
  State<PostLikes> createState() => _PostLikesState();
}

class _PostLikesState extends State<PostLikes> {
  final likecontroller = Get.put(LikeUserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(widget.postid);

    Future.delayed(
      Duration.zero,
      () {
        getLikesByUser(context);
      },
    );
  }

  Future<void> getLikesByUser(context) async {
    var res =
        await ApiService().likePostUsers(context, widget.postid.toString());
    print(res.length);

    likecontroller.addUsersLikes(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "People Who Reacted",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            // _key.currentState!.openDrawer();
            Navigator.pop(context);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.arrow_back_ios,
                color: bprimary,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          GetBuilder<LikeUserController>(builder: (likecontroller) {
            return likecontroller.isLoding
                ? Center(
                    child: Image.asset(
                      "assets/Slicing/output-onlinegiftools.gif",
                      height: 125.0,
                      color: Colors.orange,
                      width: 125.0,
                    ),
                  )
                :

                likecontroller.PostLikeUser[0].length == 0?
                Text("loading"):
                
                 Column(
                  children: [
                    SizedBox(height: 10,),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: likecontroller.PostLikeUser[0].length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(2),
                                child: ListTile(
                                 
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "https://gymsta-api.jumppace.com:9000/" +
                                            likecontroller.PostLikeUser[0][index]["user"]["image"]["file"].toString()),
                                  ),
                                  title: Text(likecontroller.PostLikeUser[0][index]["user"]
                                      ["fullName"]),
                                     
                                ),
                              ),
                              Divider(
                                color: bprimary,
                              thickness:0.09
                                // height: 0.22,
                              )
                            ],
                          );
                        })),
                  ],
                );
          }),
        ],
      ),
    );
  }
}
