import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/screens/PostLikes.dart';
import 'package:chatbot_app/screens/commentScreen.dart';
import 'package:chatbot_app/screens/search_screen.dart';
import 'package:chatbot_app/widgets/camerScreen.dart';
import 'package:chatbot_app/widgets/disallow_indicator_widget.dart';
import 'package:chatbot_app/widgets/videoPlayer.dart';
import 'package:path/path.dart' as p;

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';

import '../export_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalController = Get.put(GlobalController());
  // int _currentPage = 1;
  // int _pageSize = 10;
  bool isLoadingMore = false;

  var _pageSize = 1;
  var _currentPage = 10;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  late ScrollController _controller;
  dynamic fetchedPosts;

  Box? _box;

  // ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getPosts();
    _controller = ScrollController()..addListener(loadMore);
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     getPosts();
    //   }
    // }

    // );
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    _box?.close();
    super.dispose();
  }

  bool _isLoading = false;
  Future<void> likePosts(context, postId) async {
    await ApiService().likePost(context, postId);
  }

  void getPosts() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    if (!isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
      var posts =
          await ApiService().getFeedsApi(context, _pageSize, _currentPage);
      setState(() {
        isLoadingMore = false;
        globalController.addPostData(posts);

        _isFirstLoadRunning = false;
        // _pageSize++;
      });
    }
  }

  void loadMore() async {
    if (_isFirstLoadRunning == false && _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _pageSize += 1;
      try {
        var posts =
            await ApiService().getFeedsApi(context, _pageSize, _currentPage);
        setState(() {
          isLoadingMore = false;
          // globalController.addPostData(posts);
          fetchedPosts = posts;
          globalController.addMorePostData(fetchedPosts);

          _isFirstLoadRunning = false;
          // _pageSize++;
        });
      } catch (err) {
        if (kDebugMode) {
          //print('Something went wrong!');
        }
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // getFeedsApi(context, page, limit) async {

  //   // showDialog(
  //   //     context: context,
  //   //     barrierDismissible: false,
  //   //     builder: (BuildContext context) {
  //   //       return spinkit;
  //   //     });

  //   final uri = Uri.parse('${apiGlobal}post/getFeeds?page=$page&limit=$limit');
  //   final headers = {'Content-Type': 'application/json', 'authorization': newToken.toString()};

  //   http.Response response = await http.get(
  //     uri,
  //     headers: headers,
  //   );

  //   var res_data = json.decode(response.body.toString());

  //   if (res_data['status']) {
  //     final data = res_data['data'];
  //     // log("Feeds response : $data");
  //     // Get.back();
  //     return res_data['data'];
  //   } else if (!res_data['status']) {
  //     Get.snackbar('Error', res_data['message'], snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3), backgroundColor: Colors.white, colorText: Colors.black);
  //   }
  //   // Get.back();
  //   return res_data['data'];
  // }

  dynamic searchHere = [];

  Future<void> Searching() async {
    final Url = Uri.parse('https://gymsta-api.jumppace.com:9000/api/v1/user');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.get(
      Url,
      headers: headers,
    );
    setState(() {
      _isLoading = true;
    });
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var res_data = json.decode(response.body);
      searchHere = res_data;
      setState(() {
        _isLoading = false;
      });
    }
    //print('Response ${searchHere['data']}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DisAllowIndicatorWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: constScreenHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    SearchScreen.start(context);
                  },
                  child: Container(
                    width: 378.w,
                    height: 51.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE9E9E9),
                          // color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 0),
                        ),
                      ],
                      border: Border.all(color: Colors.white, width: 2.sp),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Search...',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: Get.width * 0.06,
                      ),
                      Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 67.w,
                                width: 67.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Slicing/Android/4x/Rectangle 42.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "sdaddasdasd",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 67.w,
                                width: 67.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Slicing/Android/4x/Rectangle 38.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Martin",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RecordVideoScreen());
                        },
                        child: Column(
                          children: [
                            DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  height: 67.w,
                                  width: 67.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Slicing/Android/4x/Rectangle 39.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Sarah",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 67.w,
                                width: 67.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Slicing/Android/4x/Rectangle 40.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "John",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 67.w,
                                width: 67.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Slicing/Android/4x/Rectangle 41.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Daniel",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 67.w,
                                width: 67.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Slicing/Android/4x/Rectangle 43.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Aud",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                // pass ValueListenableBuilder in getbuilder
                20.verticalSpace,

                // Container(
                //     height: 1.sh,
                //     width: 1.sw,
                //     child: ValueListenableBuilder<Box<dynamic>>(
                //       valueListenable: _box!.listenable(),
                //       builder: (BuildContext context, Box box, Widget? child) {
                //         List<dynamic> data = [];
                //         if (box != null && box.containsKey('post_items')) {
                //           data = box.get('post_items');
                //         }
                //         globalController.postsList = data;

                //         // Display the paginated list of news items
                //         return GetBuilder<GlobalController>(
                //           builder: (pController) {

                //             return ListView.builder(
                //               itemCount: pController.postsList.length + (pController.isLoding ? 1 : 0),
                //               itemBuilder: (BuildContext context, int index) {
                //                 // Load the next batch of items when the user scrolls to the end
                //                 if (index >= pController.postsList.length - 1 && !pController.isLoding) {
                //                   _loadMoreItems();
                //                 }

                //                 if (index >= pController.postsList.length) {
                //                   return Center(
                //                     child: CircularProgressIndicator(),
                //                   );
                //                 }

                //                 final item = pController.postsList[index];
                //                 // Display the item
                //                 return Text("data");
                //               },
                //             );

                //           },
                //         );
                //       },
                //     ))
                Container(
                    height: 1.sh,
                    width: 1.sw,
                    child:
                        GetBuilder<GlobalController>(builder: (postController) {
                      return postController.postsList.isEmpty && isLoadingMore
                          ? Center(
                              child: Image.asset(
                                "assets/Slicing/output-onlinegiftools.gif",
                                height: 125.0,
                                color: Colors.orange,
                                width: 125.0,
                              ),
                            )
                          : ListView.builder(
                              controller: _controller,
                              itemCount: postController.postsList.length + 1,
                              itemBuilder: (context, index) {
                                if (index == postController.postsList.length) {
                                  return isLoadingMore
                                      ? Center(
                                          child: Image.asset(
                                            "assets/Slicing/output-onlinegiftools.gif",
                                            color: Colors.orange,
                                            height: 125.0,
                                            width: 125.0,
                                          ),
                                        )
                                      : SizedBox();
                                }

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.05,
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  width: 47.w,
                                                  height: 47.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: postController
                                                            .postsList[index]
                                                                ["user"]
                                                                ["image"]
                                                            .isEmpty
                                                        ? DecorationImage(
                                                            image: AssetImage(
                                                                'assets/Slicing/Android/4x/Rectangle 44.png'),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : DecorationImage(
                                                            image: NetworkImage(
                                                                "https://gymsta-api.jumppace.com:9000/" +
                                                                    postController.postsList[index]
                                                                            [
                                                                            "user"]["image"]
                                                                        [
                                                                        "file"]),
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                postController.postsList[index]
                                                    ["user"]["fullName"],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.more_horiz,
                                              color: Colors.orange,
                                            ),
                                            SizedBox(
                                              width: 30,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),

                                    postController.postsList[index]["postMedia"]
                                            .isEmpty
                                        ? Container(
                                            width: 378.w,
                                            height: 278.h,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Image.asset(
                                                    'assets/Slicing/Android/4x/Rectangle 46.jpg')

                                                // Image.asset(
                                                //   "assets/Slicing/Android/4x/Rectangle 30.jpg",
                                                //   fit: BoxFit.cover,
                                                // ),
                                                ),
                                          )
                                        : Container(
                                            width: 0.9.sw,
                                            // height: 278.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                10.verticalSpace,
                                                Text(postController
                                                    .postsList[index]["title"]),
                                                10.verticalSpace,
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: ".mp4" ==
                                                            p.extension(postController
                                                                        .postsList[index]
                                                                    ["postMedia"]
                                                                [0]["file"])
                                                        ? VideoPlayerWidget(
                                                            videoUrl: "https://gymsta-api.jumppace.com:9000/" +
                                                                postController.postsList[
                                                                            index]
                                                                        ["postMedia"]
                                                                    [0]["file"])

                                                        // CustomVideoPlayer(
                                                        //     customVideoPlayerController: CustomVideoPlayerController(
                                                        //         context: context,
                                                        //         videoPlayerController: VideoPlayerController.network(
                                                        //             "https://gymsta-api.jumppace.com:9000/" + postController.postsList[index]["postMedia"][0]["file"].toString())))

                                                        : Center(
                                                            child:
                                                                Image.network(
                                                              "https://gymsta-api.jumppace.com:9000/" +
                                                                  postController
                                                                              .postsList[index]
                                                                          [
                                                                          "postMedia"]
                                                                      [
                                                                      0]["file"],
                                                              fit: BoxFit.fill,
                                                            ),
                                                          )

                                                    // Image.asset(
                                                    //   "assets/Slicing/Android/4x/Rectangle 30.jpg",
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                    ),
                                              ],
                                            ),
                                          ),

                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.08,
                                          ),
                                          postController.postsList[index]
                                                      ["likesCount"] ==
                                                  0
                                              ? Text("")
                                              : GestureDetector(
                                                  onTap: () {
                                                    print(postController
                                                        .postsList[index]);

                                                    Get.to(() => PostLikes(
                                                        postid: postController
                                                                .postsList[
                                                            index]["_id"]));
                                                  },
                                                  child: Icon(
                                                    Icons.favorite,
                                                    size: 15,
                                                    color: Colors.red,
                                                  ),
                                                )
                                        ]),
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.08,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.6,
                                                  color: Color.fromARGB(
                                                      255, 241, 228, 228)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(children: [
                                            Container(
                                              child:
                                                  postController
                                                              .postsList[index]
                                                          ["like"]
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            postController
                                                                .decclikePost(
                                                                    index);
                                                            likePosts(
                                                                    context,
                                                                    postController
                                                                            .postsList[index]
                                                                        ["_id"])
                                                                .then((value) =>
                                                                    getPosts());
                                                          },
                                                          child: Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            size: 18,
                                                          ),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () {
                                                            postController
                                                                .inclikePost(
                                                                    index);
                                                            likePosts(
                                                                    context,
                                                                    postController
                                                                            .postsList[index]
                                                                        ["_id"])
                                                                .then((value) =>
                                                                    getPosts());
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .favorite_border_outlined,
                                                            color: Colors.red,
                                                            size: 18,
                                                          ),
                                                        ),
                                              // child: Image(
                                              //     image: AssetImage(
                                              //         "assets/Slicing/Android/drawable-ldpi/Icon ionic-ios-heart.png")),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.02,
                                            ),
                                            Text(postController.postsList[index]
                                                    ["likesCount"]
                                                .toString()),
                                          ]),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.04,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.6,
                                                  color: Color.fromARGB(
                                                      255, 241, 228, 228)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => CommentScreen(
                                                      postID: postController
                                                          .postsList[index]
                                                              ["_id"]
                                                          .toString()));
                                                },
                                                child: Container(
                                                  child: Image(
                                                    image: AssetImage(
                                                        "assets/Slicing/Android/drawable-ldpi/Icon awesome-comment-dots.png"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.02,
                                              ),
                                              Text(postController
                                                  .postsList[index]
                                                      ["commentsCount"]
                                                  .toString()),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.6,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            sharePopUp(context);
                                          },
                                          child: Container(
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/Slicing/Android/drawable-ldpi/Icon awesome-share.png")),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // 10.verticalSpace,
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       padding: EdgeInsets.symmetric(
                                    //           horizontal: 30.w),
                                    //       decoration: BoxDecoration(
                                    //         shape: BoxShape.circle,
                                    //         border: Border.all(
                                    //             color: Color(0xFFFD6839), width: 2),
                                    //       ),
                                    //       child: CircleAvatar(
                                    //         backgroundImage: AssetImage(
                                    //             "assets/images/trainer_image.jpg"),
                                    //         radius: 20.r,
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       width: 290.w,
                                    //       padding: EdgeInsets.all(5),
                                    //       decoration: BoxDecoration(
                                    //         color: Color(0xFFECECEC),
                                    //         borderRadius:
                                    //             BorderRadius.circular(5.r),
                                    //       ),
                                    //       child: Text(
                                    //         "Sarah Doe Lorem ipsum dolor sit amet consectetur adipiscing elit odio",
                                    //         style: TextStyle(
                                    //           fontSize: 12.sp,
                                    //         ),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    40.verticalSpace,

                                    postController.postsList.length - 1 == index
                                        ? SizedBox(
                                            height: 330.h,
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                );
                              },
                            );
                    })),

                //     //  FutureBuilder(
                //     //   future: getPostFeeds(context),
                //     //   builder: (context, snapshot) {
                //     //     if (postsList.length > 0) {
                //     //       return

                //     //     }
                //     //     return Column(
                //     //       children: [
                //     //         CircularProgressIndicator(),
                //     //       ],
                //     //     );
                //     //     // else {
                //     //     //   return CircularProgressIndicator();
                //     //     //   // return ListView.builder(
                //     //     //   //   itemCount: postsList.length,
                //     //     //   //   itemBuilder: (context, index) {
                //     //     //   //     return Text(postsList[index]['title']);
                //     //     //   //   },
                //     //     //   // );
                //     //     // }
                //     //   },
                //     // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

final sampleUsers = [
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "User1",
      "https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "User2",
      "https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "User3",
      "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
];

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: StoryImage(
                  key: ValueKey(story.imageUrl),
                  imageProvider: NetworkImage(
                    story.imageUrl,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            if (pageIndex == 0)
              Center(
                child: ElevatedButton(
                  child: const Text('show modal bottom sheet'),
                  onPressed: () async {
                    indicatorAnimationController.value =
                        IndicatorAnimationCommand.pause;
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            'Look! The indicator is now paused\n\n'
                            'It will be coutinued after closing the modal bottom sheet.',
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                    indicatorAnimationController.value =
                        IndicatorAnimationCommand.resume;
                  },
                ),
              ),
          ]);
        },
        indicatorAnimationController: indicatorAnimationController,
        initialStoryIndex: (pageIndex) {
          if (pageIndex == 0) {
            return 1;
          }
          return 0;
        },
        pageLength: sampleUsers.length,
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
