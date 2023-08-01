import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/screens/user/FollowersList.dart';
import 'package:chatbot_app/widgets/homesFeedList.dart';

import 'package:chatbot_app/widgets/videoPlayer.dart';
import 'package:path_provider/path_provider.dart';

import '../../export_all.dart';
import 'package:path/path.dart' as p;

import 'FollowingList.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final globalController = Get.put(GlobalController());

  void initState() {
    _isLoading = true;
    getUserData();

    super.initState();
  }

  dynamic userData;
  bool _isLoading = false;

  getUserData() async {
    userData = await ApiService().getProfileDetails(userId, userType);
    //print(' ProfileData  ${userData}');
    globalController.listImagePath = [];

    if (userData['data']['userType'] != 'Customer') {
      for (var i = 0; i < userData['data']['certificate'].length; i++) {
        globalController.listImagePath.add('https://gymsta-api.jumppace.com:9000/' + userData['data']['certificate'][i]['file']);
      }
      globalController.listImagePath;

      convertUrlsToFilePaths(globalController.listImagePath);

      globalController.listImagePath;
    }

    

    if (userData.length > 0) {
      username = userData['data']['fullName'];
      var imageFile = userData['data']['image']['file'];
      if (imageFile != null) {
        userImage = imageFile;
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  CountFollow()async{

  }

  Future<List<String>> convertUrlsToFilePaths(List urls) async {
    List<String> filePaths = [];
    HttpClient httpClient = new HttpClient();

    for (var i = 0; i < urls.length; i++) {
      try {
        var request = await httpClient.getUrl(Uri.parse(urls[i]));
        var response = await request.close();
        if (response.statusCode == 200) {
          Directory tempDir = await getTemporaryDirectory();
          String fileName = urls[i].substring(urls[i].lastIndexOf("/") + 1);
          File file = File("${tempDir.path}/$fileName");
          var sink = file.openWrite();
          await response.pipe(sink);
          sink.close();
          filePaths.add(file.path);
        }
      } catch (e) {
        //print(e);
      }
    }

    globalController.listImagePath = filePaths;
    return globalController.listImagePath;
  }

  // final GlobalKey<ScaffoldState> _key = GlobalKey();
  UserModel? userModel;
  bool isLoading = true;

  @override

  // callToGetProfileApi() async {
  //   userModel = await ApiService().getProfileApi(context);
  //   setState(() {
  //     isLoading = false;
  //   });
  //   log('GETPROFILE API: ${userModel!.toRawJson()}');
  // }
  List noOfPosts = [];
  List noOfPosts2 = [];
  @override
  Widget build(BuildContext context) {
    // //print("Details${posts}");
    // for (var i = 0; i < posts.length; i++) {
    //   noOfPosts.add(posts[i]['postMedia']);
    // }
    // //print('No Of Posts is ${noOfPosts}');
    // for (var i = 0; i < noOfPosts.length; i++) {
    //   noOfPosts2.add(noOfPosts[i]['file']);
    // }
    // //print('No Of Posts is ${noOfPosts2}');

    return Scaffold(
      backgroundColor: Colors.white,
      body:
          //  isLoading
          //     ? SizedBox.shrink()
          //     :

          Container(
        width: double.infinity,
        child: _isLoading == true
            ? Center(
                child: Image.asset(
                  "assets/Slicing/output-onlinegiftools.gif",
                  height: 125.0,
                  color: Colors.orange,
                  width: 125.0,
                ),
              )
            : ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Container(
                    width: 137.w,
                    height: 137.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.r,
                          color: Color(0xffFD6839),
                        ),
                        image: userData['data']['image'].isEmpty
                            ? DecorationImage(
                                image: AssetImage(
                                  'assets/Slicing/Android/4x/Ellipse -2.png',
                                ),
                                fit: BoxFit.fill)
                            : DecorationImage(
                                image: NetworkImage('https://gymsta-api.jumppace.com:9000/' + userData['data']['image']['file']),
                              )),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    // userModel!.fullName ?? "",
                    userData['data']['fullName'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  userType == "Instructor"
                      ? Text(
                          userData['data']['userType'],
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        )
                      : Container(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffD2D2D2)),
                    ),
                    // height: 67.h,
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    width: 378.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              userData['data']['post'].length.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "Post",
                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey[300],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => FollowersListScreen());
                          },
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 11,
                              // ),
                              Text(
                                userData['data']['follower'].toString(),
                                // userModel!.follower.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey[300],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => FollowingList());
                          },
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 11,
                              // ),
                              Text(
                                userData['data']['following'].toString(),
                                // userModel!.following.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30.w,
                      ),
                    ],
                  ),

                  Container(
                    // height: 130.h,
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    width: 378.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffD2D2D2)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            userData['data']['bio'] == null ? "" : userData['data']['bio'].toString(),
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      userData['data']['userType'] == 'Instructor'
                          ? Container(
                              child: Text(
                                "Certifications",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 10.h,
                      ),
                      userData['data']['userType'] == 'Instructor'
                          ? Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 5,
                              children: List.generate(
                                userData['data']['certificate'].length,
                                (index) => Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 117.w,
                                      height: 87.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://gymsta-api.jumppace.com:9000/' + userData['data']['certificate'][index]['file'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.white,
                                        border: Border.all(width: 2, color: Color(0xffD2D2D2)),
                                      ),
                                    ),
                                    Positioned(
                                      child: Image.asset(
                                        "assets/Slicing/Android/4x/Icon awesome-certificate-1.png",
                                        scale: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          : Container(),
                    ],
                  ),

                  //
                  SizedBox(
                    height: 10.h,
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  _isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userData['data']['post'].length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          itemBuilder: (BuildContext context, postIndex) {
                            userData['data']['post'][postIndex]['postMedia'].length;
                            var postLength = userData['data']['post'][postIndex]['postMedia'].length;
                            if (postLength > 1) {
                              postLength = 1;
                            }

                            return Row(
                                children: List.generate(postLength, (medialIndex) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => UserFeeddList(
                                        postList: userData['data']['post'], post: userData['data']['post'][postIndex], userData: userData),
                                  );
                                },
                                child: Container(
                                    width: 122.w,
                                    height: 121.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: Color(0xffD2D2D2),
                                          width: 2.w,
                                        )),
                                    child: ".mp4" == p.extension(userData['data']['post'][postIndex]['postMedia'][medialIndex]['file'])
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(9.r),
                                            child: VideoPlayerWidget(
                                                videoUrl: "https://gymsta-api.jumppace.com:9000/" +
                                                    userData['data']['post'][postIndex]['postMedia'][medialIndex]['file']))
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(9.r),
                                            child: Image(
                                              image: NetworkImage(
                                                  'https://gymsta-api.jumppace.com:9000/${userData['data']['post'][postIndex]['postMedia'][0]['file']}'),
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                              );
                            }));
                          }),

//  Wrap(
//                     spacing: 9,
//                     runSpacing: 12,
//                     children: List.generate(userModel!.post!.length, (index) =>  CachedNetworkImage(imageUrl: userModel!.post!)),
//                   ),
                  // Wrap(
                  //   spacing: 9,
                  //   runSpacing: 12,
                  //   children: [
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 40.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 38.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 41.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 40.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 38.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 41.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 40.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 38.png",
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 122.w,
                  //       height: 121.h,
                  //       child: Image.asset(
                  //         "assets/Slicing/Android/4x/Rectangle 41.png",
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  120.verticalSpace
                ],
              ),
      ),
    );
  }
}
